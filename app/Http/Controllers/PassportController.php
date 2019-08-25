<?php

namespace App\Http\Controllers;
//use Illuminate\Support\Facades\DB;

use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Middleware;
use Redirect;
use Illuminate\Support\MessageBag;
use Illuminate\Support\Facades\Input;
use Validator;

use App\Role;
use App\Permission;
use App\Models\Organization;
use App\Models\ModelHasRoles;
use App\Models\MasterLookupData;

use DB;
use Config;

use App\Models\Roles;
use Camroncade\Timezone\Facades\Timezone;

use App\Models\UserMaster;
use App\Models\CommTemplate;
class PassportController extends Controller {

    
    public function __construct() {
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->common_file_upload_path = Config::get('constants.FILE_UPLOAD_PATH');
        
        if (\Request::route('org_domain')) {
            $this->org_domain = \Request::route('org_domain');
        } else {
            $this->org_domain = \Request::segment(3);
        }
        //dd("URL : ".url('/login').'/'.$this->org_domain);
        //dd($this->org_domain);
        //$this->crudOrganizationData = array();
        $whereArray = array('orgDomain' => $this->org_domain);
        $crudOrganization = Organization::crudOrganization($whereArray,null,null,null,null,null,null,'1')->get();
        //dd($crudOrganization);
        //if($crudOrganization->count() > 0){
        $this->crudOrganizationData = $crudOrganization;
        //}
        //dd($this->crudOrganizationData);
    }
    
    public function login_page(Request $request) {
        
        $data['title'] = $this->browserTitle . " - Login";
        $data['crudOrganizationData'] = $this->crudOrganizationData;
        return view('auth.login', $data);
    }
    
    /**
     * Handles Registration Request
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {
        
        $data['title'] = $this->browserTitle . " - Create Account";
        //$data['dateTimezone'] = Timezone::selectForm();
        $data['dateTimezone'] = Timezone::selectForm(
        '', 
        'Select Timezone', 
        ['class' => 'form-control', 'name' => 'orgTimeZone', 'id' => 'orgTimeZone']
        );
        $data['crudOrganizationData'] = $this->crudOrganizationData;
        
        return view('auth.register', $data);
        
        
    }

    /**
     * Handles Login Request
     *
     * @param Request $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request) {
        
        $data['title'] = $this->browserTitle . " - Login";
        $credentials = [
            'email' => $request->email,
            'password' => $request->password
        ];//dd($credentials);
        //admin@admin.com
        if (auth()->attempt($credentials)) {
            $userData = Auth::user();
            $whereArrayUser = array('users.id' => $userData['id']);
            $data['selectFromUserCustom'] = $selectFromUserCustom = User::selectFromUserCustom($whereArrayUser)->get();
            //dd($selectFromUserCustom[0]['user_id']);
            //return response()->json(['userData' => $userData->only(['id', 'name', 'email'])], 200);
            $token = auth()->user()->createToken('dollar')->accessToken;
            $resultSetSessionArray["umId"] = $userData['id'];
            $resultSetSessionArray["umName"] = $userData['name'];
            $resultSetSessionArray["umEmail"] = $userData['email'];
            $resultSetSessionArray["umUserRoleId"] = $selectFromUserCustom[0]['user_role_id'];
            $resultSetSessionArray["umUserRoleName"] = $selectFromUserCustom[0]['user_role_name'];
            $resultSetSessionArray["umUserRoleTag"] = $selectFromUserCustom[0]['user_role_tag'];
            $resultSetSessionArray["umOrgId"] = $selectFromUserCustom[0]['orgId'];
            $resultSetSessionArray["umPersonal_id"] = $selectFromUserCustom[0]['personal_id'];
            
            Session::put('userSessionData', $resultSetSessionArray);

            //dd($resultSetSessionArray,Session::get('userSessionData'));
            if ($request->segment(1) == "webapp") {

                return redirect('/home');
            } else {
                return response()->json(['result_code' => 1,'token' => $token, 'result' => $resultSetSessionArray], 200);
            }
        } else {
            if ($request->segment(1) == "webapp") {
                $errors = new MessageBag(['email' => ['Email and/or password invalid.']]);
                return Redirect::back()->withErrors($errors)->withInput(Input::except('password'));
            } else {
                return response()->json(['result_code' => 2,'failure' => 'UnAuthorised Access'], 401);
            }
        }
    }

    public function organizationRegister(Request $request) {

        DB::beginTransaction();

        try {
            
            $validator = Validator::make($request->all(), [
                        'orgName' => 'required',
                        'first_name' => 'required',
                        'email' => 'required|email',
                        'password' => 'required',
                        'orgDomain' => 'required',
            ]);
            if ($validator->fails()) {
                
                return Redirect::back()->withErrors($validator->errors())->withInput(Input::except('password'));
            }
            
            


            $randomString = strtolower(str_random(4));
            $orgFormData = $request->except('first_name','email','username','password','confirm_password');
            //Insert into organization table
            $insertOrganization = Organization::create($orgFormData);
            
            if($insertOrganization->orgId > 0){
                
                //Insert into roles table
                $select = Role::where('orgId',0)
                  ->where('role_tag','!=','superadmin')
                  ->select(array(DB::raw("'$insertOrganization->orgId'"),'name','guard_name','role_tag'));
                DB::table('roles')->insertUsing(['orgId','name','guard_name','role_tag'], $select);
                //////
                
                //Insert into permissions table
                $selectPermission = Permission::where('orgId',0)
                  //->where('role_tag','!=','superadmin')
                  ->select(array(DB::raw("'$insertOrganization->orgId'"),'name','guard_name'));
                
                
                DB::table('permissions')->insertUsing(['orgId','name','guard_name'], $selectPermission);
                //////
                
                //insert into role_has_permissions with admin role
                $rolesAdminData = DB::table('roles')->where('orgId',$insertOrganization->orgId)->where('role_tag','admin')->get();
                
                
                $permissionsData = DB::table('permissions')->where('orgId',$insertOrganization->orgId)->get();
                if($permissionsData->count() > 0){
                    foreach($permissionsData as $permissionsDataValue){
                        $data_permission_insert[] = array('permission_id'=>$permissionsDataValue->id,'role_id'=>$rolesAdminData[0]->id);
                    }
                    DB::table('role_has_permissions')->insert($data_permission_insert);
                }
                
                //////////

                //insert into role_has_permissions with other role
                $rolesOtherData = DB::table('roles')->where('orgId',$insertOrganization->orgId)->where('role_tag','!=','admin')->get();
                
                
                $permissionsOtherData = DB::table('permissions')->where('orgId',$insertOrganization->orgId)->first();

                
                foreach($rolesOtherData as $rolesOtherDataValue){
                    $data_permission_other_insert[] = array('permission_id'=>$permissionsOtherData->id,'role_id'=>$rolesOtherDataValue->id);
                }

                DB::table('role_has_permissions')->insert($data_permission_other_insert);
                ///////
                
                $userFormData = $request->except('orgName','orgTimeZone','confirm_password');
                $userFormData['orgId'] = $insertOrganization->orgId;
                $userFormData['referal_code'] = substr($request->first_name, 0, 4) . $randomString;
                $lastUserMasterDet = UserMaster::orderBy('id','DESC')->get();
                $lastUserId=0;
                if($lastUserMasterDet->count() > 0){
                    $lastUserId = $lastUserMasterDet->first()->id;
                }
                $newPersonal_id = str_pad($lastUserId + 1, 10, "0", STR_PAD_LEFT);
                
                $userFormData['personal_id'] = $newPersonal_id;
                $userFormData['householdName'] = $request->first_name."'s household";
                $userFormData['full_name'] = $request->first_name;
            
                $insertUser = User::create($userFormData);
                
                //insert into model_has_roles with admin role
                DB::table('model_has_roles')->insert(array('role_id'=>$rolesAdminData[0]->id,'model_type'=>'App\User','model_id'=>$insertUser->id));
                //////////
                $todaysDate=date('Y-m-d H:i:s');
                //Insert into master_lookup_data table
                $selectMasterLookupData = MasterLookupData::where('orgId',0)
                  //->where('role_tag','!=','superadmin')
                  ->select(array(DB::raw("'$insertOrganization->orgId'"),'mldKey','mldValue','mldType','mldOption',DB::raw("'$todaysDate'"),DB::raw("'$todaysDate'")));
                
                
                DB::table('master_lookup_data')->insertUsing(['orgId','mldKey','mldValue','mldType','mldOption','created_at','updated_at'], $selectMasterLookupData);
                //////
                
                $request['roles'] = 2;
                if ($request->roles <> '') {
                    $insertUser->roles()->attach($request->roles);
                }
                
                
                //Insert into communication templates table
                $selectTemplaes = CommTemplate::where('org_id',0)
                  ->select(array(DB::raw("'$insertOrganization->orgId'"),'tag', 'name','subject','body'));
                
                
                DB::table('comm_templates')->insertUsing(['org_id','tag', 'name','subject','body'], $selectTemplaes);
                //////
                
                
            }else{
                //return redirect()->route('register')->with('failure', $e->getMessage());
                return response()->json(['result_code' => 0,'message' => $e->getMessage()], 200);
            }
            
            $urlHere = url('/login').'/'.$request->orgDomain;
            DB::commit();
            $logindetails = "Login URL : <a href='".$urlHere."'>".$urlHere."</a>";
            //, 'logindetails' => $logindetails
            return response()->json(['result_code' => 1, 'message' => 'Account has been created', 'logindetails' => $logindetails], 200);
            return redirect()->back()->with('message', 'Account has been created');
            
            
        }catch (\Illuminate\Database\QueryException $e) {
            DB::rollback();            
            return response()->json(['result_code' => 0,'message' => $e->getMessage()], 200);
            return Redirect::back()->withErrors( $e->getMessage());
            
            
        // something went wrong with the transaction, rollback
        }  catch (\Exception $e) {
            DB::rollback();
            return response()->json(['result_code' => 0,'message' => $e->getMessage()], 200);
            return Redirect::back()->withErrors( $e->getMessage());
            
            
        }
    }

    /**
     * Returns Authenticated User Details
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function details() {
        return response()->json(['user' => auth()->user()], 200);
    }

    /**
     * Display Logout Page
     *
     * @return View
     */
    public function logout(Request $request) {
        if ($request->segment(1) == "webapp") {
            Auth::logout();
            Session::flush();
            return redirect('/login/'.$request->segment(3));
        } else {
            if (Auth::check()) {
                Auth::user()->AauthAcessToken()->delete();
            }
        }

        return response()->json(['status' => 'Logout'], 200);
        
    }
    
    /**
     * @Function name : checkOrganizationDomain
     * @Purpose : Check org domain exist
     * @Added by : Sathish    
     * @Added Date : Nov 07, 2018
     */
    
   public function checkOrganizationDomain(Request $request)
   {
       $whereArrayAT = array('orgDomain' => $request->orgDomain);
       $selectFromOrganization = Organization::selectFromOrganization($whereArrayAT)->get()->count();
       if($selectFromOrganization > 0){
           return "found";
       }
       return "notfound";
   }

   /**
     * @Function name : checkUniqueEmailPerOrganization
     * @Purpose : Check org per email exist
     * @Added by : Sathish    
     * @Added Date : Nov 07, 2018
     */
    
   public function checkUniqueEmailPerOrganization(Request $request)
   {
       $whereArrayAT = array('orgId' => $request->orgId,'email' => $request->email);
       $selectFromUserMaster = UserMaster::selectFromUserMaster($whereArrayAT)->get()->count();
       if($selectFromUserMaster > 0){
           return "found";
       }
       return "notfound";
   }
   
   /**
     * @Function name : memberRegister
     * @Purpose : memberRegister
     * @Added by : Sathish    
     * @Added Date : Nov 07, 2018
     */
    
   public function memberRegister(Request $request)
   {
       DB::beginTransaction();

        try {
            
            $validator = Validator::make($request->all(), [
                        'first_name' => 'required',
                        'email' => 'required|email',
                        'password' => 'required'
            ]);
            if ($validator->fails()) {
                
                return Redirect::back()->withErrors($validator->errors())->withInput(Input::except('password'));
            }
            $randomString = strtolower(str_random(4));
            
            $rolesAdminData = DB::table('roles')->where('orgId',$request->orgId)->where('role_tag','member')->get();
            
            
            
            $userFormData = $request->except('confirm_password');
            $userFormData['orgId'] = $request->orgId;
            $userFormData['referal_code'] = substr($request->first_name, 0, 4) . $randomString;
            $lastUserId = UserMaster::orderBy('id','DESC')->first();
            $newPersonal_id = str_pad($lastUserId->id + 1, 10, "0", STR_PAD_LEFT);

            $userFormData['personal_id'] = $newPersonal_id;
            $userFormData['householdName'] = $request->first_name."'s household";

            $insertUser = User::create($userFormData);
            
            //insert into model_has_roles with admin role
            DB::table('model_has_roles')->insert(array('role_id'=>$rolesAdminData[0]->id,'model_type'=>'App\User','model_id'=>$insertUser->id));
            
            DB::commit();
            return redirect()->back()->with('message', 'Account has been created');
            
        }
        catch (\Illuminate\Database\QueryException $e) {
            DB::rollback();            
            //return response()->json(['result_code' => 0,'message' => $e->getMessage()], 200);
            return Redirect::back()->withErrors( $e->getMessage());
            
            
        // something went wrong with the transaction, rollback
        }  catch (\Exception $e) {
            DB::rollback();
            //return response()->json(['result_code' => 0,'message' => $e->getMessage()], 200);
            return Redirect::back()->withErrors( $e->getMessage());
            
            
        }
   }
   
}
