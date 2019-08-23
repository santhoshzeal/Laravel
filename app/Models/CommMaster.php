<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CommMaster extends Model
{
    /** 
        * The table associated with the model
    */
    protected $table = "comm_masters";
    
    protected $fillable = [
        'id', '	comm_template_id', 'org_id', 'type', 'tag', 'subject', 'body', 'from_user_id', 
        'createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'
    ];
}
