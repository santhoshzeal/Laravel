@extends('layouts.default')

@section('content')
        <!-- Page-Title -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="page-title-box">
                            <div class="btn-group pull-right">
                                <ol class="breadcrumb hide-phone p-0 m-0">
                                    <li class="breadcrumb-item active">Member Create</li>
                                </ol>
                            </div>
                            <!--<h4 class="page-title">Form Validation</h4>-->
                        </div>
                    </div>
                </div>
                <!-- end page title end breadcrumb -->
@if ($errors->any())
<div class="error">
    <ul style="list-style: none;padding: 0">
    @foreach ($errors->all() as $error)
    <li>{{ $error }}</li>
    @endforeach
    </ul>
</div>
@endif
<h1> URL: {{url('store')}}</h1>



@if(session()->has('message'))
    <div class="alert alert-success">
        {{ session()->get('message') }}
    </div>
@endif
                <!-- <p><code>.row</code>:</p> -->
{!! Form::open(array('id'=>'userMasterCreateForm','name'=>'userMasterCreateForm','method' => 'post', 'url' => url('store'), 'class' => '','files' => true)) !!}
    <!-- flex:100%;max-width:100%; -->
  <div class="row" style="flex:100%;background-color: #fff;padding:1.25em">
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <img class="d-flex mr-2 rounded-circle img-thumbnail thumb-lg" src="{{ URL::asset('assets/theme/images/users/avatar-6.jpg')}}" alt="Generic placeholder image">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Prefix</label>
        <select class="form-control" name="name_prefix" id="name_prefix" >
            @foreach($name_prefix as $value)
            <option {{ (isset($selectFromUserMaster) && $selectFromUserMaster->name_prefix==$value->mldId)?'selected':''}} value="{{$value->mldId}}">{{$value->mldValue}}</option>
            @endforeach            
        </select>
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>First</label>
      <input type="text" class="form-control" name="first_name" id="first_name" placeholder="First name" value="{{ old('first_name', isset($selectFromUserMaster) ? $selectFromUserMaster->first_name : '') }}">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Middle</label>
      <input type="text" class="form-control" name="middle_name" id="middle_name" placeholder="Middle name" value="{{ old('middle_name', isset($selectFromUserMaster) ? $selectFromUserMaster->middle_name : '') }}">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Last</label>
      <input type="text" class="form-control" name="last_name" id="last_name" placeholder="Last name" value="{{ old('last_name', isset($selectFromUserMaster) ? $selectFromUserMaster->last_name : '') }}">
    </div>

    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Suffix</label>
        <select class="form-control" name="name_suffix" id="name_suffix" >
            @foreach($name_suffix as $value)
            <option {{ (isset($selectFromUserMaster) && $selectFromUserMaster->name_suffix==$value->mldId)?'selected':''}} value="{{$value->mldId}}">{{$value->mldValue}}</option>
            @endforeach
        </select>
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Given Name</label>
      <input type="text" class="form-control" name="given_name" id="given_name" placeholder="Given name" value="{{ old('given_name', isset($selectFromUserMaster) ? $selectFromUserMaster->given_name : '') }}">
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Nickname</label>
      <input type="text" class="form-control" name="nick_name" id="nick_name" placeholder="Nickname" value="{{ old('nick_name', isset($selectFromUserMaster) ? $selectFromUserMaster->nick_name : '') }}">
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Email</label>
        <input required="" type="email" class="form-control" name="email" id="email" placeholder="Email" value="{{ old('email', isset($selectFromUserMaster) ? $selectFromUserMaster->email : '') }}">
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Phone</label>
      <input type="text" class="form-control" name="mobile_no" id="mobile_no" placeholder="Phone" value="{{ old('mobile_no', isset($selectFromUserMaster) ? $selectFromUserMaster->mobile_no : '') }}">
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Street Address</label>
      <input type="text" class="form-control" name="street_address" id="street_address" placeholder="Street Address" value="{{ old('street_address', isset($selectFromUserMaster) ? $selectFromUserMaster->street_address : '') }}">
    </div>
    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Apt/unit/box</label>
      <input type="text" class="form-control" name="apt_address" id="apt_address" placeholder="Apt/unit/box" value="{{ old('apt_address', isset($selectFromUserMaster) ? $selectFromUserMaster->apt_address : '') }}">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>City</label>
      <input type="text" class="form-control" name="city_address" id="city_address" placeholder="City" value="{{ old('city_address', isset($selectFromUserMaster) ? $selectFromUserMaster->city_address : '') }}">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>State</label>
      <input type="text" class="form-control" name="state_address" id="state_address" placeholder="State" value="{{ old('state_address', isset($selectFromUserMaster) ? $selectFromUserMaster->state_address : '') }}">
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Zip</label>
      <input type="text" class="form-control" name="zip_address" id="zip_address" placeholder="Zip" value="{{ old('zip_address', isset($selectFromUserMaster) ? $selectFromUserMaster->zip_address : '') }}">
    </div>

    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>&nbsp;</label>
        <select class="form-control" name="life_stage" id="life_stage">
            <option value="Adult">Adult</option>
            <option value="Child">Child</option>
            </select>
        
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Gender</label>
        <select class="form-control" name="gender" id="gender">
            <option value="Male">Male</option>
            <option value="Female">Female</option>
        </select>
        
    </div>

    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Birthdate</label>
        <div class="input-group">
            <input type="text" class="form-control" name="dob" id="dob" placeholder="mm/dd/yyyy" id="datepicker-autoclose" value="{{ old('dob', isset($selectFromUserMaster) ? $selectFromUserMaster->dob : '') }}">
            <div class="input-group-append bg-custom b-0"><span class="input-group-text"><i class="mdi mdi-calendar"></i></span></div>
        </div><!-- input-group -->
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Marital Status</label>
        <select class="form-control" name="marital_status" id="marital_status">
            @foreach($marital_status as $value)
            <option {{ (isset($selectFromUserMaster) && $selectFromUserMaster->marital_status==$value->mldId)?'selected':''}} value="{{$value->mldId}}">{{$value->mldValue}}</option>
            @endforeach
        </select>
        
    </div>

    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Anniversary</label>
        <div class="input-group">
            <input type="text" class="form-control" name="doa" id="doa" placeholder="mm/dd/yyyy" id="datepicker-autoclose" value="{{ old('doa', isset($selectFromUserMaster) ? $selectFromUserMaster->doa : '') }}">
            <div class="input-group-append bg-custom b-0"><span class="input-group-text"><i class="mdi mdi-calendar"></i></span></div>
        </div><!-- input-group -->
    </div> 

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>School</label>
        <select class="form-control" name="school_name" id="school_name">
            @foreach($school_name as $value)
            <option {{ (isset($selectFromUserMaster) && $selectFromUserMaster->school_name==$value->mldId)?'selected':''}} value="{{$value->mldId}}">{{$value->mldValue}}</option>
            @endforeach
        </select>
        
    </div>

    <div class="col-sm-3 col-lg-3 col-md-3 divcols" >
        <label>Grade</label>
        <select class="form-control" name="grade_id" id="grade_id">
            @foreach($grade_id as $value)
            <option {{ (isset($selectFromUserMaster) && $selectFromUserMaster->grade_id==$value->mldId)?'selected':''}} value="{{$value->mldId}}">{{$value->mldValue}}</option>
            @endforeach
        </select>
        
    </div>

    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Add a note</label>
        <textarea class="form-control" name="medical_note" id="medical_note">{{ old('medical_note', isset($selectFromUserMaster) ? $selectFromUserMaster->medical_note : '') }}</textarea> 
    </div>
    <div class="col-sm-2 col-lg-2 col-md-2 divcols" >
        <label>Social profile</label>
        <input type="text" class="form-control" name="social_profile" id="social_profile" placeholder="Social profile" value="{{ old('social_profile', isset($selectFromUserMaster) ? $selectFromUserMaster->social_profile : '') }}"> 
    </div>
    
    <div class="col-sm-12 col-lg-12 col-md-12 divcols" >
        <div class="form-group">
            <div>
                <button type="submit" class="btn btn-primary waves-effect waves-light">
                    Save
                </button>
                <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                    Close
                </button>
            </div>
        </div>  
    </div>  
  </div>
{{ Form::close() }}
 

<style type="text/css">
    .divcols {
        padding: 0.25em;
    }
</style>        

 <!-- Plugins Init js -->
        
        
@endsection                

