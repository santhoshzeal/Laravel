<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use yajra\Datatables\Datatables;
use App\Helpers\CommunicationHelper;

use App\Models\Schedule;
use App\Models\Giving;
use App\Models\Events;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\Models\CommTemplate;
use App\Models\Team;
use App\User;
use Auth;


class GivingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];		
        $this->authUserId = $this->userSessionData['umId'];
    }

    public function givingIndex(){
        $data['title'] = $this->browserTitle . " - Givings List";
        return view('givings.index', $data);
    }

    public function getGivingList(){
        $result = array();
        $schedules = Schedule::where('orgId', $this->orgId)->with(["event"=>function($query){
                        $query->select('eventId', 'eventName');
                    }, "volunteer"=>function($query1){
                        $query1->select('mldId', 'mldValue');
                    }])->select("id", "event_id", "title")->orderBy("id", "desc")->get();
        
        $i = 1;
        foreach ($schedules as $schedule) {
            $row = [$i, $schedule->title,  $schedule->event->eventName];
            $viewLink = "";//<a href='".url("/settings/schedulling/". $schedule->id) ."'><i class='fa fa-eye'></i></a>
            $editLink = url("/settings/schedulling/manage/". $schedule->id);
            $row[] = "<a href='".$editLink ."'>  <i class='fa fa-pencil-square-o'></i></a>";
            $result[] = $row;
            $i += 1;
        }

        return Datatables::of($result)->rawColumns([3])->make(true);
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
    
    public function createOrEditPage($giving_id = null){
		
        $data['title'] = $this->browserTitle . " - Giving List";
		
        $data['giving_id'] =  $giving_id;
		
		$data['user_id'] = Auth::id();
		
		$data['orgId'] = $this->userSessionData['umOrgId'];
		
		//dd($this->orgId);
        //$whereTeamArray=array('orgId'=>$this->orgId);		
        //$data['team_id'] = Team::selectFromTeam($whereTeamArray)->get();		

        $whereUEArray=array('orgId'=>$this->orgId);
		
        $eventsData = array();
		
        $crudEvents = Events::crudEvents($whereUEArray,null,null,null,null,null,null,'1')->get();
		
        //dd($crudEvents);
        foreach ($crudEvents as $key=>$crudEventsvalue) {
            if(strtotime($crudEventsvalue->eventCreatedDate) >= strtotime(date('Y-m-d')))
            {
                //dd($crudEventsvalue->eventCreatedDate);$key=>
                $eventsData[] = $crudEventsvalue;
            }
            
        }
        //dd(count($eventsData));
        $data['upcoming_events']=$eventsData;
        //dd($data['team_id']->get()->toArray(),$whereTeamArray);
        
        if($giving_id){
			
            $whereSchArray = array('id'=>$giving_id);
			
            $crudGiving = Giving::crudGiving($whereSchArray,null,null,null,null,null,null,'1')->get();
			
            if($crudGiving->count() > 0){
                $data['crudGiving'] = $crudGiving[0];
            }else{
                return redirect('settings/givings');
            }
            
        }
        //dd($data['crudGiving']->count());
        return view('givings.create', $data);
    }

    public function notificationList(){
        $data['title'] = $this->browserTitle . " - Schedule Notifications List";
        return view('settings.schedule.notification', $data);
    }

    public function storeOrUpdateGivings(Request $request){
		
        $payload = $request->all();
		
		//dd($this->orgId);
		
        dd($payload);
		
        //dd($arraySUUpdate,$request->all());
		
        $giving = null;
		
        $isNewSchedule = true;
		
        if(isset($payload['givingId'])){
            $giving = Giving::where("id", $payload["givingId"])->first();
            $isNewSchedule = false;
        }
		else
		{
            $giving = new Giving();
            $giving->orgId = $this->orgId;
        }
		
        //dd($giving);
        // return $payload;
		
        $fields = ['user_id', 'orgId', 'event_id', 'email', 'first_name', 'middle_name', 'last_name','mobile_no'];
		
        foreach($fields as $field) {
			
            $giving[$field] = $payload[$field];
        }
		
        dd($giving);
		
        $giving->save();
		
		
        /*if($request->get('position_id_assign') != null || $request->get('position_id_assign') != ""){
            foreach($request->get('position_id_assign') as $posids){

                $arraySUUpdate = array("orgId"=>$this->orgId,"scheduling_id"=>$schedule->id,"team_id"=>$request->get('team_id'),"position_id"=>$posids,"user_id"=>$request->get('position_id_user_id_assign_'.$posids),"status"=>1);

                SchedulingUser::updateOrCreate(array("orgId"=>$this->orgId,"scheduling_id"=>$schedule->id,"team_id"=>$request->get('team_id'),"position_id"=>$posids), $arraySUUpdate);
                //echo $posids;,"user_id"=>$request->get('position_id_user_id_assign_'.$posids)
            }    
        }*/
        
        return redirect('settings/givings/');
		
        return ["message"=> "Givings has been successfully stored or updated"];
    }

 
}

