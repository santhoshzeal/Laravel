<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Group extends Model
{
    protected $table = 'groups';
    protected $primaryKey = 'id';

    protected $fillable = [  'id', 'orgId', 'groupType_id', 'name', 'description', 'notes', 'image_path', 'meeting_schedule', 'isPublic',
        'location', 'is_enroll_autoClose', 'enroll_autoClose_on', 'is_enroll_autoClose_count', 'enroll_autoClose_count',
        'is_enroll_notify_count', 'enroll_notify_count', 'contact_email', 'visible_leaders_fields',
        'visible_members_fields', 'can_leaders_search_people', 'can_leaders_take_attendance', 'is_event_remind', 'event_remind_before',
        'enroll_status', 'enroll_msg', 'leader_visibility_publicly', 'is_event_public', 'created_at', 'updated_at', 'deleted_at'];

    public function groupType(){
        return $this->belongsTo('App\Models\GroupType', 'groupType_id');
    }

    public function events(){
        return $this->hasMany('App\Models\GroupEvent');
    }

    public function enrolls(){
        return $this->hasMany('App\Models\GroupEnroll');
    }

    public function members(){
        return $this->hasMany('App\Models\GroupMember');
    }

    public function resources(){
        return $this->hasMany('App\Models\GroupResource');
    }

    public function tags(){
        return $this->belongsToMany('App\Models\Tag');
    }
}