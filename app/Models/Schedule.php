<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Schedule extends Model
{
    protected $table = 'scheduling';
    protected $primaryKey = 'id';

    protected $fillable = [  'id', 'orgId', 'title', 'event_id',
                        'assign_ids',
                        'notification_flag', 'created_at', 'updated_at', 'deleted_at'];

    // Created By Lokesh 19-09-2019
    public function event()
    {
        return $this->belongsTo('App\Models\Events', 'event_id', 'eventId');
    }

    public function volunteer(){
        return $this->belongsTo("App\Models\MasterLookupData", "type_of_volunteer", "mldId");
    }

    // Created By Lokesh 25-09-2019
    public function users(){
        return $this->hasMany("App\Models\SchedulingUser", 'scheduling_id');
    }
}
