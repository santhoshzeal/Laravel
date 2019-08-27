<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use DataTables;
use App\Models\CommTemplate;

class CommunicationController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function getList(){
        $data['title'] = $this->browserTitle . " - Communication Management";

        return view('settings.communications', $data);
    }

    public function getOrgTemplates($template_id = null){
        if(isset($template_id)){
            $templates = CommTemplate::where('org_id', $this->orgId)
                            ->where("id", $template_id)
                            ->select("id", "tag", "name", "subject", "body")->first();
        }else {
            $templates = CommTemplate::where('org_id', $this->orgId)
                            ->select("id", "tag", "name", "subject")->get();
        }
        
        return $templates;
    }

    public function updateOrgTemplate(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $template = CommTemplate::where("id", $payload["id"])
                            ->where("org_id", $this->orgId)->first();
        $template["body"] = $payload["body"];
        $template["name"] = $payload["name"];
        $template["subject"] = $payload["subject"];
        $template->save();

        $data = ["message"=> 'Communication Template has been created successfully'];
        return $data;
    }
}
