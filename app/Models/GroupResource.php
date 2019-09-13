<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupResource extends Model
{
    protected $table = 'group_resources';
    protected $primaryKey = 'id';

    protected $fillable = ['id', 'group_id', 'name', 'type', 'source', 'description', 'visibility', 'createdBy', 'created_at', 'updated_at', 'deleted_at'];

    public function group(){
        return $this->belongsTo('App\Models\Group');
    }
}