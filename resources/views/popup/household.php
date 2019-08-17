<div id="household_popup" class="modal fade bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title mt-0" id="profilePicModal">Large modal</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-7 text-center">
                        <div id="upload-demo" style="width:350px"></div>
                    </div>
                    <div class="col-md-5" style="padding-top:30px;">
                        <strong>Select Image:</strong>
                        <br/>
                        <input type="file" id="upload">
                        <br/>
                        <button class="btn btn-success upload-result" data-dismiss="modal" >Submit</button>
                    </div>
                    
                </div>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
<script>
    let houseHoldPopUp = document.queryString('#household_popup');
    function openHouseHoldPopup(){
        // openHouseHoldPopup.css.
    }
</script>


@if(isset($hhdValue))
    <div class="card-body">
    <div style="float: right;" ><a href="" class="btnHouseholdEdit" id="{{$user->user_id}}" onclick="display_household(this.id);" data-toggle="modal" data-target="#myModal"> <i class="fa fa-pencil fa-lg"></i></a></div>
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
            ?>
        
            
            
    </div>
    <hr/>
    
    
    @endforeach
    @else
    <p>
        <span>{{$user->first_name}} has not been added to a household yet. </span><br/>
        <a href="">Add one now</a> 
        <a href="" class="btnProfilePicEdit"  data-toggle="modal" data-target="#myModal" style="text-align: right;">Add one now</i> </a>
    </p>
    @endif