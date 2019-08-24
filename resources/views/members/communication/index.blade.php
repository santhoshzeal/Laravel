@extends('layouts.default')

@section('content')
@if(session()->has('message'))
    <div class="alert alert-success" role="alert">
        {{ session()->get('message') }}
    </div>
@endif

<div class="row">
    
    @include('members.member_profile_header_block')

</div>
<div class="row">
    <div class="col-lg-12">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link" href="{{ URL::asset('/people/member/'.$user->personal_id)}}"><i class="fa fa-user fa-lg"></i>&nbsp;Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fa fa-commenting fa-lg"></i>&nbsp;Communication</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<div class="row">
    <div class="col-lg-12">
        <div class="card m-b-30">
            <div class="card-body">

                <h4 class="mt-0 header-title">Communications</h4>

                <!-- Tab panes -->
                <div class="tab-content comm-table">
                    <div class="tab-pane active" id="allusers" role="tabpanel">
                        <table id="userdatatable" class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th>Sl No</th>
                                    <th>Header</th>
                                    <th>Subject</th>
                                    <th>Body</th>
                                    <!-- <th>Read Status</th>
                                    <th>Del Status</th> -->
                                    <th>Created By</th>
                                    <th>Created At</th>
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
    let user = <?php echo json_encode($user) ?>;

    $(function () {
        load_userdatatable();
    }); 
    
    function load_userdatatable() {
        console.log("Calling Ajax Function");
        $('#userdatatable').DataTable({
            "serverSide": true,
            "destroy": true,
            "autoWidth": false,
            "searching": false,
            "aaSorting": [[ 1, "desc" ]],
            "nowrap" : false,
            "columnDefs": [
                {
                    "targets": 0,
                    "searchable": false,
                    "visible" : true
                    }
                ],
            "ajax": {
                type: "GET",
                url: siteUrl + `/api/people/member/${user.personal_id}/get_messages`,
            }
        });

    }
</script>    
@endsection
