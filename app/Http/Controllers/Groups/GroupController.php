<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use Response;
use App\Models\Group;
use App\Models\GroupEvent;
use App\Models\GroupMember;
use DB;
use DataTables;
use Auth;
class GroupController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function groupsList(){
        $data['title'] = $this->browserTitle . " - Groups List";
        return view('groups.list', $data);
    }

    public function groupsListPagination(){
        $groupList = Group::getGroups("")->get();
        $count =DB::select('SELECT FOUND_ROWS() as record_count');
        $count = $count[0]->record_count;

        $items = array();
        foreach($groupList as $item) {
            $html=' <div class="card m-b-5 border border-primary group p-0">
            <a href="'.url("groups/details/".$item->id).'" class="wrapper-link">

                            <div class="card-body p-0">

                            <div class="row no-gutters">


                                    <div class=" col-md-12 group-header" style=\'height: 116px;background-image: url("https://groups-production.s3.amazonaws.com/uploads/group/header_image/defaults/medium_6.png");\'>

                                      <div class="grouptype-name " ><h6 class="text-center">'.ucwords($item->name).'</h6></div>




                                    </div>



                             </div></div>

                             <div class="card-body">
                                <div class="row text-center">
                                    <div class="col-md-6">Last Meeting</div>
                                    <div class="col-md-6">Last Meeting</div>
                                    <div class="col-md-6">None</div>
                                    <div class="col-md-6">None</div>
                                </div>
                            </div>
                            <div class="card-body">
                            <div class="row text-center">
                                <div class="col-md-12">Members</div>
                                <div class="col-md-12">0</div>

                            </div>
                        </div> </a>
                             </div>';
            $items[] = $html;
        }
        return response()->json(
            [
                'success' => '1',
                "items" => $items,
                "count" =>$count
            ]
            );
    }


    public function groupDetails($id,$type = null) {
        $groupDetails =Group::getGroupDetails($id);
        $activeTab = "members";
        if($type!=""){
            $activeTab = $type;
        }

        $data['activeTab'] =$activeTab;
        $data['groupId'] =$id;
        $data['title'] = $this->browserTitle . " - Group Details";
        $groupDetails->img = "https://groups-production.s3.amazonaws.com/uploads/group/header_image/defaults/medium_6.png";
        $data["groupDetails"] = $groupDetails;
        //return view('groups.group.group-details', $data);
        return view('groups.groups_details_view', $data);
    }

    public function membersList(Request $request){
        $groupId = $request->groupId;
        $members  =GroupMember::membersList($groupId,$request->search['value']);
        return DataTables::of($members)
                        ->addColumn('action', function($row) {

                            $btn = '<div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                              Action
                            </button>
                            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

                              <a class="dropdown-item" href="javascript:removeMember('.$row->id.')">Remove from group</a>
                              <a class="dropdown-item" href="javascript:editMembershipDate('.$row->id.')">Edit Membership date</a>
                              <a class="dropdown-item" href="javascript:makeLeader('.$row->id.')">Make leader</a>
                            </div>
                          </div>';


                            return $btn;
                        })
                        ->addColumn('role', function($row) {
                            return ($row->role==2)?"Member":"Leader";
                        })

                        ->addColumn('member_since', function($row) {
                            return date('d-M-Y',strtotime($row->member_since));
                        })


                        ->rawColumns(['action',])
                        ->make(true);

        print_r($members->get());
    }

    public function addMembers(Request $request){

        $data['title'] = $this->browserTitle . " - Groups List";
        $data['groupId'] = 1;
        return view('groups.group.add_members', $data);
    }

    public function getUsersList(Request $request) {
        $search = $request->phrase;
        $groupId = $request->groupId;
        //dd($search);exit();
        $usersList = Group::getUserListForAutocomplete($search,$groupId); //'id', 'first_name', 'last_name'
        $users = array();

        foreach ($usersList as $user) {
            $disabled = true;
            if($user->group_members_id == null || $user->group_members_id == "null"){
                $disabled = false;
            }
            $users[] = array("text"=>$user->first_name." ".$user->last_name,"id"=>$user->id,"disabled"=>$disabled);
        }
    //print_r($usersList);

    return response()->json(
                           $users
                    );
    }
    public function groupAddMember(Request $request) {
        $user_id = $request->selectedUser;
        $groupId = $request->groupId;

        if($user_id && $groupId > 0 && $groupId && $groupId > 0){
            $insertData['group_id'] = $groupId;
            $insertData['user_id'] = $user_id;
            $insertData['createdBy'] = Auth::id();
            $insertData['orgId'] = Auth::user()->orgId;

            GroupMember::create($insertData);

            return response()->json(
                [
                    'success' => '1',
                    "message" => '<div class="alert alert-success">
                                                         <strong>Saved!</strong>
                                                   </div>'
                ]
);

        }
    }

    public function memberAction(Request $request){
        $action = $request->action;
        $memberId = $request->memberId;
        if($action =="remove") {
            $model = GroupMember::find( $memberId );
            $model->delete();
        }
        if($action =="update_date") {
            GroupMember::where("id", $memberId)
                        ->update(
                            [
                                "member_since"=>date("Y-m-d h:i:s",strtotime($request->member_since)),
                                "updatedBy"=> Auth::id()
                            ]
                        );
        }
        if($action =="make_leader") {
            GroupMember::where("id", $memberId)
                        ->update(
                            [
                                "role"=>1,
                                "updatedBy"=> Auth::id()
                            ]
                        );
        }
    }


    /*** events */

    public function addEvents(Request $request){

        $data['title'] = $this->browserTitle . " - ";
        $data['groupId'] = $request->groupId;
        return view('groups.group.add_events', $data);
    }

    public function groupAddEvents(Request $request){
        $insertData = $request->all();

        $eventId = $request->eventId;

        //validation rules




        $insertData = $request->except(['_token', 'eventId',]);
        $insertData["isMutiDay_event"] = 0;
        if($request->isMutiDay_event){
            $insertData["isMutiDay_event"] = 1;
        }

        if ($eventId > 0) { //update
            $insertData['updatedBy'] = Auth::id();


            GroupEvent::where("id", $eventId)->update($insertData);
        } else { //insert
            $insertData['createdBy'] = Auth::id();
            $insertData['orgId'] = Auth::user()->orgId;

            GroupEvent::create($insertData);
        }

        return response()->json(
                        [
                            'success' => '1',
                            "message" => '<div class="alert alert-success">
                                                                 <strong>Saved!</strong>
                                                           </div>'
                        ]
        );
    }

    public function eventsList(Request $request) {
        $groupId = $request->groupId;
        $members  =GroupEvent::eventsList($groupId,$request->search['value']);
        return DataTables::of($members)
                        ->addColumn('action', function($row) {

                            $btn = '<a onclick="editEvent(' . $row->id . ')"  class="edit btn btn-primary btn-sm ">Edit</a>';



                            return $btn;
                        })
                        ->addColumn('start', function($row) {
                            return date('d-M-Y',strtotime($row->start_date))." ".$row->start_time;
                        })

                        ->addColumn('end', function($row) {
                            return date('d-M-Y',strtotime($row->end_date))." ".$row->end_time;
                        })


                        ->rawColumns(['action',])
                        ->make(true);
    }

    public function editEvent($eventId, Request $request){
        $data['title'] = $this->browserTitle . " - ";
        $data['groupId'] = $request->groupId;
        $data['event'] = GroupEvent::find($eventId);
        return view('groups.group.add_events', $data);
    }
}
