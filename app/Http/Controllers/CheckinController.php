<?php
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use DB;
use Config;
use App\Models\Events;
use App\Models\Checkins;
use DataTables;
use Auth;
class CheckinController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
    }
    public function index($eventId=0)
    {
        $data['title'] = $this->browserTitle . " - Checkin Management";
		
		if($eventId > 0) {
			$eventDetails = Events::getEventsDetails($eventId);
			$data['eventDetails'] = $eventDetails;
		}
        
        return view('checkin.index',$data);
    }
    
    
    public function logCheckin(Request $request) {
        
        $insertData = array(
            "eventId"=>$request->eventId,
            "user_id"=>$request->userId,
            "chINDateTime"=>date("Y-m-d h:i:s"),
            "chKind"=>1,
            "createdBy"=> Auth::id()
        );
        
        Checkins::create($insertData);
        //print_r($request->all());
    }
    
     public function logCheckout(Request $request) {
        
        $updatetData = array(
            "chOUTDateTime"=>date("Y-m-d h:i:s"),
            "updatedBy"=> Auth::id()
        );
        
        Checkins::where("chId",$request->chId)->update($updatetData);
        //print_r($request->all());
    }
    
     public function checkInList(Request $request) {
         
         $data = array(
             "eventId"=>$request->eventId,
             "searchText" =>$request->search['value']
         );
         $events = Checkins::listCheckins($data);
        
        return DataTables::of($events)
                    
                    ->addColumn('checkInUser', function($events){
                        
                        $userImg = url('assets/uploads/profile').'/user.jpg';
                        
                        $profilePic = $events->profile_pic;
                        
                        
                           $btn = '<div class="row checkin-user">

                                 
                                    <div class=" col-md-1 image-container">
                                      <img src="'.$userImg.'" class="checkin-user-img" style="height:50px; " />
                                    </div>

                                    <div class=" col-md-8 ">  

                                      <div class="checkin-user-name">'.$events->first_name."".$events->last_name.'</div>
                                       <div class="checkin-user-details"> '.$events->chKind.'
                                       <span>@'.date('h:i A', strtotime($events->chINDateTime)).'</span>
                                        </div>
                                    </div>';
                                    if($events->chOUTDateTime == "" ||  $events->chOUTDateTime =="NULL"){
                                        
                                        $btn.=' <div class="col-md-3">  
                                                    <button class="btn" onclick="checkOutUser('.$events->chId.','.$events->eventId.','.$events->user_id.')">Check Out</button>
                                                </div>';
                                    }
                                    else {
                                        $btn.=' <div class="col-md-3 ">  
                                                    <span>@'.date('h:i A', strtotime($events->chOUTDateTime)).'</span>
                                                </div>';
                                    }
                                   
                                    
                                    $btn.= '</div>
                                    
                       </div>';
     
                            return $btn;
                    })
                    ->rawColumns(['checkInUser'])
                    ->make(true);
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
     * @Function name : adultCheckin
     * @Purpose : adultCheckin
     * @Added by : Sathish
     * @Added Date : Jun 12, 2019
     */
    public function adultCheckin(Request $request) {        
        $data['title'] = $this->browserTitle . " - Adult Checkin";        
        return view('checkin.adult',$data);
    }

    /**
     * @Function name : childCheckin
     * @Purpose : childCheckin
     * @Added by : Sathish
     * @Added Date : Jun 12, 2019
     */
    public function childCheckin(Request $request) {        
        $data['title'] = $this->browserTitle . " - Child Checkin";        
        return view('checkin.child',$data);
    }

    /**
     * @Function name : notificationCheckin
     * @Purpose : notificationCheckin
     * @Added by : Sathish
     * @Added Date : Jun 12, 2019
     */
    public function notificationCheckin(Request $request) {        
        $data['title'] = $this->browserTitle . " - Notification Checkin";        
        return view('checkin.notification',$data);
    }

    /**
     * @Function name : reportCheckin
     * @Purpose : reportCheckin
     * @Added by : Sathish
     * @Added Date : Jun 12, 2019
     */
    public function reportCheckin(Request $request) {        
        $data['title'] = $this->browserTitle . " - Report Checkin";        
        return view('checkin.report',$data);
    }
}