<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

class GroupController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('getFormDetails', 'getFormSubmission', 'storeFormSubmission');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function index(){
        $data['title'] = $this->browserTitle . " - Asset Management";
        
        return view('groups.list', $data);
    }
}
