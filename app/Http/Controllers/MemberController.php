<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Config;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Redirect;
use App\Lookup;
use App\User;


class MemberController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
    }

    /*
    ** Purpose: Create a new member or edit a member if id present
    */
    public function createOrEdit($personal_id = null) {
        $orgId = $this->userSessionData['umOrgId'];
        $keys = ["school_name", "name_prefix", "name_suffix", "marital_status", "grade_name"];
        $keys1 = ["school_name", "name_prefix", "name_suffix", "marital_status", "grade_id"];

        

        if($personal_id){
            $user = User::where('orgId', $orgId)->where("personal_id", $personal_id)->first();
            if($user){
                $fullAdr = explode("///",$user['address']);
                $user['street_address'] = $fullAdr[0];
                $user['apt_address'] = isset($fullAdr[1])? $fullAdr[1]:'';
                $user['city_address'] = isset($fullAdr[2])? $fullAdr[2]:'';
                $user['state_address'] = isset($fullAdr[3])? $fullAdr[3]:'';
                $user['zip_address'] = isset($fullAdr[4])? $fullAdr[4]:'';
                $data['user'] = $user;
            } else {
                return redirect('people/member/management');
            }
            $data['title'] = $this->browserTitle . " - Member Edit";
        } else {
            $data['title'] = $this->browserTitle . " - Member Create";
        }
        $lookupData = Lookup::memberQueryData($orgId, $keys);
        foreach($keys1 as $key){
            $data[$key] = $lookupData[$key];
        }
        return view('members.member_create', $data);
    }

    public function storeOrUpdate(Request $request, $personal_id=null){
        $validator = Validator::make($request->all(), [
            'email' => 'required|email|Regex:/^([a-zA-Z0-9]+[a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,})$/',
            ]);
        if ($validator->passes()) {
            $user = null;
            if($personal_id){
                $user = User::where('personal_id', $personal_id)->first();
            }else {
                $user = new User();
                $user['orgId'] = $this->userSessionData['umOrgId'];
                $user['referal_code'] = substr($request->first_name, 0, 4) .strtolower(str_random(4));
                $count = User::count();
                $user['personal_id'] = str_pad($count + 1, 10, "0", STR_PAD_LEFT);
                $user['password'] = "password";
                $request[''] = 2;
            }
            $user['address'] = $request->street_address."///".$request->apt_address."///".$request->city_address."///".$request->state_address."///".$request->zip_address;
            $user['householdName'] = $request->first_name."'s household";

            $keys= ['name_prefix', 'first_name', 'last_name', 'name_suffix', 'given_name', 'nick_name',
                     'email', 'mobile_no', 'life_stage', 'gender', 'dob', 'marital_status', 'doa', 'school_name', 
                     'grade_id', 'medical_note', 'social_profile'
                ];
            foreach($keys as $key){
                $user[$key] = $request[$key];
            }
            $user->save();
            if($personal_id){
                Session::flash('message', 'Member profile has been updated successfully');
            } else {
                Session::flash('message', 'Member profile has been created successfully');
            }
           
            return redirect('people/member_directory');
        } else {
            return Redirect::back()
                            ->withInput($request->except('password'))
                            ->withErrors($validator);
        }
    }
}