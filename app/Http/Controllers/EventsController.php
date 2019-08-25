<?php
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use DB;
use Config;
use App\Models\Events;
use Illuminate\Http\Response;
use DataTables;
use Auth;
class EventsController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
    }
    public function index()
    {
        $data['title'] = $this->browserTitle . " - Event Management";
       
        return view('events.index',$data);
    }
    
    
    
    public function createPage(Request $request){
         $data['title'] = $this->browserTitle . " - Create Event";      
        return view('events.create_page',$data);
    }
    
    
   
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $insertData = $request->all();
        
        $eventId = $request->eventId;
        
        //validation rules
        
        $insertData = $request->except(['eventId','_token','eventChildCare','eventBuildingBlock','eventBookedFor','eventRoom','eventSuggestedResources','eventNotification']);
        
        if($eventId > 0) { //update
            $insertData['updatedBy']= Auth::id();
            
            Events::where("eventId",$eventId)->update($insertData);
        }
        else { //insert
            $insertData['createdBy']= Auth::id();
           
            Events::create($insertData);
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
   
    public function listEvents(Request $request)
    {
        $events = Events::listEvents();
        
        return DataTables::of($events)
                    
                    ->addColumn('action', function($row){
                            $btn = '<a onclick="editEvents('.$row->eventId.')"  class="edit btn btn-primary btn-sm ">Edit</a>';
                           $btn.= '&nbsp;&nbsp;<a href="'.url('/').'/checkin/'.$row->eventId.'" class="edit btn btn-primary btn-sm">Show</a>';
     
                            return $btn;
                    })
                    ->rawColumns(['action'])
                    ->make(true);
    }
    
     public function edit($id) {
        $data['title'] = $this->browserTitle . " - Create Event";
        $event = Events::findOrFail($id);
       
        $data['event'] = $event;
        return view('events.create_page',$data);
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