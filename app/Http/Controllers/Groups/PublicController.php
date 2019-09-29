<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Config;

class PublicController extends Controller
{
    public function __construct()
    {
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
    }


    public function getGroupsListTemplate(){
        $data['title'] = $this->browserTitle . " - Groups List";

        return view("groups.public.group_types", $data);
    }
}
