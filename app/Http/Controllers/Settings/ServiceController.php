<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use yajra\Datatables\Datatables;
use App\Helpers\CommunicationHelper;

use App\Models\Service;
use App\Models\Events;
use App\Models\MasterLookupData;
use App\Models\SchedulingUser;
use App\Models\CommTemplate;
use App\User;

class ServiceController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
        $this->authUserId = $this->userSessionData['umId'];
    }

    public function serviceIndex(){
        $data['title'] = $this->browserTitle . " - Service List";
        return view('settings.service.index', $data);
    }

    public function getServiceList(){
        $result = array();
        $whereArray=array('orgId'=>$this->orgId);
        $services = Service::selectServiceDetail($whereArray,null,null,null,null,null)->get();
        
        $i = 1;
        foreach ($services as $service) {
            $row = array();
            
            $row[] = $service->id;
            $row[] = $service->name;
            //showConfirm
            $button_html = '<a  onclick="edit_service('.$service->id.')"  data-toggle="tooltip"   href="#"  data-original-title="Edit"><i class="fa fa-edit"></i></a>
                                <a onclick="service_data_delete('.$service->id.')"   href="#"><i class="fa fa-trash"></i></a>';
            
            $row[] = $button_html;
            $result[] = $row;
        }

        //return Datatables::of($result)->rawColumns([6])->make(true);
        return Datatables::of($result)->escapeColumns(['id'])->make(true);

    }

    /**
     * @Function name : getServiceById
     * @Purpose : Select from Service by ID
     * @Added by : Sathish
     * @Added Date : Nov 07, 2018
     */
    public function getServiceById(Request $request) {
        $getServiceById = Service::find($request->get('serviceID'));
        return $getServiceById;
        
    }

    public function storeOrUpdateService(Request $request){
        $ServiceFormData = $request->except('hidden_serviceID');
        $ServiceFormData['createdBy'] = $this->authUserId;
        $ServiceFormData['orgId'] = $this->orgId;
        unset($ServiceFormData['hidden_serviceID'],$ServiceFormData['_token']);
        if($request->get('hidden_serviceID') > 0){
            unset($ServiceFormData['createdBy']);
            $ServiceFormData['updatedBy'] = $this->authUserId;
            $whereArray = array('id' => $request->get('hidden_serviceID'));
            $updateDetails = Service::updateService($ServiceFormData,$whereArray);
            return "updated";            
        }else{
            $insertDetails = Service::create($ServiceFormData);
            if($insertDetails->id > 0){
                return "inserted";
            }else{
                return 0;
            }
        }
    }
 
    /**
     * @Function name : deleteServiceById
     * @Purpose : Delete from Service
     * @Added by : Sathish
     * @Added Date : Nov 07, 2018
     */
    public function deleteServiceById(Request $request) {
        
        $whereArray=array('id'=>$request->get('serviceId'));
        $updateAHDeletedStatus = array('deleted_at' => now(),'deletedBy' => $this->authUserId);  
        Service::crudService($whereArray,null,null,null,null,$updateAHDeletedStatus,null,null);       
   }
}

