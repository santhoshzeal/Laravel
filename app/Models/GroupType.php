<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupType extends Model
{
    protected $table = 'group_types';
    protected $primaryKey = 'id';

    protected $fillable = [  'id', 'orgId', 'name', 'description', 'd_isPublic', 'd_meeting_schedule', 'd_description', 'd_location',
        'd_contact_email', 'd_visible_leaders_fields', 'd_visible_members_fields', 'd_is_enroll_autoClose', 'd_enroll_autoClose_on',
        'd_is_enroll_autoClose_count', 'd_enroll_autoClose_count', 'd_is_enroll_notify_count', 'd_enroll_notify_count',
        'd_can_leaders_search_people', 'd_is_event_public', 'd_is_event_remind', 'd_event_remind_before', 'd_can_leaders_take_attendance',
        'd_enroll_status', 'd_enroll_msg', 'd_leader_visibility_publicly', 'created_at', 'updated_at', 'deleted_at'];

        public function groups(){
            return $this->hasMany('App\Models\Group', 'groupType_id', 'id');
        }
}
