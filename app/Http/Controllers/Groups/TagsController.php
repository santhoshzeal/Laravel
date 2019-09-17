<?php

namespace App\Http\Controllers\Groups;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

use Illuminate\Support\Facades\Session;
use Config;

use App\Models\Tag;
use App\Models\TagGroup;
use App\Models\GroupTag;

class TagsController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
        $this->browserTitle = Config::get('constants.BROWSERTITLE');
        $this->userSessionData = Session::get('userSessionData');
        $this->orgId = $this->userSessionData['umOrgId'];
    }

    public function tagsIndex(){
        $data['title'] = $this->browserTitle . " - Group Tags List";
        
        return view('groups.tags', $data);
    }

    public function getGroupsListWithTags(){
        $tagGroups = TagGroup::where("orgId", $this->orgId)->orderBy('order')->with(['tags' => function($query){
                        $query->orderBy('order')->select("name", "id", "order");
                    }])->select("id", "name", "isPublic", "order", "isMultiple_select")->get();
        return $tagGroups;
    }

    public function createGroup(Request $request){
        $payload = json_decode(request()->getContent(), true);
        $newTagGroup = null;
        if($payload["groupId"] == "create_new_node_id"){
            $newTagGroup = new TagGroup();
            $newTagGroup->order = $payload["order"];
            $newTagGroup->orgId = $this->orgId;
        }else {
            $newTagGroup = TagGroup::where("id", $payload["groupId"])->first();
        }
        $newTagGroup->name = $payload["name"];
        $newTagGroup->isPublic = $payload["isPublic"];
        $newTagGroup->isMultiple_select = $payload["isMultiple_select"];
        $newTagGroup->save();
        return ["id" => $newTagGroup->id];
    }

    public function deleteTagGroup($tagGroup_id){
        TagGroup::where('id', $tagGroup_id)->delete();
        $tagIds = Tag::where("tagGroup_id", $tagGroup_id)->pluck('id');
        GroupTag::whereIn("tag_id", $tagIds)->delete();
        Tag::whereIn("id", $tagIds)->delete();

        return ["message" => "Tag Group has been successfully deleted"];

    }
}