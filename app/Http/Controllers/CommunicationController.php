<?php
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use DB;
use Config;
use App\Models\UserMaster;

use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Middleware;
use DataTables;
use App\User;
use App\Lookup;

class CommunicationController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
    }

    public function userCommunicationsIndex($personal_id){
        $data['title'] = $this->browserTitle . " - Communication Management";
        $user = User::where('personal_id', $personal_id)->first();
        $lookup = Lookup::where('mldId', $user['name_prefix'])->select('mldValue')->first();
        $user['name_prefix'] = $lookup->mldValue;
        $data['user'] = $user;
        $data['isCommPage'] = true; 
        return view('members.communication.index', $data);
    }

    public function getUserCommunications($personal_id){
        $result = array();
        // $user = User::where('personal_id', $personal_id)->with(['communications' => function($query){
        //                         $query->orderBy('subject', 'desc')->select("tag", "subject", "body", 'from_user_id')
        //                                 ->with(["createdUser" => function($query1){
        //                                     $query1->select("id", "full_name");
        //                                 }]);
        //                     }])->select("id", "orgId")->first();

        $user = User::where('personal_id', $personal_id)->first();

        $slNo = 1;
        foreach ($user->communications as $comm) {
            $row = array();
            $row[] = $slNo;
            $row[] = $comm->tag;
            $row[] = $comm->subject;
            $row[] = $comm->body;
            // $row[] = $comm->pivot["read_status"];
            // $row[] = $comm->pivot["delete_status"];
            $row[] = $comm->createdUser["full_name"];
            $row[] = \Carbon\Carbon::parse($comm->pivot["created_at"])->format('d-m-Y h:i');
            $result[] = $row;
            $slNo += 1;
        }

        return Datatables::of($result)->escapeColumns(['user_id'])->make(true);
    }

    public function index()
    {
        $data['title'] = $this->browserTitle . " - Communication Management";
        
        return view('communication.index',$data);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $data['title'] = $this->browserTitle . " - Role Create";
        $data['permissions'] = Permission::all();//Get all permissions
        return view('roles.create', $data);
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name'=>'required|unique:roles|max:10',
            'permissions' =>'required',
            ]
        );
        $role = new Role();
        $role->name = $request->name;
        $role->save();
        if($request->permissions <> ''){
            $role->permissions()->attach($request->permissions);
        }
        return redirect()->route('roles.index')->with('success','Roles added successfully');
    }
   
     public function edit($id) {
        $role = Role::findOrFail($id);
        $permissions = Permission::all();
        return view('roles.edit', compact('role', 'permissions'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request,$id)
    {
        $role = Role::findOrFail($id);//Get role with the given id
    //Validate name and permission fields
        $this->validate($request, [
            'name'=>'required|max:10|unique:roles,name,'.$id,
            'permissions' =>'required',
        ]);
        $input = $request->except(['permissions']);
        $role->fill($input)->save();
        if($request->permissions <> ''){
            $role->permissions()->sync($request->permissions);
        }
        return redirect()->route('roles.index')->with('success','Roles updated successfully');
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Role  $role
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $role = Role::findOrFail($id);
        $role->delete();
        return redirect()->route('roles.index')
            ->with('success',
             'Role deleted successfully!');
    }

    /**
     * @Function name : messages
     * @Purpose : Member Listin
     * @Added by : Sathish    
     * @Added Date : Jul 03, 2019
     */
    public function messages()
    {
        $data['title'] = $this->browserTitle. " - Member Communication";        
        
        $whereArray = array('personal_id' => $this->userSessionData['umPersonal_id']);
        $data['selectUserMasterDetail'] = UserMaster::selectUserMasterDetail($whereArray,null,null,null,null,null)->get()[0];
        
        return view('communication.message_list',$data);
    }
}