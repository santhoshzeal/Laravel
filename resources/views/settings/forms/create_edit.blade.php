@extends('layouts.default')

@section('content')
    <div class="row">
        <div class="col-sm-12">
            <div class="text-white card-primary" >
                <div class="card-body">
                    <h6>Create New Form<a href="{{URL::asset('/settings/forms')}}" class="btn btn-secondary btn-sm pull-right">Forms List</a></h6>
                </div>
            </div>
        </div>
    </div>
    <div class="clearfix"></div>
    <div class="form_builder" style="margin-top: 25px">
                <div class="row">
                    <div class="col-sm-2">
                        <nav class="nav-sidebar">
                            <h6 class="text-secondary" style="margin-bottom:0px;">Profile Fields</h6><hr>
                            <ul class="nav profile_fields"></ul>
                            <h6 class="text-secondary" style="margin-bottom:0px;">Basic Form Fields</h6><hr>
                            <ul class="nav basic_fields"></ul>
                        </nav>
                    </div>
                    <div class="col-md-5">
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Form Title</span>
                            </div>
                            <input type="text" id="formTitle" class="form-control">
                        </div>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Description</span>
                            </div>
                            <input type="text" id="formTitle" class="form-control" >
                        </div>
                        <small><strong>First Name, Middle Name, Last Name and Email Address</strong> are always collected by every form.</small>
                        <div class="row bal_builder">
                            <div class="form_builder_area"></div>
                        </div>
                        
                    </div>
                    <div class="col-md-5">
                        <div class="col-md-12">
                            <form class="form-horizontal">
                                <div class="preview"></div>
                                <div style="display: none" class="form-group plain_html"><textarea rows="50" class="form-control"></textarea></div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
    <div class="row">
        <!-- Form Fields List and Form elements -->
        <div class="col-sm-8">
            
        </div>
    </div>
    <script src="{{ URL:: asset('assets/theme/plugins/jquery-ui/jquery-ui.min.js')}}"></script>
    <script src="{{ URL:: asset('js/form-build.js')}}"></script>
@endsection