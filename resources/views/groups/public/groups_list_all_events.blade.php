@extends("groups.public.layout.public_layout")

@section("content")
			
    <div class="row">
       <p class="card-text">
            <button type="button" onclick="createGroupJoinDialog()" class="btn btn-primary waves-effect waves-light">Join this Group</button>            
	   </p>
	    @foreach ($list_all_group_events as $events)
      <div class="col-md-6 col-xl-3">
    	
		 <div class="card m-b-30 card-body">
			<h4 class="card-title font-20 mt-0">{{ $events->title }}</h4>
		</div>	
            
       </div>
	   @endforeach
	</div>
					
@endsection

<script>

    var siteUrl = '<?php echo url('/'); ?>';

    function createGroupJoinDialog(){        
            groupJoinDlg = BootstrapDialog.show({
            title:"Join Group",
            size:"size-wide",
            message: $('<div></div>').load(siteUrl+"/groups/join_group"),
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
                postTable.draw(false);
            },2000);
        });

        $("#formSubmitBtn").click();
}

</script>