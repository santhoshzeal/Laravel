<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

class TagsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function tagsIndex(){
        $data['title'] = $this->browserTitle . " - Group Tags List";
        
        return view('groups.tags', $data);
    }
}
