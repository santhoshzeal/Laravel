<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use DB;
use DateTime;
use Auth;

class PaymentGatewayStore extends Model {

    /**
     * The database table used by the model.
     *
     * @var string
     */
    use SoftDeletes;

    protected $table = 'store_payment_gateway_values';
    protected $primaryKey = 'payment_values_id';

    /**
     * Attributes that should be mass-assignable.
     *
     * @var array
     */
    protected $fillable = ['orgId', 'payment_gateway_id', 'payment_gateway_parameter_id', 'payment_gateway_parameter_value', 'active', 'preferred_payment_gateway', 'createdBy', 'created_at', 'updatedBy', 'updated_at', 'deletedBy', 'deleted_at'];

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
    * @Function name : getPaymentGatewayParameterValues
    * @Purpose : getPaymentGatewayParameterValues heads based on  array
    * @Added by : Santhosh
    * @Added Date : Dec 27, 2019
    */
	
	public static function getPaymentGatewayParameterValues($payment_gateway_id,$orgId) {
		
		//SELECT `store_payment_gateway_values`.`payment_gateway_parameter_value`, `store_payment_gateway_values`.`payment_gateway_parameter_id` , `payment_gateway_parameters`.`parameter_name`,`payment_gateway_parameters`.`parameter_id` FROM `store_payment_gateway_values` LEFT JOIN payment_gateway_parameters on `store_payment_gateway_values`.`payment_gateway_id` = `payment_gateway_parameters`.`payment_gateway_id` where `store_payment_gateway_values`.`payment_gateway_id` = '1' group by `store_payment_gateway_values`.`payment_values_id`	

		
        $result = PaymentGatewayStore::select('payment_gateway_parameter_id','payment_gateway_parameter_value')
		        ->addSelect("payment_gateway_parameters.parameter_id","payment_gateway_parameters.parameter_name")
                ->leftJoin("payment_gateway_parameters", "store_payment_gateway_values.payment_gateway_id", '=', "payment_gateway_parameters.payment_gateway_id")
                ->where('store_payment_gateway_values.payment_gateway_id', '=', $payment_gateway_id)
                ->where('store_payment_gateway_values.orgId', '=', $orgId)
                ->groupBy("store_payment_gateway_values.payment_values_id")
                ->get();
				
        return $result;
    }
	

}
