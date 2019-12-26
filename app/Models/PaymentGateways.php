<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
use DateTime;
use Auth;

class PaymentGateways extends Model {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    use SoftDeletes;

    protected $table = 'payment_gateways';
    protected $primaryKey = 'id';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['payment_gateway_id','orgId','gateway_name','active','createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'];

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
	

    public static function listPaymentGatewaysValues($orgId) {
		
		
        $result = DB::table(DB::raw("(SELECT id, payment_gateway_id, orgId, gateway_name, active  FROM `payment_gateways` WHERE orgId = ".$orgId." UNION SELECT id, payment_gateway_id, orgId, gateway_name, active FROM `payment_gateways` WHERE orgId IS NULL and payment_gateway_id not in (SELECT payment_gateway_id FROM `payment_gateways` WHERE orgId = ".$orgId." ) ORDER BY id ) as payment_gateways_values"));
			
	    return $result;

    }
	
	
	

}
