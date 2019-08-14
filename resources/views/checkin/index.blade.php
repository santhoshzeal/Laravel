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

                                <h4 class="mt-0 header-title">Event List</h4>
                                <p class="text-muted m-b-30 font-14 d-inline-block text-truncate w-100">.</p>

                                <ul class="list-inline widget-chart m-t-20 m-b-15 text-center">
                                    <li>
                                        <h4 class=""><span style="background-color: red;">&nbsp;&nbsp;</span></h4>
                                        <p class="text-muted">Regular</p>
                                    </li>
                                    <li>
                                        <h4 class=""><span style="background-color: green;">&nbsp;&nbsp;</span></h4>
                                        <p class="text-muted">Guest</p>
                                    </li>
                                    <li>
                                        <h4 class=""><span style="background-color: blue;">&nbsp;&nbsp;</span></h4>
                                        <p class="text-muted">Volunteer</p>
                                    </li>
                                </ul>

                                <canvas id="bar" height="300"></canvas>

                            </div>
                        </div>
                    </div> <!-- end col -->    
                
                
                
                
            </div> <!-- end row -->
        
        
@endsection


        
