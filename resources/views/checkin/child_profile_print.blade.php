<style>
    
    

    @media print {
        #profileBlockPrint {
            color:red;
        }
        #profileBlockPrint img {
            width: 50%;
        }
    }
</style>

<div class="container" id="profileBlockPrint">
    
    <div class="row">
        <div class=" col-md-12">
            <div class="well well-sm">
                <div class="row">
                    <div class=" col-md-6" style="float:left; width: 50%">
                        <img src="{{$profileDetails->user_image}}" alt=""  class="img-rounded img-responsive child-img"  />
                    </div>
                    <div class=" col-md-6" style="float:right;width: 50%">
                        <h6>
                             {{$profileDetails->full_name}}</h6>
                        
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i>Contact No: {{$profileDetails->mobile}}
                            <br />
                          
                            <i class="glyphicon glyphicon-gift"></i>Event: {{$profileDetails->eventName}}</p>
                        <!-- Split button -->
                        <div class="    ">
                            
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>