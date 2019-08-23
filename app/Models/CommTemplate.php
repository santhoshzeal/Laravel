<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommTemplate extends Model
{
    /** 
        * The table associated with the model
    */
    protected $table = "comm_templates";
    
    protected $fillable = [
        'id', 'tag', 'name', 'subject', 'body', 'org_id',
        'createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'
    ];
}
