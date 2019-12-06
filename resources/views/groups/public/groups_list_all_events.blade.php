

@extends("groups.public.layout.public_layout")

@section("content")

   

    <div class="container mt-3">
        <div class="row">
            <div class="col-lg-6">
            <input class="form-control" type="hidden" value="<?php echo $group_id ?>" id="group_id" name="group_id">
            <div class="demo-content">This group is open to new members.</div>
            </div>
            <div class="col-lg-6">
                <div class="demo-content bg-alt"><button type="button" onclick="createGroupJoinDialog()" class="btn btn-primary waves-effect waves-light">Join this group</button></div>
            </div>
         </div>
   </div>	
   
	<hr>

        <div class="row">
            <div class="col-xs-12">
                <div class="demo-content">Upcoming events</div>
            </div>
        </div>
        <hr>
        
        <div class="row">
           @if(count($list_all_group_events) > 0) 
            <div class="col-xs-12">
                @foreach ($list_all_group_events as $events)
                <div class="demo-content bg-alt">{{ $events->title }}</div>
                @endforeach
            </div>
            @else 
            <div class="col-xs-12">
                <div class="demo-content bg-alt">There are no events currently scheduled.</div>
            </div>            
            @endif
        </div>
					
@endsection

<script>

    var siteUrl = '<?php echo url('/'); ?>';

    function createGroupJoinDialog(){ 
            //alert($('#group_id').val());       
            var groupid = $('#group_id').val();
            //alert(groupid);
            groupJoinDlg = BootstrapDialog.show({
            title:"Join Group",
            size:"size-wide",
            message: $('<div></div>').load(siteUrl+"/groups/join_group?groupid="+groupid),
            buttons: [
                {
                    label: 'Submit',
                    cssClass: 'btn-primary',
                    action: function(dialogRef){
                        submitJoinGroup();
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


    function submitJoinGroup(){

        $('#create_join_group').ajaxForm(function(data) {
        $("#create_join_group_status").html(data.message);
        setTimeout(function(){
            groupJoinDlg.close();
            },2000);
        });

        $("#formSubmitBtn").click();
}

</script>