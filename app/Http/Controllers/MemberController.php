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
use App\Household;
use App\HouseholdDetail;


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

            $keys= ['name_prefix', 'first_name','middle_name', 'last_name', 'name_suffix', 'given_name', 'nick_name',
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
           
            return redirect('people/member/'.$user->personal_id);
        } else {
            return Redirect::back()
                            ->withInput($request->except('password'))
                            ->withErrors($validator);
        }
    }

    public function viewMember($personal_id){
        $orgId = $this->userSessionData['umOrgId'];
        $user = User::where('orgId', $orgId)->where("personal_id", $personal_id)->first();
        $fullAdr = explode("///",$user['address']);
        $user['address'] = $fullAdr[0];
        $user['address'] .= isset($fullAdr[1])? ','. $fullAdr[1]:'';
        $user['address'] .= isset($fullAdr[2])? ','. $fullAdr[2]:'';
        $user['address'] .= isset($fullAdr[3])? ','. $fullAdr[3]:'';
        $user['address'] .= isset($fullAdr[4])? '-'. $fullAdr[4]:'';
        // Getting Master loook data
        $keys = ["school_name", "name_prefix", "name_suffix", "marital_status"];
        $lookUpKeys = [];
        foreach($keys as $key){
            if(isSet($user[$key])){
                $lookUpKeys[] = $user[$key];
            }
        }
        if(isSet($user["grade_id"])){
            $lookUpKeys[] = $user["grade_id"];
        }

        $lookUpData = Lookup::whereIn('mldId', $lookUpKeys)->select('mldKey', 'mldValue')->get();
        $keys[] = 'grade_name';
        foreach($lookUpData as $lookupRow){
            foreach($keys as $key){
                if($lookupRow['mldKey'] == $key){
                    $user[$key] = $lookupRow['mldValue'];
                }
            }
        }
        $data['title'] = $this->browserTitle . " - Member View";
        
        $data['user'] = $user;

        return view('members.member_view', $data);
    }

    public function getHouseholderList($personal_id){
        $mainUser = User::where('personal_id', $personal_id)->first();
        $households = [];
        $i = 0;
        foreach($mainUser->households as $hh){
            $households[$i]['id'] = $hh->id;
            $households[$i]['name'] = $hh->name;
            $j = 0;
            foreach($hh->users as $huser){
                $user = [];
                $user['id'] = $huser->id;
                $user['first_name'] = $huser->first_name;
                $user['middle_name'] = $huser->middle_name;
                $user['last_name'] = $huser->last_name;
                $user['personal_id'] = $huser->personal_id;
                $user['email'] = $huser->email;
                $user['mobile_no'] = $huser->mobile_no;
                $user['isPrimary'] = $huser->pivot->isPrimary;
                $this->extractAddress($user, $huser);
                $fullAdr = explode("///",$huser['address']);
                $user['address'] = $fullAdr[0];
                $user['address'] .= isset($fullAdr[1])? ','. $fullAdr[1]:'';
                $user['address'] .= isset($fullAdr[2])? ','. $fullAdr[2]:'';
                $user['address'] .= isset($fullAdr[3])? ','. $fullAdr[3]:'';
                $user['address'] .= isset($fullAdr[4])? '-'. $fullAdr[4]:'';
                $fullAdr = explode("///",$user['address']);
                $households[$i]['users'][] = $user;
            }
             $i++;
        }
        return $households;
    }

    public function getHhUserSearch(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $orgId = $this->userSessionData['umOrgId'];
        $users = User::where('orgId', $orgId)
                    ->where("id", '!=', $payload['id'])
                    ->where('first_name', 'LIKE', '%' . $payload['searchStr'] . "%")
                    ->orWhere("middle_name", 'LIKE', "%" . $payload['searchStr'] . "%")
                    ->orWhere("last_name", "LIKE", "%" . $payload['searchStr'] . "%")
                    ->select('first_name', 'middle_name', "last_name","mobile_no", 'email', 'personal_id', 'profile_pic', 'address')
                    ->get();
        foreach($users as $user){
            $this->extractAddress($user, $user);
        }
        
        return $users; 
    }

    public function extractAddress($duser, $suser){
        $fullAdr = explode("///",$suser['address']);
        $duser['address'] = $fullAdr[0];
        $duser['address'] .= $fullAdr[1] === null? ', '. $fullAdr[1]:'';
        $duser['address'] .= $fullAdr[2] === null? ', '. $fullAdr[2]:'';
        $duser['address'] .= $fullAdr[3] === null? ', '. $fullAdr[3]:'';
        $duser['address'] .= $fullAdr[4] === null? ' - '. $fullAdr[4]:'';
        $duser['address1'] = $suser['address'];
    }
}