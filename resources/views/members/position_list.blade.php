@extends('layouts.default')

@section('content')
<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item ">Member Directory</li>
                    <li class="breadcrumb-item active">Member Profile</li>
                </ol>
            </div>
            <!--<h4 class="page-title">Member Directory</h4>-->

        </div>
    </div>
</div>
<!-- end page title end breadcrumb -->

<div class="row">
    
    @include('members.member_profile_header_block')

</div>

<div class="row">
    <div class="col-lg-3">

        @include('members.member_profile_sidebar')

    </div>

    <div class="col-lg-6">
        <div class="card m-b-30">
            <div class="card-header">
                Position
            </div>
            

            
        </div>
    </div>

    <div class="col-lg-3" id="household-blocks">
        
    </div>
</div>
<!-- end row -->




<script type="text/javascript">

</script>

@endsection
