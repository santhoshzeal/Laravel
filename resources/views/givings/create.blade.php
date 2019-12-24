@extends('layouts.default')

@section('content')
<div style="width:100vw">
    @include('givings.header')

    <?php
        $formUrl = "/settings/givings/store";
        $giving_id = isset(request()->route()->parameters['giving_id'])? request()->route()->parameters['giving_id'] : null;
        if($giving_id){
            //$formUrl = $formUrl ."/". $giving_id;
        }
    ?>
    <div class="row">
        <div class="col-sm-0 col-md-1 col-lg-2"></div>
        <div class="col-sm-12 col-md-10 col-lg-8 card">
            <!-- <div class="card m-b-30"> -->
            <div class="card-body pl-0 pr-0">
                <h5 class="mt-0 pl-3"> {{($giving_id)? 'Edit' : "Create" }} Giving</h5>
                <hr />
                <div class="row p0 m-0">
                    {!! Form::open(array('id'=>'givingsForm','name'=>'givingsForm','method' => 'post', 'url' => $formUrl, 'class' => 'givingsForm col-sm-12 card p-2','files' => true)) !!}
                    
                    <!-- <form method="post" action="{{ route('settings.schedulling.store') }}" name="givingsForm" id="givingsForm" enctype="multipart/form-data" class="col-sm-12 card p-2"> -->
					    
						<input type="text" id="orgId" name="orgId" value="{{$orgId}}" class="d-none">
						 
                        <input type="text" id="givingId" name="givingId" value="{{$giving_id}}" class="d-none">
						
                        <!--<input type="text" id="user_id" name="user_id" value="{{$user_id}}" class="d-none">-->
						
                       
						
                        
                        <div class="row">
                            <div class="col-12">
                                <div class="card m-b-30">
                                    <div class="card-body">
									
									    <div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">Type</label>
											<div class="col-sm-10">
											<select class="form-control" name="type" id="type">
											    <option>--Select--</option> 
												<option {{ (isset($crudGiving) && $crudGiving->type==1)?'selected':''}}  value="1">Donation</option>
												<option {{ (isset($crudGiving) && $crudGiving->type==2)?'selected':''}}  value="2">Event</option>                                 
											</select>
											</div>
										</div>
						
						
                                        <div id="dvEvent" style="display: none">
											<div class="form-group row">
												<label for="example-date-input" class="col-sm-2 col-form-label">Event Date</label>
												<div class="col-sm-10">
													<input class="form-control selecteventdate" type="text" value="{{ old('event_date', isset($crudGiving) ? $crudGiving->event_date : '') }}" name="event_date" id="example-date-input">

													<input class="form-control" type="hidden" value="{{ old('event_id_hidden', isset($crudGiving) ? $crudGiving->event_id : '') }}" name="event_id_hidden" 
													 id="event_id_hidden">
												</div>
	 

											</div>
											<div class="form-group row">
												<label class="col-sm-2 col-form-label">Select Event</label>

												<div class="col-sm-10 load_events" id="load_events">
													
													<select  name='event_id' id='event_id' class='form-control'>
														<option value="">--Select--</option>                        
													</select>    
													
													
												</div>
											 </div>
										   </div>
										   
										   <div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">Users</label>
											<div class="col-sm-10">
											<select class="form-control" name="user_id" id="user_id">
											   <option value="">--Select--</option>
										          @foreach($user_id as $user) 
												     <option value="{{ $user->id }}">{{ $user->full_name }}</option>														 
												  @endforeach												                                
											</select>
											</div>
										   </div>
										
										
                                     <div id="dvUser" style="display: block">
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Email</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('email', isset($crudGiving) ? $crudGiving->email : '') }}" id="email" 
												name="email" >
                                            </div>
                                        </div>

                                        
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">First Name</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('first_name', isset($crudGiving) ? $crudGiving->first_name : '') }}" id="first_name" 
												name="first_name" >
                                            </div>
                                        </div>
										
										
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Middle Name</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('middle_name', isset($crudGiving) ? $crudGiving->middle_name : '') }}" id="middle_name" 
												name="middle_name" >
                                            </div>
                                        </div>
										
										
										
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Last Name</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('last_name', isset($crudGiving) ? $crudGiving->last_name : '') }}" id="last_name" 
												name="last_name" >
                                            </div>
                                        </div>
										
										
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Mobile Number</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('mobile_no', isset($crudGiving) ? $crudGiving->mobile_no : '') }}" id="mobile_no" 
												name="mobile_no" >
                                            </div>
                                        </div>
	</div>

                                        <div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">Payment Mode</label>
											<div class="col-sm-10">
											<select class="form-control" name="payment_mode_id" id="payment_mode_id">
											    <option value="">--Select--</option> 
												<option {{ (isset($crudGiving) && $crudGiving->payment_mode_id==1)?'selected':''}}  value="1">1</option>                                 
											</select>
											</div>
										</div>


                                        <div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">Sub Payment Mode</label>
											<div class="col-sm-10">
											<select class="form-control" name="sub_payment_mode_id" id="sub_payment_mode_id">
											    <option value="">--Select--</option> 
												<option {{ (isset($crudGiving) && $crudGiving->sub_payment_mode_id==1)?'selected':''}}  value="1">1</option>                               
											</select>
											</div>
										</div>										
										
										<div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Amount</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="{{ old('amount', isset($crudGiving) ? $crudGiving->amount : '') }}" id="amount" 
												name="amount" >
                                            </div>
                                        </div>
										
										<div class="form-group row">
											<label for="example-date-input" class="col-sm-2 col-form-label">Payment Mode</label>
											<div class="col-sm-10">
											<select class="form-control" name="pay_mode" id="pay_mode">
											    <option value="">--Select--</option> 
												<option {{ (isset($crudGiving) && $crudGiving->pay_mode=="Credit")?'selected':''}}  value="Credit">Credit</option>                                
											</select>
											</div>
										</div>
										

                                        <div class="form-group">
                                            <div>
                                                <button type="submit" class="btn btn-primary waves-effect waves-light">
                                                    Submit
                                                </button>
                                                <a href="{{ URL::asset('settings/givings')}}" type="reset" class="btn btn-secondary waves-effect m-l-5">Cancel</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                    </form>
                </div>
            </div>
            <!-- </div> -->
        </div>
    </div>
    
</div>

<script type='text/javascript'>
$(function () {
	$("#type").change(function () {
		if ($(this).val() == "2") {
			$("#dvEvent").show();
		} else {
			$("#dvEvent").hide();
		}
	});
 });
 
 $(function () {
	$("#user_id").change(function () {
		//alert($(this).val());
		if ($(this).val() =="") {
			$("#dvUser").show();
		} else {
			$("#dvUser").hide();
		}
	});
 });
 

 /////////
// An array of highlighting dates ( 'dd-mm-yyyy' )
setTimeout(function(){ 

    var selecteventdate = $(".selecteventdate").val();
    //alert(selecteventdate);
    if(selecteventdate){
        //alert(selecteventdate);
        //$('.selecteventdate').datepicker().change(eventDateChanged);
        //$('.selecteventdate').datepicker().click();
        $(".selecteventdate").datepicker("setDate", "<?php echo isset($crudGiving) ? $crudGiving->event_date : '';?>").change(eventDateChanged);

        //call team dropdown
        $('#btnAssignFlag').trigger('click');

    }
}, 1000);

  

$(document).ready(function(){
       
	var today               = new Date();
	var today_formatted     = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+('0'+today.getDate()).slice(-2);
	var user_busy_days      = <?php echo json_encode(array_unique((array_column($upcoming_events, 'eventCreatedDate'))));?>;//['2019-11-09','2019-11-16','2019-11-19'];

	$('.selecteventdate').datepicker({
		autoclose: true,
		format: 'yyyy-mm-dd',
		inline: true,
		sideBySide: true,
		beforeShowDay: function (date) {

			calender_date = date.getFullYear()+'-'+(date.getMonth()+1)+'-'+('0'+date.getDate()).slice(-2);

			var search_index = $.inArray(calender_date, user_busy_days);

			if (search_index > -1) {
				return {classes: 'non-highlighted-cal-dates', tooltip: 'User available on this day.'};
			}else{
				return {classes: 'highlighted-cal-dates', tooltip: 'User not available on this day.'};
			}

		}
		//datesDisabled: ['11/20/2019'],
	   // datesEnabled: ['11/22/2019'],
		
	}).change(eventDateChanged);

});
</script>

<style type="text/css"> 
.highlighted-cal-dates
{
    pointer-events: none; 
    cursor: default; 
}
.non-highlighted-cal-dates
{
    background-color: #29f274 !important;
}

</style>

<script type="text/javascript" src="{{ URL:: asset('js/custom/givings.js')}}"></script>

@endsection