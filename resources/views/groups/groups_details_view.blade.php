@extends('layouts.default')

@section('content')
<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item ">Groups</li>
                    <li class="breadcrumb-item active">Groups Details</li>
                </ol>
            </div>
            <!--<h4 class="page-title">Member Directory</h4>-->

        </div>
    </div>
</div>
<!-- end page title end breadcrumb -->

<div class="row">
    
    @include('groups.groups_details_header_block')

</div>

<div class="row">
    <div class="col-lg-3">

        @include('groups.groups_details_sidebar')

    </div>

    <div class="col-lg-9">
        <div class="card m-b-30">
            <div class="card-header">
                Group Information
            </div>
            <div class="card-body">
                <div class="col-12">
                    <div class="row">
                            <div class="tab-content" id="v-pills-tabContent">
                              <div class="tab-pane fade show active" id="v-pills-home" role="tabpanel" aria-labelledby="v-pills-home-tab">..home.</div>
                              <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">.profile..</div>
                              <div class="tab-pane fade" id="v-pills-messages" role="tabpanel" aria-labelledby="v-pills-messages-tab">.messages..</div>
                              <div class="tab-pane fade" id="v-pills-settings" role="tabpanel" aria-labelledby="v-pills-settings-tab">.settings..</div>
                            </div>
                    </div>
                </div>
            </div>
 
        </div>
    </div>
 
</div>
<!-- end row -->


 
<script src="{{ URL::asset('assets/crop/croppie.js') }}"></script>

<link rel="stylesheet" href="{{ URL::asset('assets/crop/croppie.css') }}">

 

@endsection
