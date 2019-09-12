<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupEvent extends Model
{
    protected $table = 'group_events';
    protected $primaryKey = 'id';

    protected $fillable = [  'id', 'group_id', 'title', 'isMutiDay_event', 'start_date', 'end_date', 'start_time', 'end_time', 'repeat',
        'location', 'description', 'is_event_remind', 'event_remind_before', 'created_at', 'updated_at', 'deleted_at'];

    public function group(){
        return $this->belongsTo('App\Models\Group');
    }
}