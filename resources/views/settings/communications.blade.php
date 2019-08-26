@extends('layouts.default')

@section('content')
@if(session()->has('message'))
    <div class="alert alert-success" role="alert">
        {{ session()->get('message') }}
    </div>
@endif

<!-- Page-Title -->
<div class="row">
    <div class="col-sm-12">
        <div class="page-title-box">
            <div class="btn-group pull-right">
                <ol class="breadcrumb hide-phone p-0 m-0">
                    <li class="breadcrumb-item active">Communication Settings</li>
                </ol>
            </div>
        </div>
    </div>
</div>
<!-- end page title end breadcrumb -->

<div class="row">
    <div class="col-12">
        <div class="card m-b-30">
            <div class="card-body">

                <h4 class="mt-0 header-title">Communication Messages / Emails content Settings</h4>
                <div class="tab-content">
                    <div class="tab-pane active p-3" id="allusers" role="tabpanel">
                        <table id="userdatatable" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Subject</th>
                                    <th>Actions</th>
                                </tr>
                            </thead> 
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
</div> <!-- end row -->
@include('popup.settings.communication')
<script src="{{ URL:: asset('assets/theme/plugins/tinymce/tinymce.min.js')}}"></script>
<script src="{{ URL:: asset('assets/theme/plugins/tinymce/jquery.tinymce.min.js')}}"></script>
<script type="text/javascript">
    
   let commTemplates = [];
   let selectedTemplate = null;

    $(function () {
        getCommunicationTemplates();
        if($("#templateBodyInput").length > 0){
            tinymce.init({
                selector: "textarea#templateBodyInput",
                theme: "modern",
                menubar:false,
                statusbar: false,
                height:300,
                plugins: [
                            "advlist autolink link image lists charmap print preview hr anchor pagebreak spellchecker",
                            "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
                            "save table contextmenu directionality emoticons template paste textcolor"
                        ],
                toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor emoticons",
                style_formats: [
                    {title: 'Table row 1', selector: 'tr', classes: 'tablerow1'},
                    {title: '12px', inline: 'span', styles: {'font-size':'12pt'}},
                    {title: '14px', inline: 'span', styles: {'font-size': '14pt'}},
                    {title: '16px', inline: 'span', styles: {'font-size': '16pt'}},
                    {title: '18px', inline: 'span', styles: {'font-size': '18pt'}}, 
                ]
            });
        }    
    });

    function getCommunicationTemplates() {
        let apiPath = siteUrl + '/settings/communication/getOrgTemplates';
        let apiProps = {url: apiPath, method:'get', queryData:null}
        fetchDataApi(apiProps, function(data){
            commTemplates = data;
            updateDatatable();
        })
    }
    function updateDatatable() {
        commTemplates = commTemplates.map(function(item, index){
                            item.action = `<button class="btn btn primary" onClick="openModalWithTempalteBody(${item.id})">
                                            <i class="fa fa-edit"></i></button>`;
                            return item;
                        });
        $('#userdatatable').DataTable({
            "serverSide": false,
            "destroy": true,
            "autoWidth": true,
            "searching": true,
            "aaSorting": [[ 1, "desc" ]],
            data: commTemplates,
            columns: [
                { data: 'name' },
                { data: 'subject' },
                { data: 'action' }
            ]
        });
    }
    
    function openModalWithTempalteBody(templateId){
        let apiPath = siteUrl + '/settings/communication/getOrgTemplates/'+ templateId;
        let apiProps = {url: apiPath, method:'get', queryData:null}
        fetchDataApi(apiProps, function(data){
            selectedTemplate = data;
            updateModalContent();
        });
    }
    
    function updateModalContent(){
        $("#templateNameInput").val(selectedTemplate.name);
        $("#templateSubjectInput").val(selectedTemplate.subject);
        tinyMCE.get('templateBodyInput').setContent(selectedTemplate.body);
        $("#settingCommunication").modal("show");
    }

    function saveTemplate(){
        let apiPath = siteUrl + '/settings/communication/getOrgTemplates';
        selectedTemplate.name = $("#templateNameInput").val();
        selectedTemplate.subject = $("#templateSubjectInput").val();
        selectedTemplate.body = tinyMCE.get('templateBodyInput').getContent();

        let apiProps = {url: apiPath, method:'post', queryData:selectedTemplate}
        fetchDataApi(apiProps, function(data){
            delete selectedTemplate.body;
            let templateIndex = commTemplates.findIndex(function(item){
                return item.id == selectedTemplate.id;
            });
            commTemplates.splice(templateIndex, 1, selectedTemplate);
            updateDatatable();
            $("#settingCommunication").modal("hide");
        });
    }

    function cancelEditTemplate(){
        $("#settingCommunication").modal("hide");
    }
    // Calling Restfull Api's
    function fetchDataApi(props, callback){
        let payload = {};
        if(props.method == 'post'){
            payload = {
                method: props.method,
                body: props.method === 'post' ? JSON.stringify(props.queryData) : ''
            }
        }
        fetch(props.url, payload).then(
            function(response) {
            if (response.status !== 200) {
                throw new Error("failure with error code"+response.status)
            }
            response.json().then(function(data) {
                return callback(data);
            });
            }
        )
        .catch(function(err) {
            console.log('Fetch Error :-S', err);
        });
    }
</script>
@endsection