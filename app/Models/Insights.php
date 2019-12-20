<?php

namespace App\Models;
use Auth;
use Illuminate\Database\Eloquent\Model;

class Insights extends Model
{
    protected $table = 'insights';
    protected $primaryKey = 'id';

    protected $fillable = ['id', 'group_id', 'name', 'type', 'source', 'description', 'visibility', 'createdBy', 'created_at', 'updated_at', 'deleted_at'];
	
	
	public function group(){
        return $this->belongsTo('App\Models\Group');
    }

    public static function insightList($groupId,$search){
        $result = self::select("insights.id",'insights.name',"insights.type","source","insights.description","insights.visibility","insights.updated_at")

                  ->leftJoin("groups","groups.id","=","insights.group_id")
        /* ->orderBy("created_at","desc") */;
        if ($search != "") {
            $result->where(function($query)use($search) {



                return $query->where('insights.name', 'LIKE', "%$search%");
                                //->orWhere('eventDesc', 'LIKE', "%$search%");

                //echo date("d m y",(int)$search);
            });
        }
        $result->where("insights.group_id",$groupId);
        $result->where('groups.orgId', '=', Auth::user()->orgId);
        return $result;
    }
	

    /**
     * The attributes excluded from the model's JSON form.
     *
     * @var array
     */
    protected $hidden = [];

    /**
     * The attributes that should be casted to native types.
     *
     * @var array
     */
    protected $casts = [];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['created_at', 'updated_at', 'deleted_at'];

    /**
     * @Function name : selectFromInsights
     * @Purpose : Select from Insights data based on where array
     * @Added by : Santhosh
     * @Added Date : Dec 19, 2019
     */
    public static function selectFromInsights($whereArray) {
        $query = Insights::where($whereArray);
        return $query;
    }

    /**
     * @Function name : updateInsights
     * @Purpose : Update Insights data based on where array
     * @Added by : Santhosh
     * @Added Date : Dec 19, 2019
     */
    public static function updateInsights($update_details, $whereArray) {
        Insights::where($whereArray)->update($update_details);
    }

    /**
     * @Function name : deleteInsights
     * @Purpose : delete Insights data based on  where array
     * @Added by : Santhosh
     * @Added Date : Dec 19, 2019
     */
    public static function deleteInsights($whereArray) {
        Insights::where($whereArray)->delete();
    }
     
    
    /**
    * @Function name : crudInsights
    * @Purpose : crud Insights heads based on  array
    * @Added by : Santhosh
    * @Added Date : Dec 19, 2019
    */
    public static function crudInsights($whereArray=null,$whereInArray=null,$whereNotInArray=null,$whereNotNullArray=null,$whereNullArray=null,$update_details=null,$delete=null,$select=null) {
        $query = Insights::query();
        if($whereArray){
            $query->where($whereArray);
        }
        if($whereInArray){
            foreach($whereInArray as $key=>$value){
                $whereInFiltered = array_filter($value);
                $query->whereIn($key,$whereInFiltered);
            }
        }
        if($whereNotInArray){
            foreach($whereNotInArray as $key=>$value){
                $whereNotInFiltered = array_filter($value);
                $query->whereNotIn($key,$whereNotInFiltered);
            }
        }
        if($whereNotNullArray){
            foreach($whereNotNullArray as $value){
                $query->whereNotNull($value);
            }            
        }
        if($whereNullArray){
            foreach($whereNullArray as $value){
                $query->whereNull($value);
            }            
        }
        
        if($update_details){
            $query->update($update_details);
        }elseif($delete){
            $query->delete();
        }elseif($select){
            return $query;
        }
    }
    
}
