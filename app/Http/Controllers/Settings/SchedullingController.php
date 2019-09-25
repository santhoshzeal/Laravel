<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use yajra\Datatables\Datatables;

use App\Models\Schedule;
use App\Models\Events;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\User;

class SchedullingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
        $this->authUserId = $this->userSessionData['umId'];
    }

    public function schedullingIndex(){
        $data['title'] = $this->browserTitle . " - Schedule List";
        return view('settings.schedule.index', $data);
    }

    public function getScheduleList(){
        $result = array();
        $schedules = Schedule::where('orgId', $this->orgId)->with(["event"=>function($query){
                        $query->select('eventId', 'eventName');
                    }, "volunteer"=>function($query1){
                        $query1->select('mldId', 'mldValue');
                    }])->select("id", "event_id", "title", "type_of_volunteer", "date", "time")->get();
        
        $i = 1;
        foreach ($schedules as $schedule) {
            $row = [$i, $schedule->title, $schedule->volunteer->mldValue, $schedule->event->eventName,
                        \Carbon\Carbon::parse($schedule->time)->format('h:i'), \Carbon\Carbon::parse($schedule->data)->format('d-m-Y')];
            $viewLink = url("/settings/schedulling/". $schedule->id);
            $editLink = url("/settings/schedulling/manage/". $schedule->id);
            $row[] = "<a href='".$viewLink ."'><i class='fa fa-eye'></i></a><a href='".$editLink ."'>  <i class='fa fa-pencil-square-o'></i></a>";
            $result[] = $row;
            $i += 1;
        }

        return Datatables::of($result)->rawColumns([6])->make(true);
    }

    public function schedullingDetails($schedule_id){
        $data['title'] = $this->browserTitle . " - Schedule List";
        
        $schedule = Schedule::where('orgId', $this->orgId)->where("id", $schedule_id)
                            ->with(["event"=>function($query){
                                $query->select('eventId', 'eventName');
                            }, "volunteer"=>function($query1){
                                $query1->select('mldId', 'mldValue');
                            }])->first();
        $memberIds = unserialize($schedule->assign_ids);
        if(isset($memberIds) && count($memberIds) > 0){
            $schedule["members"] = User::whereIn("id", $memberIds)->select("id", "profile_pic", "email", "full_name", "mobile_no")->get();
        }else{
            $schedule["members"] = [];
        }
        $data["schedule"] = $schedule;
        return view('settings.schedule.details', $data);
    }
    
    public function createOrEditPage($schedule_id = null){
        $data['title'] = $this->browserTitle . " - Schedule List";
        $data['schedule_id'] =  $schedule_id;
        return view('settings.schedule.create', $data);
    }

    public function notificationList(){
        // $this->generateScheduleNotifications($this->orgId);
        return "Notification List Comes Here";
    }

    public function storeOrUpdateSchedule(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $schedule = null;
        $isNewSchedule = true;
        if(isset($payload['id'])){
            $schedule = Schedule::where("id", $payload["id"])->first();
            $isNewSchedule = true;
        }else{
            $schedule = new Schedule();
            $schedule->orgId = $this->orgId;
        }
        if($payload["building_block"] == ""){ 
            $payload["building_block"] = 99999999;
        }
        // return $payload;
        $fields = ['title', 'date', 'time', 'event_id', 'location_id', 'building_block', 'type_of_volunteer', 'checker_count', 'is_manual_schedule', 'notification_flag'];
        foreach($fields as $field){
            $schedule[$field] = $payload[$field];
        }
        $schedule->assign_ids = serialize($payload["assign_ids"]);
        $schedule->save();

        $this->generateCommunication($payload["assign_ids"], $schedule, $isNewSchedule);
        return ["message"=> "Schedule has been successfully stored or updated"];
    }

    public function createRelatedData(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $schedule = [];
        if(isset($payload["scheduleId"])){
            $schedule = Schedule::where('orgId', $this->orgId)->where("id", $payload["scheduleId"])->first();
            if(isset($schedule->assign_ids)){
                $schedule->assign_ids = unserialize($schedule->assign_ids);
            }
        }
        $volunteer_types = MasterLookupData::where("mldKey", "type_of_volunteer")->where('orgId', $this->orgId)->select("mldId", 'mldKey', 'mldValue')->get();
        if(count($volunteer_types) <= 0){
            $volunteer_types = $this->generateVolunteerTypes($this->orgId);
        } 
        $events = Events::where('orgId', $this->orgId)->select("eventId", 'eventName')->get();
        return ["schedule"=>$schedule, "volunteer_types"=>$volunteer_types, "events"=>$events];
    }

    public function getAssignedMembersList(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $users = User::whereIn('id', $payload["assign_ids"])->select("id", "full_name", "profile_pic", "email")->get();

        return $users;
    }

    public function getMemberSearchList(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $users = User::where('orgId', $this->orgId)
                    ->whereNotIn('id', $payload["exceptIds"])
                    ->where('full_name', 'LIKE', "%" . $payload['searchStr'] . "%")
                    ->orWhere("email", $payload['searchStr'])
                    ->orWhere("mobile_no",$payload['searchStr'])
                    ->select('id', "full_name", 'email', 'profile_pic')
                    ->get();
        return $users;
    }

    static function generateVolunteerTypes($orgId){
        $data = array(
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"checker"),
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"service"),
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"helper")
        );
        MasterLookupData::insert($data);
        return MasterLookupData::where("mldKey", "type_of_volunteer")->where('orgId', $orgId)->select("mldId", 'mldKey', 'mldValue')->get();
    }

    static function generateCommunication($userIds, $schedule, $isNewSchedule = true){  
        // if($isNewSchedule == true){
        //     $subject = "Event Scheduled for ". $schedule->title;
        //     $body = "A reminder that the event schedule '" .$schedule->title . "' has been allocated on ". $schedule->time . " ". $schedule->date;
        //     generateCommunicationsWithPlain($subject, $body, $orgId, $createdUserId, $userIds);
        // }else {
        //     SchedulingUser::whereNotIn('user_id', $userIds)->delete();
        //     $existingUserIds = SchedulingUser::where("scheduling_id", $schedule->id)->pluck('user_id');
        //     foreach($userIds as $userId){
        //         if(!in_array($userId, $existingUserIds)){
        //             $this->updateUserComm($userId, $schedule);
        //         } else 
        //     }
        // }
    }

    static function updateUserComm($userId, $schedule){
        // generateCommunicationsWithPlain($subject, $body, $orgId, $createdUserId, $ToUserIdsArray)
        // $scheduleUser = new SchedulingUser();
        // $scheduleUser->orgId = $this->orgId;
        
        // $scheduleUser->scheduling_id = $schedule->id;
        // $scheduleUser->user_id = $user_id;
        // $scheduleUser->token = substr(sha1(time()), 0, 150);
        // $scheduleUser->save();
    }
}

// * 4 schedule_auto_notify
//  * 5 schedule_manual_notify
//  * 6 schedule_confirmation
//  * 7 schedule_reminder
//  * 8 schedule_check_out_notification_to_guest

