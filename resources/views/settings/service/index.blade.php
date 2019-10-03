@extends('layouts.default')

@section('content')
            <!-- Page-Title -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-title-box">
                        <div class="btn-group pull-right">
                            <ol class="breadcrumb hide-phone p-0 m-0">
                                <li class="breadcrumb-item active">Service Management</li>
                            </ol>
                        </div>
                        <!--<h4 class="page-title">Roles Management</h4>-->
                        <!--<a href="{{URL::asset('role_create')}}" type="button" class="btn btn-primary waves-effect waves-light"><i class="fa fa-plus"></i>Add Role</a>-->
                    </div>
                </div>
            </div>
            <!-- end page title end breadcrumb -->

            <div class="row">
                    <div class="col-lg-3">
                        <div class="card m-b-30">
                            <div class="card-body">
                                <div class="button-items">
                                    <a href="{{URL::asset('settings/service')}}" class="btn btn-primary btn-lg btn-block">Services</a>
                                    <a href="{{URL::asset('settings/team')}}" class="btn btn-primary btn-lg btn-block">Teams</a>
                                    </div>
                            </div>
                        </div>
                    </div>
            <div class="col-lg-9">
                        <div class="card m-b-30">
                            <div class="card-body">

                                <h4 class="mt-0 header-title">Services</h4>

 
                                <!-- -->
                                <table id="serviceTable" class="table table-bordered">
                                    <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Action</th>
                                    </thead>


                                    <tbody>

                                    </tbody>
                                </table>


                            </div>
                        </div>
                    </div> <!-- end col -->




            </div> <!-- end row -->

            <script>

             $(document).ready(function() {
                loadServiceDatatable();                
            });

                function loadServiceDatatable(){
                    
                    serviceTable = $('#serviceTable').DataTable({
                        "serverSide": true,
                        "destroy": true,
                        "autoWidth": false,
                        "searching": true,
                        "aaSorting": [[ 0, "desc" ]],
                        "columnDefs": [
                            {
                                "targets": 0,
                                "searchable": false,
                                "visible" : true
                                }
                            ],
                        "ajax": {
                            type: "POST",
                            data: {},
                            url: siteUrl + '/settings/service/list',
                        }, 
                        columns: [
                            {data: 'name', name: 'name'},
                            {data: 'action', name: 'action', orderable: false, searchable: false},
                        ],
                        "initComplete": function(settings, json) {
                          // $("#eventsTable_filter").append('<button class="btn small btn-primary" id="eventDateSearch"  >Event Date</button>');

                        }
                    });
                }




            function submitCreateService(){

                $('#create_service_form').ajaxForm(function(data) {
                   $("#create_service_form_status").html(data.message);
                   setTimeout(function(){
                    createServiceDlg.close();
                        serviceTable.draw(false);
                    },2000);
                });

                //$("#create_resource_form").submit();
                $("#formSubmitBtn").click();
            }




                    </script>

@endsection



