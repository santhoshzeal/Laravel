<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class GroupMember extends Model
{
    protected $table = 'group_members';
    protected $primaryKey = 'id';

    protected $fillable = ['id', 'orgId', 'group_id', 'isUser', 'user_id', 'role', 'email', 'first_name', 'middle_name', 'last_name', 'full_name', 'mobile_no', 'message', 
                            'member_since', 'createdBy', 'created_at', 'updated_at', 'deleted_at'];
            
    public function group(){
        return $this->belongsTo('App\Models\Group');
    }
}