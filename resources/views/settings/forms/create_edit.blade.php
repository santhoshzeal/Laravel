@extends('layouts.default')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="text-white card-primary" >
                <div class="card-body">
                    <h3>Create New Form<small><a href="{{URL::asset('/settings/forms')}}" 
                                class="btn btn-secondary pull-right">Forms List</a></small>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row" style="margin-top:15px;">
        <!-- Form Fields List and Form elements -->
        <div class="col-sm-8">
            <div class="card">
                <div class="card-body">
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-lg" style="width:120px;">Form Title</span>
                        </div>
                        <input type="text" id="formTitle" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm">
                    </div>
                    <div class="input-group input-group-lg">
                        <div class="input-group-prepend">
                            <span class="input-group-text" id="inputGroup-sizing-lg1" style="width:120px;">Description</span>
                        </div>
                        <input type="text" id="formTitle" class="form-control" aria-label="Large" aria-describedby="inputGroup-sizing-sm1">
                    </div>
                </div>

                <div class="card-body" style="border:2px solid #f0f0f0">
                    <strong>First Name, Middle Name, Last Name and Email Address</strong>
                        are always collected by every form.
                    </<strong>
                </div>
                <div class="card-body bg-primary" id="dropdownElsList">
                </div>
            </div>
        </div>
        <!-- Add a Fields Block -->
        <div class="col-sm-4 " style="min-height:450px;">
            <div class="card">
                <h5 class="card-title bg-primary" style="margin:0px; padding:15px;">Add A Field</h5>
                <div class="card-body">
                    <h6 class="card-title text-secondary">Profile Fields</h6>
                    <div id="profileFields"></div>
                </div>
                <div class="card-body">
                    <h6 class="card-title text-secondary">Basic Fields</h6>
                    <div id="basicFields"></div>
                </div>
            </div>
        </div>
    </div>
    <script>
    let personalFieldsList = [{title:"Phone Number", tag:"mobile_no", icon:"fa fa-phone", isRequired:false},
                              {title:"Address", tag:"address", icon:"fa fa-address-card", isRequired:false},
                              {title:"Birthday", tag:"dob", icon:"fa fa-birthday-cake", isRequired:false},
                              {title:"Grade", tag:"grade_id", icon:"fa fa-apple", isRequired:false},
                              {title:"Medical Note", tag:"medical_note", icon:"fa fa-heartbeat", isRequired:false},
                              {title:"Marital Status", tag:"marital_status", icon:"fa fa-users", isRequired:false},
                              {title:"Life Stage", tag:"life_stage", icon:"fa fa-user", isRequired:false},
                              {title:"Gender", tag:"gender",  icon:"fa fa-mars-double", isRequired:false}
                            ];
    let basicFieldsList = [{fieldTitle:"Text", inputType:"text", title:"", description:"", isRequire:false},
                              {fieldTitle:"Paragraph", inputType:"textarea", title:"", description:"", isRequire:false},
                              {fieldTitle:"Checkbox", inputType:"checkbox", title:"", description:"", isRequire:false},
                              {fieldTitle:"Date", inputType:"data", title:"", description:"", isRequire:false},
                              {fieldTitle:"Number", inputType:"number", title:"", description:"", isRequire:false},
                              {fieldTitle:"Section Heading", inputType:null, title:"", description:""}
                            ];
    $(function () {
        updateProfileFields();
        updateBasicFields();
    }); 

    function updateProfileFields(){
        let profileEls = personalFieldsList.map(function(item, index){
                            return `<p id="personalField-${index}" class="form-settings-fields">
                                        <i class="${item.icon}"></i> ${item.title}
                                    </p>`
                        });
        $("#profileFields").html(profileEls);
    }
    function updateBasicFields(){
        let profileEls = basicFieldsList.map(function(item, index){
                            return `<p id="basicField-${index}" class="form-settings-fields">
                                        ${item.fieldTitle}
                                    </p>`
                        });
        $("#basicFields").html(profileEls);
    }

</script>
@endsection