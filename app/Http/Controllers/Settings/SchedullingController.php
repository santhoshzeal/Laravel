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

class SchedullingController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function schedullingIndex(){
        $data['title'] = $this->browserTitle . " - Schedule List";
        
        return view('settings.schedule.index', $data);
    }

    public function getScheduleList(){
        $result = array();
        $schedules = Schedule::where('orgId', $this->orgId)->with(["event"=>function($query){
                        $query->select('id', 'name');
                    }, "volunteer"=>function($query1){
                        $query1->select('mldId', 'mldValue');
                    }])->select("id", "event_id", "title", "type_of_volunteer", "date", "time")->get();
        
        $i = 1;
        foreach ($schedules as $schedule) {
            $row = [$i, $schedule->title, $schedule->event->name,$schedule->volunteer->mldValue, 
                        \Carbon\Carbon::parse($schedule->data)->format('d-m-Y'), $schedule->time];
            $link = "/settings/schedulling/". $schedule->id;
            $row[] = "<a href='".$link ."'><i class='fa fa-eye'></i></a>";
            $result[] = $row;
            $i += 1;
        }

        return Datatables::of($result)->make(true);
    }

    public function createOrEditPage($schedule_id = null){
        $data['title'] = $this->browserTitle . " - Schedule List";
        $data['schedule_id'] =  $schedule_id;
        return view('settings.schedule.create', $data);
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

    static function generateVolunteerTypes($orgId){
        $data = array(
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"checker"),
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"service"),
            array('orgId'=>$orgId, 'mldKey'=> "type_of_volunteer", "mldValue"=>"helper")
        );
        MasterLookupData::insert($data);
        return MasterLookupData::where("mldKey", "type_of_volunteer")->where('orgId', $orgId)->select("mldId", 'mldKey', 'mldValue')->get();
    } 
}
