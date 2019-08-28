@extends('layouts.default')

@section('content')
    <div class="row">
        <div class="col-md-12">
            <div class="text-white card-primary" >
                <div class="card-body">
                    <h3>Forms<small><a href="{{URL::asset('/settings/forms/manage')}}" 
                                class="btn btn-secondary pull-right">New Form</a></small>
                    </h3>
                </div>
            </div>
        </div>
    </div>
    <div class="row text-center" style="margin-top:0">
        <div class="col-md-12 ">
            <div class="card bg-light">
                <div class="card-body col-sm-10 col-md-10 mx-auto" style="min-height:550px;">
                    <ul class="list-group text-left" id="formGroup">
                    </ul>
                </div>
            </div>
        </div>
    </div>
<script>
    let formItems = [
                    {id:1, name:"TestForm1", subcription_count:5},
                    {id:2, name:"LoginForm", subcription_count:85},
                    {id:3, name:"RegForm", subcription_count:6},
                    {id:4, name:"ResetForm", subcription_count:2},
                    {id:5, name:"LogListing", subcription_count:14},
                ];
    $(function () {
        updateFormsList();
    }); 

    function updateFormsList(){
        let formEls = [];
        if(formItems.length>0){
            formEls = formItems.map(function(item,index){
                        return `<li class="list-group-item">
                                    <h5>
                                        <a href="/settings/forms/${item.id}">${item.name}</a>
                                        <a class="pull-right" href="/forms/${item.id}" targent="_blank"><i class="fa fa-external-link"></i></a>
                                    </h5> 
                                    <p class="text-secondary m-0">${item.subcription_count} Submissions</p>
                                </li>`
                    });
            $("#formGroup").html(formEls);
        } else {
            $("#formGroup").removeClass("text-left");
            let El = `<li class="list-group-item">
                        <h4 class="text-primary">Forms</h4>
                        <p>Create custom forms to easily and securely collect<br/>
                            information from the people in your church.</p>
                        <p>Forms will show here afer you create them.</p>
                        <a href="/settings/forms/manage" class="btn btn-primary"> New Form</a>
                    </li>`;
            $("#formGroup").html(El);
        }
    }

</script>
@endsection