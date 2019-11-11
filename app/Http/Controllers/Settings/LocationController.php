<?php

namespace App\Http\Controllers\Settings;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Location;
use DB;
use Config;
use App\Models\Resources;
use App\Models\Roles;
use Illuminate\Http\Response;
use DataTables;
use Auth;

class LocationController extends Controller {

    public function __construct() {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->common_file_upload_path = Config::get('constants.FILE_UPLOAD_PATH');
        $this->common_file_download_path = Config::get('constants.FILE_DOWNLOAD_PATH');
    }

    public function index() {

        $data['title'] = $this->browserTitle . " - Location Management";

        return view('settings.location.index', $data);
    }

    public function list(Request $request){
        $locations = Location::listLocations($request->search['value']);

        return DataTables::of($locations)
                        ->addColumn('action', function($row) {
                            $btn = '<a onclick="editLocation(' . $row->id . ')"  class="edit btn btn-primary btn-sm ">Edit</a>';


                            return $btn;
                        })


                        ->rawColumns(['action','image'])
                        ->make(true);
    }

    public function addPage(Request $request){
        $data['title'] = $this->browserTitle . " - Location Management";

        return view('settings.location.create', $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $insertData = $request->all();

        $locationId = $request->locationId;

        //validation rules

        $insertData = $request->except(['locationId','_token']);

        if($locationId > 0) { //update
            $insertData['updatedBy']= Auth::id();


            Location::where("id",$locationId)->update($insertData);
        }
        else { //insert
            $insertData['createdBy']= Auth::id();
            $insertData['orgId']= Auth::user()->orgId;

            Location::create($insertData);
        }

       return response()->json(
                    [
                            'success' => '1',
                            "message" => '<div class="alert alert-success">
                                                                 <strong>Saved!</strong>
                                                           </div>'
                    ]
						);

    }

    public function editLocation(Request $request,$locationId){
        $data['title'] = $this->browserTitle . " - ";
        $location = Location::findOrFail($locationId);

        $data['location'] = $location;

        return view('settings.location.create',$data);
    }
}
