<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

use App\Models\GroupType;
use Illuminate\Http\Response;
use DataTables;
use Auth;
class GroupTypesController extends Controller
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

    public function groupTypes(){
        $data['title'] = $this->browserTitle . " - Group Types";

        return view('groups.types', $data);
    }

    public function groupTypesList(Request $request){
        $groupTypes = GroupType::getGroupTypesList($request->search['value']);

        return DataTables::of($groupTypes)
                        ->addColumn('action', function($row) {
                            $html=' <div class="card m-b-5 border border-primary">
                            <div class="card-body ">

                            <div class="row no-gutters">


                                    <div class=" col-md-8 ">

                                      <div class="grouptype-name "><h6>'.$row->name.'</h6></div>
                                       <div class="grouptype-desc"> '.$row->description.'</div>



                                    </div> <div class="col-md-3">
                                                    <button class="btn btn-outline-primary" onclick="groupDefaults(\''.$row->name.'\','.$row->id.')">Group Defaults</button>
                                                    <button class="btn btn-outline-primary" onclick="viewGroups('.$row->id.')">View Groups</button>
                             </div></div></div></div></div>';

                            return $html;
                        })

                        ->rawColumns(['action'])
                        ->make(true);
    }

    public function createGroupTypesPage(){
        $data['title'] = $this->browserTitle . " - ";
        return view('groups.group_types.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request) {
        $insertData = $request->all();

        $groupTypeId = $request->groupTypeId;

        //validation rules

        if($request->isPublic){
            $insertData['isPublic'] = 1;
        }else {
            $insertData['isPublic'] = 0;
        }





        if ($groupTypeId > 0) { //update


            $insertData = $request->except(['_token', 'groupTypeId']);
            $insertData['updatedBy'] = Auth::id();


            $d_visible_leaders_fields = "";
            if($request->d_visible_leaders_fields) {
                $d_visible_leaders_fields =  json_encode($request->d_visible_leaders_fields);

            }
            $insertData['d_visible_leaders_fields'] = $d_visible_leaders_fields;

            $d_visible_members_fields = "";
            if($request->d_visible_members_fields) {
                $d_visible_members_fields =  json_encode($request->d_visible_members_fields);

            }
            $insertData['d_visible_members_fields'] = $d_visible_members_fields;

            $insertData['d_enroll_autoClose_on'] =NULL;
            $insertData['d_enroll_autoClose_count'] =NULL;
            $insertData['d_enroll_notify_count'] =NULL;


            if($request->d_is_enroll_autoClose){
                $insertData['d_enroll_autoClose_on'] =date("Y-m-d",strtotime($request->d_enroll_autoClose_on));
            }
            else {
                $insertData['d_is_enroll_autoClose'] = 0;
            }
            if($request->d_is_enroll_autoClose_count){
                $insertData['d_enroll_autoClose_count'] =$request->d_enroll_autoClose_count;
            }
            else {
                $insertData['d_is_enroll_autoClose_count'] = 0;
            }
            if($request->d_is_enroll_notify_count){
                $insertData['d_enroll_notify_count'] =$request->d_enroll_notify_count;
            }
            else {
                $insertData['d_is_enroll_notify_count'] = 0;
            }

            //print_r($insertData);
            GroupType::where("id", $groupTypeId)->update($insertData);
        } else { //insert
            $insertData['createdBy'] = Auth::id();
            $insertData['orgId'] = Auth::user()->orgId;

            GroupType::create($insertData);
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

    public function groupDefaults($groupTypeId){
        $data['title'] = $this->browserTitle . " - ";

        $data['groupType'] = GroupType::find($groupTypeId);

        return view('groups.group_types.group-type-default', $data);
    }


    public function reports(){
        $data['title'] = $this->browserTitle . " - Group Reports";

        return view('groups.reports', $data);
    }

    public function events(){
        $data['title'] = $this->browserTitle . " - Group Events";

        return view('groups.events', $data);
    }

    public function resources(){
        $data['title'] = $this->browserTitle . " - Group Resources";

        return view('groups.resources', $data);
    }

    public function apiGetTypes(){
        $groupTypes = GroupType::where("orgId", $this->orgId)->select("id", "name")->orderBy('created_at', 'desc')->get();

        if(count($groupTypes) < 1){
            $groupTypes[] = $this->createInitialGroupType($this->orgId);
        }

        return $groupTypes;
    }

    static function createInitialGroupType($orgId){
        $groupType = new GroupType();
        $groupType->orgId = $orgId;
        $groupType->name = "Small groups";
        $groupType->save();
        return ["id" => $groupType->id, "name" => $groupType->name];
    }
}
