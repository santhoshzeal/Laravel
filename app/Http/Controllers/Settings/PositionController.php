<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use yajra\Datatables\Datatables;
use App\Helpers\CommunicationHelper;

use App\Models\Position;
use App\Models\Events;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\Models\CommTemplate;
use App\User;

class PositionController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
        $this->authUserId = $this->userSessionData['umId'];
    }

    public function positionIndex(){
        $data['title'] = $this->browserTitle . " - position List";
        return view('settings.position.index', $data);
    }

    public function getPositionList(){
        $result = array();
        $whereArray=array('orgId'=>$this->orgId);
        $positions = Position::selectPositionDetail($whereArray,null,null,null,null,null)->get();
        
        $i = 1;
        foreach ($positions as $position) {
            $row = array();
            
            $row[] = $position->id;
            $row[] = $position->name;
            //showConfirm
            $button_html = '<a  onclick="edit_position('.$position->id.')"  data-toggle="tooltip"   href="#"  data-original-title="Edit"><i class="fa fa-edit"></i></a>
                                <a onclick="position_data_delete('.$position->id.')"   href="#"><i class="fa fa-trash"></i></a>';
            
            $row[] = $button_html;
            $result[] = $row;
        }

        //return Datatables::of($result)->rawColumns([6])->make(true);
        return Datatables::of($result)->escapeColumns(['id'])->make(true);

    }

    /**
     * @Function name : getPositionById
     * @Purpose : Select from Position by ID
     * @Added by : Sathish
     * @Added Date : Nov 07, 2018
     */
    public function getPositionById(Request $request) {
        $getPositionById = Position::find($request->get('positionID'));
        return $getPositionById;
        
    }

    public function storeOrUpdatePosition(Request $request){
        $PositionFormData = $request->except('hidden_positionID');
        $PositionFormData['createdBy'] = $this->authUserId;
        $PositionFormData['orgId'] = $this->orgId;
        unset($PositionFormData['hidden_positionID'],$PositionFormData['_token']);
        if($request->get('hidden_positionID') > 0){
            unset($PositionFormData['createdBy']);
            $PositionFormData['updatedBy'] = $this->authUserId;
            $whereArray = array('id' => $request->get('hidden_positionID'));
            $updateDetails = Position::updatePosition($PositionFormData,$whereArray);
            return "updated";            
        }else{
            $insertDetails = Position::create($PositionFormData);
            if($insertDetails->id > 0){
                return "inserted";
            }else{
                return 0;
            }
        }
    }
 
    /**
     * @Function name : deletePositionById
     * @Purpose : Delete from Position
     * @Added by : Sathish
     * @Added Date : Nov 07, 2018
     */
    public function deletePositionById(Request $request) {
        
        $whereArray=array('id'=>$request->get('positionId'));
        $updateAHDeletedStatus = array('deleted_at' => now(),'deletedBy' => $this->authUserId);  
        Position::crudPosition($whereArray,null,null,null,null,$updateAHDeletedStatus,null,null);       
   }
}

