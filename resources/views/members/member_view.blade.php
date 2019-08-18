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
                                if(isSet($user['profile_pic'])){
                                    $profile_pic_image_json = json_decode(unserialize($user->profile_pic));
                                    $profile_pic_image = $profile_pic_image_json->download_path.$profile_pic_image_json->uploaded_file_name;
                                }
                                ?>
                                <div id="upload-demo-i" class="d-flex mr-3 rounded-circle">
                                <img class="d-flex mr-3 rounded-circle" src="{{$profile_pic_image}}" alt="Generic placeholder image" height="128">

                                </div>
                                <a href="" class="btnProfilePicEdit"  data-toggle="modal" data-target="#profilePicModal" style="text-align: right;"><i class="fa fa-edit"></i> </a>    
                                <!-- text-align: right;float: right; -->

                            </div><!-- end col -->
                            <?php
                                $edit_profile_url = "/people/member/management";
                                $member_id = request()->route()->parameters['personal_id'];
                                if($member_id){
                                    $edit_profile_url = $edit_profile_url ."/". $member_id;
                                }
                            ?>
                            <div class="col-md-6 col-lg-6 col-xl-7">
                                <h3>{{$user->name_prefix}} {{$user->first_name}} <?php echo ($user->given_name==''?'': '('.$user->given_name.')' );?> <?php echo ($user->nick_name==''?'': '"'. $user->nick_name .'"');?> {{$user->middle_name}}  {{$user->last_name}} <a href={{$edit_profile_url}} style="" type="button" class="btn btn-sm btn-primary"><i class="fa fa-edit"></i> Edit</a></h3>
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
                            {{$user->gender}}
                            <br/>{{$user->age}} years old ({{$user->dob_format}})
                            <br/>{{$user->life_stage}}
                        </div>
                        <div class="col-6">
                            <i class="fa fa-envelope"></i>&nbsp;{{$user->email}}
                            <br/>
                            <i class="fa fa-phone"></i>&nbsp;{{$user->mobile_no}}
                            <br/>
                            <i class="fa fa-address-card"></i>&nbsp;{{$user->address}}
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
                            <i class="fa fa-apple"></i>&nbsp;{{$user->grade_name_format}} Grade ({{$user->school_name_format}})
                        </div>
                        <div class="col-6">
                            <div class="card-header">
                                Social Profiles
                            </div>
                            <i class="fa fa-facebook"></i>&nbsp;{{$user->social_profile}}
                            <br/>
                            <i class="fa fa-twitter"></i>&nbsp;{{$user->social_profile}}
                            <br/>
                            <i class="fa fa-linkedin"></i>&nbsp;{{$user->social_profile}}
                            <br/>
                            <i class="fa fa-instagram"></i>&nbsp;{{$user->social_profile}}
                            <br/>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="col-lg-3" id="household-blocks">
        
    </div>
</div>
<!-- end row -->


 
<script src="{{ URL::asset('assets/crop/croppie.js') }}"></script>

<link rel="stylesheet" href="{{ URL::asset('assets/crop/croppie.css') }}">





@include('popup.modal_popup_member')



<script type="text/javascript">
    var houseHolds = [];
    var urlPath = location.pathname.split('/');
    var personal_id = urlPath[urlPath.length-1];
    var user = <?php echo json_encode($user) ?>;
    getHouseHolds();
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

    function getHouseHolds(){
        fetch('/api/people/member/households/'+ personal_id)
            .then(
                function(response) {
                if (response.status !== 200) {
                    console.log('Looks like there was a problem. Status Code: ' +
                    response.status);
                    return;
                }

                // Examine the text in the response
                response.json().then(function(data) {
                    updateHouseholdBlocks(data);
                });
                }
            )
            .catch(function(err) {
                console.log('Fetch Error :-S', err);
            });
    }

    function updateHouseholdBlocks(data){
        let el ='';
        if(data.length){
            el = updateHouseholdBlock(data);
            console.log("Ready to display household List");
        }else {
            el = getEmptyHouseholdBlock();
        }
        $("#household-blocks").append(el)
    }

    function openHouseholdModal(){
        console.log("Ready to open householdModal");
    }

    function getEmptyHouseholdBlock(){
        let card = `<div class="card">
            <div class="card-header" id="household-block-header">
               <h6> Household  <span class="float-right" onClick="openHouseholdModal()"><i class="fa fa-edit"></i></span></h6>
            </div>
            <div class="card-body text-center">
                <p><strong>${user.first_name} </strong> has not been added to a household yet.</p>
                <a onClick="openHouseholdModal()" class="btn btn-primary">Add one now</a>
            </div>
        </div>`;
        return card;
    }
    function updateHouseholdBlock(data){
        console.log(JSON.stringify(data));

        let cards = "";
        data.forEach(function(item, index){
            let userEls = "";
            item.users.forEach(function(userItem, index){
                console.log(`Item: ${JSON.stringify(userItem)}`);
                userEls+= `<p id="${'user-block'+userItem.id}"><i class="fa fa-user"></i> 
                    <a href="${user.id === userItem.id? '#' : '/people/member/'+ personal_id}" >
                        ${userItem.first_name} 
                        ${userItem.middle_name ?', ' +userItem.middle_name : ''}
                        ${userItem.last_name ?', ' +userItem.last_name : ''}
                    </a>
                    ${userItem.isPrimary === 1? '<i class="fa fa-star></i>' : '' } 
                </p><br/>`;
            })
            cards += `<div class="card">
                        <div class="card-header" id="household-block-header">
                        <h6> ${item.name}  <span class="float-right" onClick="openHouseholdModalWithId(${item.id})"><i class="fa fa-edit"></i></span></h6>
                        </div>
                        <div class="card-body">
                            ${userEls}
                        </div>
                    </div>`;
        });
        console.log(cards)
        return cards;
    }
    function openHouseholdModalWithId(household_id){
        console.log(household_id);
    }
</script>

@endsection
