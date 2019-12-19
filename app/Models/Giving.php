<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;

class Giving extends Model  {


    /**
     * The database table used by the model.
     *
     * @var string
     */
    use SoftDeletes;
    protected $table = 'giving';
    protected $primaryKey = 'id';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = [ 'id', 'user_id', 'orgId', 'event_id', 'email', 'first_name', 'middle_name', 'last_name', 'full_name', 'mobile_no', 'payment_mode_id', 'sub_payment_mode_id', 'amount',
	'pay_mode', 'purpose_note', 'createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'];
	
	
	public function event()
    {
        return $this->belongsTo('App\Models\Events', 'event_id', 'eventId');
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
     * @Function name : selectFromGiving
     * @Purpose : Select from Giving data based on where array
     * @Added by : Santhosh
     * @Added Date : Dec 18, 2019
     */
    public static function selectFromGiving($whereArray) {
        $query = Giving::where($whereArray);
        return $query;
    }

    /**
     * @Function name : updateGiving
     * @Purpose : Update Giving data based on where array
     * @Added by : Santhosh
     * @Added Date : Dec 18, 2019
     */
    public static function updateGiving($update_details, $whereArray) {
        Giving::where($whereArray)->update($update_details);
    }

    /**
     * @Function name : deleteGiving
     * @Purpose : delete Giving data based on  where array
     * @Added by : Santhosh
     * @Added Date : Dec 18, 2019
     */
    public static function deleteGiving($whereArray) {
        Giving::where($whereArray)->delete();
    }
     
    
    /**
    * @Function name : crudGiving
    * @Purpose : crud Giving heads based on  array
    * @Added by : Santhosh
    * @Added Date : Dec 18, 2019
    */
    public static function crudGiving($whereArray=null,$whereInArray=null,$whereNotInArray=null,$whereNotNullArray=null,$whereNullArray=null,$update_details=null,$delete=null,$select=null) {
        $query = Giving::query();
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
