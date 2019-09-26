<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;
use Response;
use App\Models\Group;
use DB;
class GroupController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function groupsList(){
        $data['title'] = $this->browserTitle . " - Groups List";
        return view('groups.list', $data);
    }

    public function groupsListPagination(){
        $groupList = Group::getGroups("")->get();
        $count =DB::select('SELECT FOUND_ROWS() as record_count');
        $count = $count[0]->record_count;

        $items = array();
        foreach($groupList as $item) {
            $html=' <div class="card m-b-5 border border-primary">
                            <div class="card-body ">

                            <div class="row no-gutters">


                                    <div class=" col-md-8 ">

                                      <div class="grouptype-name "><h6>'.$item->name.'</h6></div>
                                       <div class="grouptype-desc"> '.$item->description.'</div>



                                    </div>

                                    <div class="col-md-3">
                                                    <button class="btn btn-outline-primary" onclick="groupDefaults('.$item->id.')">Group Defaults</button>
                                                    <button class="btn btn-outline-primary" onclick="viewGroups('.$item->id.')">View Groups</button>
                             </div>
                             </div></div></div>';
            $items[] = $html;
        }
        return response()->json(
            [
                'success' => '1',
                "items" => $items,
                "count" =>$count
            ]
            );
    }


}
