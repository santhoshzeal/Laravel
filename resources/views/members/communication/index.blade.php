@extends('layouts.default')

@section('content')
@if(session()->has('message'))
    <div class="alert alert-success" role="alert">
        {{ session()->get('message') }}
    </div>
@endif

<div class="row">
    <div class="col-12">
        <div class="card m-b-30">
            <div class="card-body">

                <h4 class="mt-0 header-title">Communications</h4>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div class="tab-pane active p-3" id="allusers" role="tabpanel">
                        <table id="userdatatable" class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>Photo</th>
                                    <th>First Name/ Last Name</th>
                                    <th>E-Mail Address</th>
                                    <th>Created At</th>
                                    <th>Updated At</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- end col -->
</div> <!-- end row -->

<script type="text/javascript">
    
    

$(function () {
    load_userdatatable();
    load_admin_datatable();
    
});    
    var userdatatable;
    var userdatatable_datastring = {admindatatable: 2};
    
    function load_userdatatable() {
        userdatatable = $('#userdatatable').DataTable({
            "serverSide": true,
            "destroy": true,
            "autoWidth": false,
            "searching": false,
            "aaSorting": [[ 1, "desc" ]],
            "columnDefs": [
                {
                    "targets": 0,
                    "searchable": false,
                    "visible" : true
                    }
                ],
            "ajax": {
                type: "GET",
                data: userdatatable_datastring,
                url: siteUrl + '/get_usermaster_data',
            }
        });

    }
</script>    
@endsection
