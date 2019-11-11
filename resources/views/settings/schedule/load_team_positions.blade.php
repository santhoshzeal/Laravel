<div class="card-body">

    <h4 class="mt-0 header-title">Assign Positions To Members</h4>
    <!-- <p class="text-muted m-b-30 font-14">Your awesome text goes here.</p> -->

    <table class="table table-dark">
        <thead>
            <tr>
                <th>Position</th>
                <th>Name</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
         

            @foreach($loadTeamPositions as $loadTeamPositionsValues)
                <tr>
                    <td>{{$loadTeamPositionsValues->position_name}}</td>
                    <td>{{$loadTeamPositionsValues->first_name}}</td>
                    <td>
                        <button onclick="javascript:onLoadModalMember({{$loadTeamPositionsValues->team_id}},{{$loadTeamPositionsValues->positionid}});" type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#modal-schedule-assign"><i class='fa fa-pencil-square-o'></i>Assign</button></td>
                </tr>
            @endforeach
            
        </tbody>
    </table>

</div>


<div class="modal fade bs-example-modal-center" id="modal-schedule-assign" data-backdrop="static" data-keyboard="false"  role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
    {!! Form::open(array('id'=>'positionCreateForm','name'=>'positionCreateForm','method' => 'post', 'url' => url('position_data_insert'), 'class' => '')) !!}
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title position_modal_title">Assign Member</h4>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body form-horizontal positionbody">
                <div class="form-group no-bg">
                    <label for="" class="col-sm-10 control-label text_align_right" style="text-align: left !important;">Select Member</label>
                    <div class="col-sm-9">
                        <input type="hidden" name="hidden_positionID" id="hidden_positionID" value="" />
                        <div id="loadmemberdropdown_div"></div>
                        
                    </div>
                </div>
                <button type="button" class="btn btn-success margin pull-left" id="btnCreatePosition">Save</button>
                <button type="button" class="btn btn-danger margin pull-right" data-dismiss="modal">Cancel</button>
                <div class="clear"></div>
            </div>
        </div><!-- /.modal-content -->
    {!! Form::close() !!}
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<link href="{{ URL::asset('assets/select2/select2.css') }}" rel="stylesheet" type="text/css" />
<script src="{{ URL:: asset('assets/select2/select2.js')}}"></script>

<script type="text/javascript">

    function onLoadModalMember(teamid,posid){
        var datastring = "user_pos_id="+posid+"&user_team_id="+teamid;
        
        //alert(datastring);
        $.ajax({
            url: siteUrl + '/settings/position/load_member_on_ass_schedule',
            async: true,
            type: "POST",
            data: datastring,
            dataType: "html",
            // contentType: false,
            // cache: false,
            // processData: false,
            success: function (data)
            {
                $("#loadmemberdropdown_div").html(data);

                $(".selectddmember").select2();
                $(".selectddmember").val(1).change();
            }

        }); 
    }
    

</script>