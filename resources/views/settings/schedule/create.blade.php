@extends('layouts.default')

@section('content')
<div style="width:100vw">
    @include('settings.schedule.header')

    
    <div class="row">
        <div class="col-sm-0 col-md-1 col-lg-2"></div>
        <div class="col-sm-12 col-md-10 col-lg-8 card">
            <!-- <div class="card m-b-30"> -->
            <div class="card-body pl-0 pr-0">
                <h5 class="mt-0 pl-3"> {{($schedule_id)? 'Edit' : "Create" }} Schedule</h5>
                <hr />
                <div class="row p0 m-0">
                    <input id="scheduleId" value="{{$schedule_id}}" class="d-none">
                    <form id="scheduleForm" class="col-sm-12 card p-2">
                        <div class="row">
                            <div class="col-12">
                                <div class="card m-b-30">
                                    <div class="card-body">

                                        <!-- <h4 class="mt-0 header-title">Textual inputs</h4>
                                <p class="text-muted m-b-30 font-14">Here are examples of <code
                                        class="highlighter-rouge">.form-control</code> applied to each
                                    textual HTML5 <code class="highlighter-rouge">&lt;input&gt;</code> <code
                                            class="highlighter-rouge">type</code>.</p> -->

                                        <div class="form-group row">
                                            <label for="example-text-input" class="col-sm-2 col-form-label">Title</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="text" value="" id="example-text-input">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-2 col-form-label">Event Date</label>
                                            <div class="col-sm-10">
                                                <input class="form-control" type="date" value="2011-08-19" id="example-date-input">
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Select Event</label>
                                            <div class="col-sm-10">
                                                <select class="form-control">
                                                    <option>Select</option>
                                                    <option>Large select</option>
                                                    <option>Small select</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Notification Flag</label>
                                            <div class="col-sm-10">
                                                <select class="form-control">
                                                    <option>Select</option>
                                                    <option value="1">None</option>
                                                    <option value="2">SMS</option>
                                                    <option value="3">Email</option>
                                                    <option value="4">Both</option>
                                                </select>
                                            </div>
                                        </div>
                                        
                                        <div class="form-group row">
                                            <label class="col-sm-2 col-form-label">Team</label>
                                            <div class="col-sm-10">
                                                <select class="form-control" name="team_id" id="team_id">
                                                    <option value="">--Select-</option>
                                                    @foreach($team_id as $value)
                                                    
                                                    <option value="{{$value->id}}">{{$value->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group row">
                                            <label for="example-url-input" class="col-sm-2 col-form-label">Assign Type</label>
                                            <div class="col-sm-10">
                                                <div>
                                                    <!--class="btn-group btn-group-toggle" data-toggle="buttons"-->
                                                    <!-- <label class="btn btn-info  active"> -->
                                                    <label>
                                                        <input type="radio" name="is_manual_schedule" id="is_manual_schedule" autocomplete="off" checked value="2"> Manual
                                                    </label>
                                                    <!-- <label class="btn btn-info "> -->
                                                    <label>
                                                        <input type="radio" name="is_manual_schedule" id="is_manual_schedule" autocomplete="off" value="1"> Auto
                                                    </label>

                                                    <button style="margin-left:50px;" type="button" class="btn btn-warning btnAssignFlag" id="btnAssignFlag" <i class="fa fa-check"></i> Assign</button>

                                                </div>

                                            </div>
                                        </div>

                                        <div class="form-group row load_positions" id="load_positions">

                                        </div>

                                        <div class="form-group">
                                            <div>
                                                <button type="submit" class="btn btn-primary waves-effect waves-light">
                                                    Submit
                                                </button>
                                                <button type="reset" class="btn btn-secondary waves-effect m-l-5">
                                                    Cancel
                                                </button>
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

<script src="{{ URL:: asset('js/settings/schedule/schedule.js')}}"></script>
@endsection