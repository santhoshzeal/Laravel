<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

use App\Models\GroupType;

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
