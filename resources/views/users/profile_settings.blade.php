@extends('layouts.default')

@section('content')


<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item active">Profile Settings</li>
                </ol>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-12">
        <div class="card m-b-30">
                <div class="card-body">                            
                        <h4 class="mt-0 header-title">Profile Information </h4>
                        
                        <div class="form-group row">
                            <label for="example-text-input" class="col-sm-2 col-form-label">Full Name</label>
                            <div class="col-sm-10">
                                  <div>{{ $get_profile_info->full_name }}</div>
                            </div>
                        </div>

                        <div class="form-group row">
                                <label for="example-email-input" class="col-sm-2 col-form-label">Email</label>
                                <div class="col-sm-10">
                                    <div>{{ $get_profile_info->email }}</div>
                                </div>
                        </div>

                        <div class="form-group row">
                                <label for="example-email-input" class="col-sm-2 col-form-label">Mobile</label>
                                <div class="col-sm-10">
                                    <div>{{ $get_profile_info->mobile_no }}</div>
                                </div>
                        </div>
                        
                        <div class="form-group row">
                            <label for="example-url-input" class="col-sm-2 col-form-label">Profile Image</label>                                
                            <div class="card-body">
                                    <?php

                                    $profile_pic_image= URL::asset('/assets/uploads/organizations/avatar.png');
                                    if(isset($get_profile_info->profile_pic)){
                                        $profile_pic_image_json = json_decode(unserialize($get_profile_info->profile_pic));
                                        $profile_pic_image = $profile_pic_image_json->download_path.$profile_pic_image_json->uploaded_file_name;
                                    }
                                    ?>         
                                   
                                <div class="">
                                    <img class="img-thumbnail" alt="200x200" style="width: 200px; height: 200px;" src="{{ $profile_pic_image }}" data-holder-rendered="true">
                                </div>
                            </div>
                        </div>
                </div>
        </div>
    </div> <!-- end col -->
</div> <!-- end row -->

<div class="button-items col-md-6">
      <input class="form-control" type="hidden" value="<?php echo $get_profile_info->id; ?>" id="userid" name="userid">
       <button type="button" onclick="createProfileDialog()" class="btn btn-primary waves-effect waves-light">Update Profile</button>
</div>


<script>

function createProfileDialog() {

        var userid = $('#userid').val();
        //alert(userid);

        createProfileDlg = BootstrapDialog.show({
        title:"Update Profile",
        size:"size-wide",
        message: $('<div></div>').load(siteUrl+"/people/profile_update?userid="+userid),
        buttons: [
            {
                label: 'Submit',
                cssClass: 'btn-primary',
                action: function(dialogRef){
                    submitUpdateProfile();
                }
            },
            {
                label: 'Cancel',
                action: function(dialogRef){
                    dialogRef.close();
                }
            }
        ]
    });
}

function submitUpdateProfile(){

    $('#profile_update_form').ajaxForm(function(data) {
        $("#cprofile_update_form_status").html(data.message);
        setTimeout(function(){
            createProfileDlg.close();   
            location.reload();         
        },1000);
    });

    $("#formSubmitBtn").click();
}


</script>

@endsection  
