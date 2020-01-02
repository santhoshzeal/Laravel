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
use App\Models\PaymentGateways;
use App\Models\PaymentMethodOthers;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\Models\CommTemplate;
use App\Models\Team;
use App\Models\UserMaster;
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
										
	    $givings = Giving::where('orgId', $this->orgId)->select("id", "type", "amount")->orderBy("id", "desc")->get();
        			
        $i = 1;
        foreach ($givings as $giving) {
			
			if($giving->type == 1){
				$type = 'Donation';
			}else{
				$type = 'Event';
			}
			
            $row = [$i, $type, $giving->amount];
            $viewLink = "";
            //$editLink = url("/settings/givings/manage/". $giving->id);
            //$row[] = "<a href='".$editLink ."'>  <i class='fa fa-pencil-square-o'></i></a>";
            $result[] = $row;
            $i += 1;
        }

        return Datatables::of($result)->rawColumns([3])->make(true);
    }

    
    public function createOrEditPage($giving_id = null){
		
        $data['title'] = $this->browserTitle . " - Giving List";
		
        $data['giving_id'] =  $giving_id;
		
		//$data['user_id'] = Auth::id();
		
		$data['orgId'] = $this->userSessionData['umOrgId'];
		
		$wherArray = array('orgId'=> $this->userSessionData['umOrgId']);
		
		$data['user_id'] = UserMaster::crudUserMasterDetail($wherArray,null,null,null,null,null,null,'1')->get();
		
	
	    $whereOrgArray=array('orgId'=>$this->orgId,'active'=>1);
        $data['payment_mode'] = PaymentGateways::selectFromPaymentGateways($whereOrgArray)->get();
		
		
		$whereOrgArray=array('orgId'=>$this->orgId,'status'=>1);
        $data['other_payment_mode'] = PaymentMethodOthers::selectFromPaymentMethodOthers($whereOrgArray)->get();
			
		//dd($data['payment_mode']);
		
		
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


    public function storeOrUpdateGivings(Request $request){
		
        $payload = $request->all();
		
		//dd($this->orgId);
		
        //dd($payload);
		
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
		
        $fields = ['type', 'user_id', 'orgId', 'event_id', 'email', 'first_name', 'middle_name', 'last_name','mobile_no','payment_mode_id','sub_payment_mode_id','amount','pay_mode'];
		
        foreach($fields as $field) {
			
            $giving[$field] = $payload[$field];
        }
		
        //dd($giving);
		
        $giving->save();
		       
        return redirect('settings/givings/');
		
        return ["message"=> "Givings has been successfully stored or updated"];
    }

 
}

