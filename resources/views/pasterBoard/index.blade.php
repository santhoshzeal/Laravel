@extends('layouts.default')

@section('content')
            <!-- Page-Title -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="page-title-box">
                        <div class="btn-group pull-right">
                            <ol class="breadcrumb hide-phone p-0 m-0">
                                <li class="breadcrumb-item active">Post Management</li>
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
                                    <a href="{{URL::asset('pastor_board/manage')}}" class="btn btn-primary btn-lg btn-block">Manage Board</a>

                                    </div>
                            </div>
                        </div>
                    </div>
            <div class="col-lg-9">

                        <div class="card m-b-30">
                            <div class="card-body">

                                <h4 class="mt-0 header-title">Posts</h4>


                                <!-- -->
                                <div class="row" id="postList">





                                </div>
                                <br>
                                <!-- -->
                                <table id="pastorTable" class="table" style="display: none">
                                    <thead>
                                    <tr>

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

                //loadDatatable();

                loadPost(0);

              // $("#eventDateSearch").
            });

            function loadPost(offset){
                $.ajax({
                            type:'POST',
                            url: siteUrl + '/pastor_board/postList',
                            data:{offset:offset},
                            beforeSend:function(){
                                $('.load-more').show();
                            },
                            success:function(res){
                                $('.load-more').remove();
                                $('#postList').append(res.data);
                            }
                        });
            }

            $(document).ready(function(){
                $(window).scroll(function(){
                    var lastID = $("#postList .post-section").length;
                    if(($(window).scrollTop() == $(document).height() - $(window).height()) && (lastID != 0)){
                        loadPost(lastID);
                    }
                });
            });

                function loadDatatable(){
                    //var date = $('#eventDateSearch').datepicker('getFormattedDate',"yyyy-mm-dd");
                    pastorTable = $('#pastorTable').DataTable({
                        "serverSide": true,
                        "destroy": true,
                        limit:8,
                        "autoWidth": false,
                        "searching": false,
                        "scrollY":        800,
                        "deferRender":    true,
                        //"scroller":       true,
                        scroller: {
                            loadingIndicator: true
                        },
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
                            url: siteUrl + '/pastor_board/postList',
                        }, //'eventId', 'eventName','eventDesc' , 'eventFreq', 'eventCreatedDate', 'eventCheckin', 'eventStartCheckin', 'eventEndCheckin','eventLocation'
                        columns: [

                            {data: 'action', name: 'action', orderable: false, searchable: false},
                        ],
                        "initComplete": function(settings, json) {
                          // $("#eventsTable_filter").append('<button class="btn small btn-primary" id="eventDateSearch"  >Event Date</button>');

                        }
                    });
                }





                    </script>

@endsection



