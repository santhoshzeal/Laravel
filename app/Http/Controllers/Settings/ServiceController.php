<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use yajra\Datatables\Datatables;
use App\Helpers\CommunicationHelper;

use App\Models\Service;
use App\Models\Events;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\Models\CommTemplate;
use App\User;

class ServiceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
        $this->authUserId = $this->userSessionData['umId'];
    }

    public function serviceIndex(){
        $data['title'] = $this->browserTitle . " - Service List";
        return view('settings.service.index', $data);
    }

    public function getServiceList(){
        $result = array();
        $whereArray=array('orgId'=>$this->orgId);
        $services = Service::selectServiceDetail($whereArray,null,null,null,null,null)->get();
        
        $i = 1;
        foreach ($services as $service) {
            $row = array();
            
            $row[] = $service->id;
            $row[] = $getDailyQuotesListsData->dqText;
            $row[] = date('d-M-Y',strtotime($getDailyQuotesListsData->dqPublishDate));
            
            $edit_url = url("/") . "/adddaily_quotes/" . $getDailyQuotesListsData->dqID;

            $button_html = '<div class="btn-group">
                                <button type="button" class="btn btn-primary btn-icon dropdown-toggle" data-toggle="dropdown">
                                    <i class="icon-menu7"></i> &nbsp;Action
                                </button>

                                <ul class="dropdown-menu dropdown-menu-right">
                                    <li><a   data-toggle="tooltip"   href="' . $edit_url . '"  data-original-title="Edit"><i class="icon-pencil"></i> Edit</a></li> 
                                    <li><a onclick="daily_quotes_data_delete('.$getDailyQuotesListsData->dqID.')" href="#"><i class="icon-trash"></i> Delete</a></li>
                                </ul>
                            </div>';
            
            $row[] = $button_html;
            $result[] = $row;
        }

        //return Datatables::of($result)->rawColumns([6])->make(true);
        return Datatables::of($result)->escapeColumns(['id'])->make(true);

    }

    public function schedullingDetails($service_id){
        $data['title'] = $this->browserTitle . " - Service List";
        
        $service = Service::where('orgId', $this->orgId)->where("id", $service_id)
                            ->with(["event"=>function($query){
                                $query->select('eventId', 'eventName');
                            }, "volunteer"=>function($query1){
                                $query1->select('mldId', 'mldValue');
                            }])->first();
        $memberIds = unserialize($service->assign_ids);
        if(isset($memberIds) && count($memberIds) > 0){
            $service["members"] = User::whereIn("id", $memberIds)->select("id", "profile_pic", "email", "full_name", "mobile_no")->get();
        }else{
            $service["members"] = [];
        }
        $data["service"] = $service;
        return view('settings.service.details', $data);
    }
    
    public function createOrEditPage($service_id = null){
        $data['title'] = $this->browserTitle . " - Service List";
        $data['service_id'] =  $service_id;
        return view('settings.service.create', $data);
    }

    public function notificationList(){
        $data['title'] = $this->browserTitle . " - Service Notifications List";
        return view('settings.service.notification', $data);
    }

    public function storeOrUpdateService(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $service = null;
        $isNewService = true;
        if(isset($payload['id'])){
            $service = Service::where("id", $payload["id"])->first();
            $isNewService = false;
        }else{
            $service = new Service();
            $service->orgId = $this->orgId;
        }
        if($payload["building_block"] == ""){ 
            $payload["building_block"] = 99999999;
        }
        // return $payload;
        $fields = ['title', 'date', 'time', 'event_id', 'location_id', 'building_block', 'type_of_volunteer', 'checker_count', 'is_manual_service', 'notification_flag'];
        foreach($fields as $field){
            $service[$field] = $payload[$field];
        }
        $service->assign_ids = serialize($payload["assign_ids"]);
        $service->save();

        $this->generateCommunication($this->orgId, $this->authUserId, $payload["assign_ids"], $service, $isNewService);
        return ["message"=> "Service has been successfully stored or updated"];
    }

    public function getNotificationsList($template_id = null){
        $notificationTags = ["service_auto_notify", "service_manual_notify", "service_confirmation", "service_reminder", "service_check_out_notification_to_guest", "thank_you_for_service", "service_cancelled"];
        $templates = [];
        if(isset($template_id)){
            $templates = CommTemplate::where('org_id', $this->orgId)
                            ->where("id", $template_id)
                            ->select("id", "tag", "name", "subject", "body")->first();
        }else {
            $templates = CommTemplate::where('org_id', $this->orgId)
                            ->whereIn("tag", $notificationTags)
                            ->select("id", "tag", "name", "subject")->get();
            if(count($templates) < count($notificationTags)){
                $templates = $this->generateNotificationTemplates($this->orgId, $notificationTags);
            }
        }
        return $templates;
    }

    public function createRelatedData(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $service = [];
        if(isset($payload["serviceId"])){
            $service = Service::where('orgId', $this->orgId)->where("id", $payload["serviceId"])->first();
            if(isset($service->assign_ids)){
                $service->assign_ids = unserialize($service->assign_ids);
            }
        }
        $volunteer_types = MasterLookupData::where("mldKey", "type_of_volunteer")->where('orgId', $this->orgId)->select("mldId", 'mldKey', 'mldValue')->get();
        if(count($volunteer_types) <= 0){
            $volunteer_types = $this->generateVolunteerTypes($this->orgId);
        } 
        $events = Events::where('orgId', $this->orgId)->select("eventId", 'eventName')->get();
        return ["service"=>$service, "volunteer_types"=>$volunteer_types, "events"=>$events];
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

    static function generateCommunication($orgId, $createdUserId, $userIds, $service, $isNewService = true){  
        if($isNewService == true){
            CommunicationHelper::generateCommunications('service_manual_notify', $orgId, 1, $createdUserId, $userIds, $service->id);
        }else {
            
            $existingUserIds = SchedulingUser::where("scheduling_id", $service->id)->pluck('user_id')->toArray();
            $removedUserIds = array_diff($existingUserIds, $userIds);
            $newUserIds = array_diff($userIds, $existingUserIds);
            $inserRecords = [];
            foreach($newUserIds as $userId){
                $record = [];
                $record["orgId"] = $orgId;
                $record["scheduling_id"] = $service->id;
                $record["user_id"] = $userId;
                $record["token"] = substr(sha1(time()), 0, 150).rand ( 199999999, 9999999999999999 );

                $inserRecords[] = $record;
            }
            SchedulingUser::insert($inserRecords);
            SchedulingUser::where("scheduling_id", $service->id)->whereIn('user_id', $removedUserIds)->delete();
            CommunicationHelper::generateCommunications('service_manual_notify', $orgId, 1, $createdUserId, $newUserIds, $service->id);
            CommunicationHelper::generateCommunications('service_canceled', $orgId, 1, $createdUserId, $removedUserIds, $service->id);
        }
    }

    static function generateNotificationTemplates($orgId, $tags){
        foreach($tags as $tag){
            $template = CommTemplate::where("org_id", $orgId)->where("tag", $tag)->first();
            if(!isset($template)){
            $defaultTemplate = CommTemplate::where('tag', $tag)->where('org_id', 0)->first();
            CommTemplate::create([
                                'tag' => $defaultTemplate->tag,
                                'name' => $defaultTemplate->name,
                                'subject' => $defaultTemplate->subject,
                                'body' => $defaultTemplate->body,
                                'org_id' => $orgId
                            ]);
            }
        }
        $templates = CommTemplate::where("org_id", $orgId)->whereIn("tag", $tags)->select("id", "tag", "name", "subject")->get();
        dd($templates);
        exit;
    }
}

