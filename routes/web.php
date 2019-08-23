<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    //return view('welcome');
});
//Route::get('public_site/add_student/{fair_domain}', function() {
//        return redirect("public_site/add_student");
//    });
//Route::get('login', 'PassportController@login_page');

Route::post('login', [ 'as' => 'login', 'uses' => 'PassportController@login_page']);

Route::get('api/login', function () {
	return redirect("login");
});


Route::post('org_register', 'PassportController@organizationRegister');
Route::post('member_register', 'PassportController@memberRegister');

Route::post('check_unique_org_domain', 'PassportController@checkOrganizationDomain');
Route::post('check_unique_email_per_org', 'PassportController@checkUniqueEmailPerOrganization');


Route::group( ['middleware' => ['get_org_detail']], function() {

    Route::get('login', 'PassportController@login_page');
    Route::get('login/{org_domain}', 'PassportController@login_page');
    Route::get('register/{org_domain}', 'PassportController@register');
});



Route::get('/home', 'HomeController@index')->name('home');
Route::get('logout', 'PassportController@logout');



//Route::get('auth.register', 'PassportController@register');

Route::post('webapp/login', 'PassportController@login');

Route::get('webapp/logout/{orgDomain}', 'PassportController@logout');

Route::get('webapp/signup', 'WebsiteController@signup');

Route::group( ['middleware' => ['auth']], function() {
    Route::resource('users', 'UserController');
    Route::resource('roles', 'RoleController');
    //Route::resource('posts', 'PostController');
	Route::resource('permissions','PermissionController');
});

Route::group( ['middleware' => ['auth','has_permission']], function() {
   
});

Route::group( ['middleware' => ['auth','App\Http\Middleware\PermissionMiddleware']], function() {
   Route::resource('posts', 'PostController');
});

//people
Route::get('people/member_directory', 'UserController@index');
Route::get('people/member_create', 'UserController@create');
Route::get('people/{personal_id}', 'UserController@view');
Route::get('people/{personal_id}/messages', 'CommunicationController@messages');
Route::post('display_household', 'HouseHoldsController@displayHousehold');

Route::get('get_usermaster_data', 'UserController@getUserData');

Route::post('store', 'UserController@userMasterStore');

// Members Directory
Route::get('/people/member/management/{personal_id?}', 'MemberController@createOrEdit');
Route::post('/people/member/management/{personal_id?}', 'MemberController@storeOrUpdate');
Route::get('/people/member/{personal_id}', 'MemberController@viewMember');

// Households Api's List
Route::get('/api/people/member/households/{personal_id}', 'MemberController@getHouseholderList');
Route::post('/api/people/member/households/get-users-search', 'MemberController@getHhUserSearch');
Route::post("/api/people/member/households/create-new", 'MemberController@createNewHousehold');
Route::post("/api/people/member/households/remove-household", 'MemberController@removeHousehold');
Route::post("/api/people/member/households/update-household", 'MemberController@updateHousehold');

//Role
Route::get('role_management', 'RoleController@index');
Route::get('role_create', 'RoleController@create');

//communication
Route::get('communication', 'CommunicationController@index');

//checkin
Route::get('checkin', 'CheckinController@index');
Route::get('checkin/adult', 'CheckinController@adultCheckin');
Route::get('checkin/child', 'CheckinController@childCheckin');
Route::get('checkin/notification', 'CheckinController@notificationCheckin');
Route::get('checkin/report', 'CheckinController@reportCheckin');
//Auth::routes();


//events
Route::get('events', 'EventsController@index');
Route::get('events/create_page', 'EventsController@createPage');
Route::post('events/store', 'EventsController@store')->name('events.store');
Route::post('events/list', 'EventsController@listEvents');

//Front end website
Route::get('/', 'WebsiteController@index');


Route::post('user_profile_file_upload', 'UserController@userProfileFileUpload');