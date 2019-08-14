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
    <div class="col-md-12">
        <div class="card m-b-30 text-white card-danger" >
            <div class="card-body">
                <div class="media m-b-30">

                    <div class="media-body">
                        <div class="row">

                            <div class="col-md-4 col-lg-4 col-xl-2">
                                <?php
                                $profile_pic_image= url('/assets/uploads/organizations/avatar.png');
                                if($selectUserMasterDetail->profile_pic != null){
                                    $profile_pic_image_json = json_decode(unserialize($selectUserMasterDetail->profile_pic));
                                    $profile_pic_image = $profile_pic_image_json->download_path.$profile_pic_image_json->uploaded_file_name;
                                }
                                ?>
 


                                <div id="upload-demo-i" class="d-flex mr-3 rounded-circle">
                                <img class="d-flex mr-3 rounded-circle" src="{{$profile_pic_image}}" alt="Generic placeholder image" height="128">

                                </div>
                                <a href="" class="btnProfilePicEdit"  data-toggle="modal" data-target="#profilePicModal" style="text-align: right;"><i class="fa fa-edit"></i> </a>    
                                <!-- text-align: right;float: right; -->

                            </div><!-- end col -->

                            <div class="col-md-6 col-lg-6 col-xl-7">
                                <h3>{{$selectUserMasterDetail->name_prefix}} {{$selectUserMasterDetail->first_name}} <?php echo ($selectUserMasterDetail->given_name==''?'': '('.$selectUserMasterDetail->given_name.')' );?> <?php echo ($selectUserMasterDetail->nick_name==''?'': '"'. $selectUserMasterDetail->nick_name .'"');?> {{$selectUserMasterDetail->middle_name}}  {{$selectUserMasterDetail->last_name}} <button href="#" style="" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> Edit</button>    </h3>


                            </div><!-- end col -->

                            <div class="col-md-2 col-lg-2 col-xl-3">
                                <h3></h3>
                                <div class="dropdown mo-mb-2"  style="float: right !important;">
                                    <button type="button" class="btn btn-primary dropdown-toggle-split" data-toggle="dropdown"><i class="fa fa-user"></i></button>
                                    <button class="btn btn-success dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Member Status
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>


                            </div><!-- end col -->



                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>

<div class="row">
    <div class="col-lg-3">

        @include('members.member_profile_sidebar')

    </div>

    <div class="col-lg-6">
        <div class="card m-b-30">
            <div class="card-header">
                Personal Information
            </div>
            <div class="card-body">

                <div class="col-12">
                    <div class="row">
                        <div class="col-6">
                            {{$selectUserMasterDetail->gender}}
                            <br/>{{$selectUserMasterDetail->age}} years old ({{$selectUserMasterDetail->dob_format}})
                            <br/>{{$selectUserMasterDetail->life_stage}}
                        </div>
                        <div class="col-6">
                            <i class="fa fa-envelope"></i>&nbsp;{{$selectUserMasterDetail->email}}
                            <br/>
                            <i class="fa fa-phone"></i>&nbsp;{{$selectUserMasterDetail->mobile_no}}
                            <br/>
                            <i class="fa fa-address-card"></i>&nbsp;{{$selectUserMasterDetail->address}}
                            <br/>

                        </div>
                    </div>
                </div>
            </div>

            <hr>

            <div class="card-body">
                <div class="col-12">
                    <div class="row">
                        <div class="col-6">
                            <div class="card-header">
                                School
                            </div>
                            <i class="fa fa-apple"></i>&nbsp;{{$selectUserMasterDetail->grade_name_format}} Grade ({{$selectUserMasterDetail->school_name_format}})
                        </div>
                        <div class="col-6">
                            <div class="card-header">
                                Social Profiles
                            </div>
                            <i class="fa fa-facebook"></i>&nbsp;{{$selectUserMasterDetail->social_profile}}
                            <br/>
                            <i class="fa fa-twitter"></i>&nbsp;{{$selectUserMasterDetail->social_profile}}
                            <br/>
                            <i class="fa fa-linkedin"></i>&nbsp;{{$selectUserMasterDetail->social_profile}}
                            <br/>
                            <i class="fa fa-instagram"></i>&nbsp;{{$selectUserMasterDetail->social_profile}}
                            <br/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3">

        @include('members.member_house_hold')
        
        
    </div>
</div>
<!-- end row -->


 
<script src="{{ URL::asset('assets/crop/croppie.js') }}"></script>

<link rel="stylesheet" href="{{ URL::asset('assets/crop/croppie.css') }}">





@include('popup.modal_popup_member')



<script type="text/javascript">
$uploadCrop = $('#upload-demo').croppie({
    enableExif: true,
    viewport: {
        width: 128,
        height: 128,
        type: 'circle'
    },
    boundary: {
        width: 300,
        height: 300
    }
});


$('#upload').on('change', function () { 
    var reader = new FileReader();
    reader.onload = function (e) {
        $uploadCrop.croppie('bind', {
            url: e.target.result
        }).then(function(){
            console.log('jQuery bind complete');
        });
        
    }
    reader.readAsDataURL(this.files[0]);
});


$('.upload-result').on('click', function (ev) {
    $uploadCrop.croppie('result', {
        type: 'canvas',
        size: 'viewport'
    }).then(function (resp) {


        $.ajax({
            url: siteUrl+'/user_profile_file_upload',
            type: "POST",
            data: {"image":resp},
            success: function (data) {
                html = '<img src="' + resp + '" />';
                $("#upload-demo-i").html(html);
            }
        });
    });
});


</script>

@endsection
