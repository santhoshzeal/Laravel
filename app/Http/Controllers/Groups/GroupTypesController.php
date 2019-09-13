<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

use Models\GroupType;

class GroupTypesController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('getFormDetails', 'getFormSubmission', 'storeFormSubmission');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function apiGetTypes(){
        $groupTypes = GroupType::where("orgId", $this->orgId)->select("id", "name")->orderBy('created_at', 'desc')->get();

        if(count($groupTypes) < 1){
            $groupsTypes[] = $this->createInitialGroupType();
        }
        
        return $groupTypes;
    }

    static function createInitialGroupType(){
        $groupType = GroupType::create([
                        orgId => $this->orgId,
                        name => "Small groups"
                    ]);
        return [id => $groupType->id, name => $groupType->name];
    }
}
