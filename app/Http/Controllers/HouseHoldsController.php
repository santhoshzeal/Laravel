<?php
namespace App\Http\Controllers;


use Illuminate\Http\Request;
use DB;
use Config;
use App\Helpers\CustomHelperFunctions;
use File;
use Response;
use App\Models\UserMaster;
use App\Models\Households;
use App\Models\HouseholdDetails;

class HouseHoldsController extends Controller
{
   
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
    }
    public function index()
    {
        $data['title'] = $this->browserTitle . " - Household Management";
        
        //return view('checkin.index',$data);
    }
    

    /**
     * @Function name : displayHousehold
     * @Purpose : displayHousehold
     * @Added by : Sathish
     * @Added Date : Jun 12, 2019
     */
    public function displayHousehold(Request $request) {        
        $data['title'] = $this->browserTitle . " - Report Checkin";        
        
        
        $whereArray = array('users.id' => $request->user_id);
        $data['selectUserMasterDetail'] = UserMaster::selectUserMasterDetail($whereArray,null,null,null,null,null)->get()[0];
        
        $whereHHArray = array('orgId' => $data['selectUserMasterDetail']->orgId,'hhdUserId'=>$data['selectUserMasterDetail']->user_id);
        
        $whereHDArray = array('hhdUserId'=>$data['selectUserMasterDetail']->user_id);
        $data['crudHouseholdDetails'] = HouseholdDetails::crudHouseholdDetails($whereHDArray,null,null,null,null,null,null,'1')->get();
        if($data['crudHouseholdDetails']->count() > 0){
            $hhIdValues = array_column($data['crudHouseholdDetails']->toArray(),'hhId');
            $whereInHHDArray = array('household_details.hhId'=>$hhIdValues);
            $data['crudHouseholdsData'] = Households::crudHouseholdsData(null,$whereInHHDArray,null,null,null,null)->get();
            foreach($data['crudHouseholdsData'] as $value){
                
                $hh_pic_image= url('/assets/uploads/organizations/avatar.png');
                if($value->profile_pic != null){
                    $hh_pic_image_json = json_decode(unserialize($value->profile_pic));
                    $hh_pic_image = $hh_pic_image_json->download_path.$hh_pic_image_json->uploaded_file_name;
                }
                $hhdValue[$value->hhdName][] = array("hhId" => $value->hhId,
                        "orgId" => $value->orgId,
                        "hhPrimaryUserId" => $value->hhPrimaryUserId,
                        "hhdName" => $value->hhdName,
                        "createdBy" => $value->createdBy,
                        "hhdId" => $value->hhdId,
                        "hhdUserId" => $value->hhdUserId,
                        "first_name" => $value->first_name,
                        "last_name" => $value->last_name,
                        "life_stage" => $value->life_stage,
                        "hhIsPrimary" => $value->hhIsPrimary,
                        "starmark"=>($value->hhIsPrimary == 1 ? '<i class="fa fa-star" style="color: gold;"></i>' : ''),
                        "hh_pic_image" => $hh_pic_image,
                        "hhIsPrimary" => $value->hhIsPrimary);
            }
            
            $data['hhdValue'] = $hhdValue;
        }
        
        return response::json([
                    'view_household_details' => view('household.member_hh_popip_load', $data)->render()
                ]);
//        return response::json([
//                    'view_invoice_details' => view('invoice.invoice_details', $data['invoice_details'])->render(),
//                    'view_owner_details' => view('invoice.invoice_owner_details', $data['owner_details'])->render()
//                ]);
        return view('household.member_hh_popip_load',$data);
        
    }
}