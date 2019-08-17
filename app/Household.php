<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Household extends Model
{
    /** 
        * The table associated with the model
    */
    protected $table = "households";
    protected $primaryKey = 'hhId';

    protected $fillable = [
        'hhId', 'orgId', 'hhPrimaryUserId', 'hhdName', 'created_at', 'updated_at', 'deletedBy', 'deleted_at'
    ];

    public function householdList()
    {
        return $this->hasMany('App\HouseholdDetail', 'hhId', 'hhId');
    }
}
