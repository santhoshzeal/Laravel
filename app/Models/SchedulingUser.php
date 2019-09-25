<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SchedulingUser extends Model
{
    protected $table = 'scheduling_user';
    protected $primaryKey = 'id';
    
    protected $fillable = [  'id', 'orgId', 'scheduling_id', 'user_id', 'status', 'token', 
                            'created_at', 'updated_at', 'deleted_at'];

    // Created By Lokesh 25-09-2019
    public function schedule()
    {
        return $this->belongsTo('App\Models\Schedule', 'scheduling_id');
    }

    public function user(){
        return $this->belongsTo("App\user", "user_id");
    }
}
