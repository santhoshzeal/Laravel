<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;

use App\Models\Organization;
class GetOrgnaizationDetailsMiddleware {

    public function handle($request, Closure $next) {

            
            if(\Request::segment(2)){
                $whereArray = array('orgDomain' => \Request::segment(2));
                $crudOrganization = Organization::crudOrganization($whereArray,null,null,null,null,null,null,'1')->get();
                if ($crudOrganization->count() > 0) {
                    return $next($request);
                } else {
                    abort(404, \Request::segment(2). ' - Organization Not Found');
                }
            }
            if(\Request::segment(2) == null || \Request::segment(2) == ""){
                abort(404, " Organization Doesn't Exist");
            }
            //abort(403, 'Organization Name Missing');
            return $next($request);
            
            
        
    }

}
