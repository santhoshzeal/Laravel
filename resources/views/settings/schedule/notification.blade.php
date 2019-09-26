@extends('layouts.default')

@section('content')

    <div style="width:100vw">
    @include('settings.schedule.header')
        <div class="row">
            <div class="col-sm-0 col-md-1 col-lg-2"></div>
            <div class="col-sm-12 col-md-10 col-lg-8 card">
                <div class="card-body pl-0 pr-0">
                    <h5 class="mt-0 pl-3"> Notifications</h5><hr/>
                    <div class="row p0 m-0">
                        <div class="card col-sm-12">
                            <div class="card-body">
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
                    </div>
                </div>
            </div>
        </div>
    </div>

@include('popup.settings.communication')
<script src="{{ URL:: asset('assets/theme/plugins/tinymce/tinymce.min.js')}}"></script>
<script src="{{ URL:: asset('assets/theme/plugins/tinymce/jquery.tinymce.min.js')}}"></script>
<script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
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
        let apiPath = siteUrl + '/api/settings/schedule/notificationsList';
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
    
</script>
@endsection