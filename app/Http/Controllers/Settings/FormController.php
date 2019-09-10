<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use DataTables;

use App\Models\Form;
use App\Models\FormSubmission;

class FormController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth')->except('getFormDetails', 'getFormSubmission', 'storeFormSubmission');
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
            $data['form_details'] =  Form::where('id', $form_id)->select('id', 'title', 'description', 'fields')->first();
        }
        return view('settings.forms.create_edit', $data);
    }

    function formSubmissionsIndex($form_id){
        $data['title'] = $this->browserTitle . " - Form Submissions";
        $form = Form::where('orgId', $this->orgId)->where("id", $form_id)->select('id','title', 'description', "profile_fields")->first();
        $form->profile_fields = unserialize($form->profile_fields);
        $data["form"] = $form;
        return view('settings.forms.submissions', $data);
    }

    public function formSubmissionDetails($form_id, $submission_id){
        $data['title'] = $this->browserTitle . " - Form Submission Details";
        $form = Form::where('id', $form_id)->with(['submissions' =>function($query) use($submission_id){
                            $query->where('id', $submission_id);
                        }])->select('id','title', 'description')->first();
        $data['form'] = $form;
        $data['profile_fields'] = unserialize($form->submissions[0]->profile_fields);
        $data['general_fields'] = unserialize($form->submissions[0]->general_fields);
        $data["submission_id"] = $form->submissions[0]->id;
        // dd($data);
        return view('settings.forms.submission_details', $data);
    }

    public function deleteSubmission($form_id, $submission_id){
        $submission = FormSubmission::where('id', $submission_id)->delete();
        return redirect("/settings/forms/". $form_id ."/submissions");
    }

    public function formFields($form_id){
        $data['title'] = $this->browserTitle . " - Form Submissions";
        $form = Form::where('id', $form_id)->where('orgId', $this->orgId)->select("id", "title", "description")->first();
        $data["form"] = $form;
        
        return view('settings.forms.fields', $data);
    }

    public function formSettings($form_id){
        $data['title'] = $this->browserTitle . " - Form Settings";
        $form = Form::where('orgId', $this->orgId)->where("id", $form_id)->select('id','title', 'description', 'is_active')->first();
        $data["form"] = $form;
        return view('settings.forms.settings', $data);
    }

    public function changeStatus($form_id){
        $data['title'] = $this->browserTitle . " - Form Settings";
        $form = Form::where('orgId', $this->orgId)->where("id", $form_id)->select('id','title', 'description', 'is_active')->first();
        $form->is_active = $form->is_active == 1? 2 : 1;
        $form->save();

        Session::flash('message', 'Form Status has been updated successfully');
        
        $data["form"] = $form;
        return redirect()->back()->with(compact('data'));
    }

    public function getFormSubmission($form_id){
        $form = Form::where('id', $form_id)->first();
        $data['title'] = $this->browserTitle . " - Form Submissions";
        if($form->is_active == 1){
            return view('settings.forms.public_form', $data);
        } else {
            return "Form Session has been expired";
        }
    }

    public function storeOrUpdate(Request $request, $form_id = null){
        $payload = json_decode(request()->getContent(), true);
        $payload = $payload["data"];
        if(isset($form_id)){
            $form = Form::where('id', $form_id)->first();
            $profile_fields = unserialize($form->profile_fields);
            $general_fields = unserialize($form->general_fields);
            foreach($payload['elObject'] as $elObj){
                if($elObj['type'] == 1 && !in_array($elObj['title'], $profile_fields)){
                    $profile_fields[] = $elObj['title'];
                }else if($elObj['type'] == 2 && !in_array($elObj['label'], $profile_fields)){
                    $general_fields[] = $elObj['label'];
                }
            }
            $form->profile_fields = serialize($profile_fields);
            $form->general_fields = serialize($general_fields);
        }else {
            $form = new Form();
            $form->orgId = $this->orgId;
            $profile_fields = [];
            $general_fields = [];
            foreach($payload['elObject'] as $elObj){
                if($elObj['type'] == 1){
                    $profile_fields[] = $elObj['title'];
                }else {
                    $general_fields[] = $elObj['label'];
                }
            }
            $form->profile_fields = serialize($profile_fields);
            $form->general_fields = serialize($general_fields);
        }
        $form->title = $payload["formTitle"];
        $form->description = $payload["formDes"];
        $form->fields = serialize($payload["elObject"]);
        $form->is_active = 1;
        $form->save();
        $data['message'] = 'Form has generated successfuly!';
        $data['id'] = $form->id;
        return response($data, 200);
    }

    public function getFormDetails($form_id){
        try {
            $form = Form::where('id', $form_id)->select('orgId', 'title', 'description', 'fields')->first();
            $result['formTitle'] = $form->title;
            $result['formDes'] = $form->description;
            $result["orgId"] = $form->orgId;
            $result["elObject"] = unserialize($form->fields);

            return $result;
        }
        catch (exception $e) {
            return "Unable to process request, please try later";
        }
    }

    public function getFormsList(){
        $forms = Form::where('orgId', $this->orgId)->select('id','title')->withCount('submissions')->get();
        return $forms;
    }

    public function storeFormSubmission(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $submission = new FormSubmission();
        $submission->form_id = $payload['form_id'];
        $submission->orgId = $payload['orgId'];
        $submission->profile_fields = serialize($payload['profile_fields']);
        $submission->general_fields = serialize($payload['general_fields']);
        $submission->save();
        
        $data['message'] = 'Form has submitted successfuly!';
        return response($data, 200);
    }

    public function getFormSubmissionsList($form_id){
        $form = form::where('id', $form_id)->first();
        $submissions = FormSubmission::where('form_id', $form_id)->orderBy('created_at', 'desc')->get();
        $result = [];
        $fp_fields = unserialize($form->profile_fields);
        $fLength = count($fp_fields);
        foreach ($submissions as $submission) {
            $sp_fields = unserialize($submission->profile_fields);
            
            $row = array();
            $row[] = $sp_fields["Name"];
            $row[] = $sp_fields["Mail Id"];
            foreach($fp_fields as $field){
                $row[] = isset($sp_fields[$field])? $sp_fields[$field] : "";
            }
            $row[] = \Carbon\Carbon::parse($submission->created_at)->format('d-m-Y h:i');
            $link = "/settings/forms/". $form->id ."/submissions/". $submission->id;
            $row[] = "<a href='".$link ."'><i class='fa fa-eye'></i></a>";
            $result[] = $row;
        }

        return Datatables::of($result)->rawColumns([$fLength+3])->make(true);
    }
}
