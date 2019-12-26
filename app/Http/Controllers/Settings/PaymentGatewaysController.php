<?php

namespace App\Http\Controllers\Settings;


use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Session;
use App\Http\Controllers\Controller;
use App\Models\PaymentGateways;
use App\Models\Resources;
use App\Models\Roles;
use App\Models\Organization;
use App\Models\PaymentGatewayParameters;
use DB;
use Config;
use DataTables;
use Auth;


class PaymentGatewaysController extends Controller {

    public function __construct() {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->common_file_upload_path = Config::get('constants.FILE_UPLOAD_PATH');
        $this->common_file_download_path = Config::get('constants.FILE_DOWNLOAD_PATH');
        $this->userSessionData = Session::get('userSessionData');
    }

    public function index() {

        $data['title'] = $this->browserTitle . " - Payment Gateways Management";
		
        return view('settings.payment_gateways.index', $data);
    }


    public function list(Request $request){
		
		$orgId = Auth::user()->orgId;
		
        $payment_gateways = PaymentGateways::listPaymentGatewaysValues($orgId);

        return DataTables::of($payment_gateways)
		
                        ->addColumn('action', function($row) {							
                            $btn = '<a class="nav-link" href="payment_gateways/edit/'.$row->payment_gateway_id.'"><i class="fa fa-lg"></i>Edit</a>';
                            return $btn;
                        })

                        ->rawColumns(['action','image'])
                        ->make(true);
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeOrUpdate(Request $request)
    {
        
		$insertData = $request->all();
		
		$orgId = $request->orgId;
		
		//dd($orgId);
		
		dd($insertData);
		
		//if($orgId > 0) { //update
		
		  
		//}
        //else 
		//{
			$insertData = $request->except(['_token']);

			$insertData['createdBy']= Auth::id();
			
			$insertData['orgId']= Auth::user()->orgId;
			
			if($request['payment_gateways'] == 1){
				
				$insertData['gateway_name'] = "Stripe";
			}
			if($request['payment_gateways'] == 2){
				
				$insertData['gateway_name'] = "Paypal";
			}
			if($request['payment_gateways'] == 3){
				
				$insertData['gateway_name'] = "Others";
			}
	
		     PaymentGateways::create($insertData);
		//}
		
		

        return response()->json(
                    [
                            'success' => '1',
                            "message" => '<div class="alert alert-success"><strong>Saved!</strong></div>'
                    ]
						);

    }

    public function editPaymentGateways(Request $request,$orgId) {
		
		$data['title'] = $this->browserTitle . " - ";
		
		//$org = PaymentGateways::findOrFail($orgId);

        //$data['org'] = $org;		
		  
		$data['gatewayId']  =  $request->segment(4);
		
		$whereArray = array('payment_gateway_id' => $request->segment(4));
		
        $selectFromPaymentGatewayParameters = $data['selectFromPaymentGatewayParameters']  = PaymentGatewayParameters::selectFromPaymentGatewayParameters($whereArray,null,null,null,null,null)->get();
			
        return view('settings.payment_gateways.create',$data);
		
    }

}
