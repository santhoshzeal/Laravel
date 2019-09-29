<div class="col-lg-9">
    <div class="card m-b-30">
        <div class="card-header">
            Members Information
        </div>
        <div class="card-body">
            <div class="col-12">
                <div class="row">
                        <div class="tab-content" id="v-pills-tabContent">
                                <button class="btn btn-primary " onclick="addMembers">Add Member</button>


                                <table id="membersTable" class="table table-bordered">
                                        <thead>
                                        <tr>
                                            <th>First</th>
                                            <th>Last</th>
                                            <th>Role</th>
                                            <th>Member Action</th>
                                            <th>Phone</th>
                                            <th>Email</th>
                                            <th>Member Since</th>
                                        </thead>


                                        <tbody>

                                        </tbody>
                                    </table>
                        </div>

                </div>
            </div>
        </div>

    </div>
</div>
<script>
$(document).ready(function() {

    loadDatatable();



  // $("#eventDateSearch").
});

    function loadDatatable(){
        //var date = $('#eventDateSearch').datepicker('getFormattedDate',"yyyy-mm-dd");
        resourceTable = $('#membersTable').DataTable({
            "serverSide": true,
            "destroy": true,
            "autoWidth": false,
            "searching": true,
            "aaSorting": [[ 1, "desc" ]],
            "columnDefs": [
                {
                    "targets": 0,
                    "searchable": false,
                    "visible" : true
                    }
                ],
            "ajax": {
                type: "POST",
                data: {groupId:<?= $groupId ?>},
                url: siteUrl + '/groups/members/list',
            }, //'eventId', 'eventName','eventDesc' , 'eventFreq', 'eventCreatedDate', 'eventCheckin', 'eventStartCheckin', 'eventEndCheckin','eventLocation'
            columns: [
                {data: 'first_name', name: 'first_name'},
                {data: 'last_name', name: 'last_name'},
                 {data: 'role', name: 'role'},
                {data: 'action', name: 'action', orderable: false, searchable: false},
                {data: 'mobile_no', name: 'mobile_no'},
                {data: 'email', name: 'email'},
                {data: 'member_since', name: 'member_since'},
            ],
            "initComplete": function(settings, json) {
              // $("#eventsTable_filter").append('<button class="btn small btn-primary" id="eventDateSearch"  >Event Date</button>');

            }
        });
    }


function createResourceDialog(){
     createResourceDlg = BootstrapDialog.show({
        title:"Create Resource",
        size:"size-wide",
        message: $('<div></div>').load(siteUrl+"/resource/create_page"),
        buttons: [
            {
                label: 'Submit',
                cssClass: 'btn-primary',
                action: function(dialogRef){
                    submitCreateResource();
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
</script>
