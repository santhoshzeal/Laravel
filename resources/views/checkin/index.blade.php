@extends('layouts.default')

@section('content')
            <!-- Page-Title -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-title-box">
                        <div class="btn-group pull-right">
                            <ol class="breadcrumb hide-phone p-0 m-0">
                                <li class="breadcrumb-item active">Checkin</li>
                            </ol>
                        </div>
                        <!--<h4 class="page-title">Roles Management</h4>-->
                        <!--<a href="{{URL::asset('role_create')}}" type="button" class="btn btn-primary waves-effect waves-light"><i class="fa fa-plus"></i>Add Role</a>-->
                    </div>
                </div>
            </div>
            <!-- end page title end breadcrumb -->

            <div class="row">
                    <div class="col-lg-3">
                        <div class="card m-b-30">
                            <div class="card-body">
                                <div class="button-items">
                                    <a href="{{URL::asset('checkin/adult')}}" class="btn btn-primary btn-lg btn-block">Adult Checkin</a>
                                    <a href="{{URL::asset('checkin/child')}}" class="btn btn-primary btn-lg btn-block">Child Checkin</a>
                                    <a href="{{URL::asset('checkin/notification')}}" class="btn btn-primary btn-lg btn-block">Notification</a>
                                    <a href="{{URL::asset('checkin/report')}}" class="btn btn-primary btn-sm btn-block">Report</a>
                                </div>
                            </div>
                        </div>
                    </div>
            <div class="col-lg-9">
                        <div class="card m-b-30">
                            <div class="card-body">
							
							@if(isset($eventDetails))
                                <div class="row">
                                    <div class="col-md-6">{{$eventDetails->eventName}}</div>
                                    <div class="col-md-6">{{$eventDetails->eventCreatedDate}}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">Check In: {{$eventDetails->eventStartCheckin}}</div>
                                    <div class="col-md-6">Check Out: {{$eventDetails->eventEndCheckin}}</div>
                                </div>
                                <div class="row">
                                    <div class="col-md-8">
                                         <input type="text" id="checkInUser" />   
                                    </div>
                                    <div class="col-md-8">

                                    </div>
                                </div>
							@endif	
                            </div>
                        </div>
                    </div> <!-- end col -->    
                
                
                
                
            </div> <!-- end row -->
			
			<script>
				$( function() {
					   var options = {

					  url: function(phrase) {
						return siteUrl+"/people/list"
					  },

					  getValue: function(element) {
						return element.name;
					  },

					  ajaxSettings: {
						dataType: "json",
						method: "POST",
						data: {
						  dataType: "json"
						}
					  },
					  
					  list: {
						onClickEvent: function() {
							
							var userId = $("#checkInUser").getSelectedItemData().userId;
							checkIn(userId);
						}	
					},
					  
					  preparePostData: function(data) {
						data.phrase = $("#checkInUser").val();
						return data;
					  },

					  requestDelay: 400
					};

					$("#checkInUser").easyAutocomplete(options);

  } );
  
  
  function checkIn(userId){
	  alert(userId);
  }
			</script
        
        
@endsection


        
