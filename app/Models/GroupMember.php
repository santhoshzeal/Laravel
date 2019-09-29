<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Auth;
class GroupMember extends Model
{
    protected $table = 'group_members';
    protected $primaryKey = 'id';

    protected $fillable = ['id', 'orgId', 'group_id', 'isUser', 'user_id', 'role', 'email', 'first_name', 'middle_name', 'last_name', 'full_name', 'mobile_no', 'message',
                            'member_since', 'createdBy', 'created_at', 'updated_at', 'deleted_at'];

    public function group(){
        return $this->belongsTo('App\Models\Group');
    }

    public static function membersList($groupId,$search){
        $result = self::select('group_members.id', 'users.id as user_id','users.first_name','users.last_name','users.email','users.mobile_no')
                        ->addSelect("member_since","group_members.role")
                  ->leftJoin("users","users.id","=","group_members.user_id")
        /* ->orderBy("created_at","desc") */;
        if ($search != "") {
            $result->where(function($query)use($search) {



                return $query->where('users.first_name', 'LIKE', "%$search%");
                                //->orWhere('eventDesc', 'LIKE', "%$search%");

                //echo date("d m y",(int)$search);
            });
        }
        $result->where("group_members.group_id",$groupId);
        $result->where('group_members.orgId', '=', Auth::user()->orgId);
        return $result;
    }
}
