<?php

namespace App\Models;
use Auth;
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

    public static function eventsList($groupId,$search){
        $result = self::select('group_events.id', 'group_events.title','group_events.start_date','group_events.end_date','group_events.start_time','group_events.end_time',"group_events.description")

                  ->leftJoin("groups","groups.id","=","group_events.group_id")
        /* ->orderBy("created_at","desc") */;
        if ($search != "") {
            $result->where(function($query)use($search) {



                return $query->where('group_events.title', 'LIKE', "%$search%");
                                //->orWhere('eventDesc', 'LIKE', "%$search%");

                //echo date("d m y",(int)$search);
            });
        }
        $result->where("group_events.group_id",$groupId);
        $result->where('groups.orgId', '=', Auth::user()->orgId);
        return $result;
    }
}
