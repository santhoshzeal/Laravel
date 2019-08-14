
<div class="card m-b-30">
    @if(isset($hhdValue))
    <div class="card-body">
    <div style="float: right;" ><a href="" class="btnHouseholdEdit" id="{{$selectUserMasterDetail->user_id}}" onclick="display_household(this.id);" data-toggle="modal" data-target="#myModal"> <i class="fa fa-pencil fa-lg"></i></a></div>
    </div>
    @foreach($hhdValue as $key=>$hhdValueData)
    <div class="card-body">
        <h4 class="card-title font-20 mt-0">{{$key}} </h4>
            
            <?php
            $hhdValueDataAdult=$hhdValueData['Adult'];
            for($i=0;$i<count($hhdValueDataAdult);$i++){
                if($hhdValueDataAdult[$i]['life_stage'] == "Adult"){
            ?>    
                    <div class="media m-b-30">
                        <img class="d-flex mr-3 rounded-circle" src="{{$hhdValueDataAdult[$i]['hh_pic_image']}}" alt="Generic placeholder image" height="40">
                        <div class="media-body" style="line-height: 2.5 !important;">
                            <h7 class="mt-0 font-6">{{$hhdValueDataAdult[$i]['first_name']}} {{$hhdValueDataAdult[$i]['last_name']}} {!! $hhdValueDataAdult[$i]['starmark'] !!}</h7>
                        </div>
                    </div>
            <?php
                }                
            }
            if(isset($hhdValueData['Child'])){
                echo '<h9>Children</h9>';
                $hhdValueDataChild=$hhdValueData['Child'];
                for($i=0;$i<count($hhdValueDataChild);$i++){
                    if($hhdValueDataChild[$i]['life_stage'] == "Child"){
                ?>    
                        <div class="media m-b-30">
                            <img class="d-flex mr-3 rounded-circle" src="{{$hhdValueDataChild[$i]['hh_pic_image']}}" alt="Generic placeholder image" height="40">
                            <div class="media-body" style="line-height: 2.5 !important;">
                                <h7 class="mt-0 font-6">{{$hhdValueDataChild[$i]['first_name']}} {{$hhdValueDataChild[$i]['last_name']}} {!! $hhdValueDataChild[$i]['starmark'] !!}</h7>
                            </div>
                        </div>
                <?php
                    }                
                }
            }
            //dd($hhdValueData['Child']);
                
            
                
            
            ?>
        
            
            
    </div>
    <hr/>
    
    
    @endforeach
    @else
    <p>
        <span>{{$selectUserMasterDetail->first_name}} has not been added to a household yet. </span><br/>
        <a href="">Add one now</a>
    </p>
    @endif
</div>

<script type="text/javascript">
    function display_household(user_id){
        var dataString = 'user_id='+user_id;
        
        $.ajax({
            url: siteUrl+'/display_household',
            async: true,
            type: "POST",
            data: dataString,
            dataType: "json",
            cache: false,
            success: function (data){                
                $('#dynamic_household_details').html(data.view_household_details);
//                
//                if(data > 0){
//                    alert("y generated");
//                    //$('#loader_image').css('display','none');
//                }else if(data == -1){
//                    
//                    
//                    //$('#loader_image').css('display','none');
//                }else if(data == -2){
//                    
//                    
//                    //$('#loader_image').css('display','none');
//                }else{                    
//                    $('#dynamic_household_details').html(data.view_household_details);
//                    
//                    //$('#loader_image').css('display','none');
//                    
//                }
            }
        });
    }
</script>    