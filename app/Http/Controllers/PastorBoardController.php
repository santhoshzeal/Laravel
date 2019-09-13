<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use DB;
use Config;
use Illuminate\Http\Response;
use DataTables;
use Auth;
use App\Models\Roles;

class PastorBoardController extends Controller {

    public function __construct() {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->common_file_upload_path = Config::get('constants.FILE_UPLOAD_PATH');
        $this->common_file_download_path = Config::get('constants.FILE_DOWNLOAD_PATH');
    }

    public function index() {

        $data['title'] = $this->browserTitle . " - Asset Management";

        return view('pasterBoard.index', $data);
    }

    public function createRoomPage(Request $request) {
        $data['title'] = $this->browserTitle . " - Create Resource";
        $data['roles'] = Roles::selectFromRoles(['orgId'=>Auth::user()->orgId])->get();
        $data['room_group'] = \App\Models\MasterLookupData::selectFromMasterLookupData([["mldKey","=","room_group"]])->get();

        return view('asset.create_room', $data);
    }


    /**
     * @Function name : resourceFileUpload
     * @Purpose : upload resourceFileUpload
     * @Added by : Ananth
     * @Added Date : 1 sep 2019
     */
    private function resourceFileUpload($file) {


        $extension = $file->getClientOriginalExtension();


        $imageName = basename($file->getClientOriginalName(), ("." . $extension));

        $imageName .= "_" . time() . '.' . $extension;
        $destinationPath = $this->common_file_upload_path['PROFILE_PIC_UPLOAD_PATH'] . DIRECTORY_SEPARATOR . Auth::user()->orgId . DIRECTORY_SEPARATOR . "rooms" . DIRECTORY_SEPARATOR;


        $downloadPath = $this->common_file_download_path['PROFILE_PIC_DOWNLOAD_PATH'] . '/' . Auth::user()->orgId . '/' . "rooms" . '/';


        $file->move(
                $destinationPath, $imageName
        );



        $upload_data = array('uploaded_path' => $destinationPath, 'download_path' => $downloadPath, 'uploaded_file_name' => $imageName, 'original_filename' => $imageName, 'upload_file_extension' => $extension, 'file_size' => 0);
        $jsonformat = serialize(json_encode($upload_data));

        return $jsonformat;
    }

}
