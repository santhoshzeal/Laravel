@extends('layouts.default')

@section('content')
    <div style="width:100vw">
    @include('settings.schedule.header')
        <div class="row m-5 pl-5 pr-5">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="card m-b-30">
                    <div class="card-body">
                        <h5 class="mt-0">{{($schedule_id)? 'Edit' : "Create" }} Schedule</h5>
                        <hr/>
                        <div class="row">
                            <input id="scheduleId" value="{{$schedule_id}}" class="d-none">
                            <form id="scheduleForm" class="col-sm-12 card pr-5 pl-5 pt-2" novalidate></form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
    <script src="{{ URL:: asset('js/settings/schedule/create.js')}}"></script>
@endsection