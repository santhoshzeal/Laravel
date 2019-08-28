<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

class FormController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }
    public function formIndex(){
        $data['title'] = $this->browserTitle . " - People Forms";

        return view('settings.forms.index', $data);
    }

    public function createOrEdit($form_id = null){
        $data['title'] = $this->browserTitle . " - Manage Form";
        if(isset($form_id)){

        }
        return view('settings.forms.create_edit', $data);
    }

}
