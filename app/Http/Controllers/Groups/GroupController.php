<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use Response;
use App\Models\Group;
use App\Models\GroupMember;
use DB;
use DataTables;
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
                            $btn = '<a onclick="editRoom(' . $row->id . ')"  class="edit btn btn-primary btn-sm ">Edit</a>';


                            return $btn;
                        })
                        ->addColumn('role', function($row) {
                            return ($row->role==1)?"Member":"Leader";
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

}
