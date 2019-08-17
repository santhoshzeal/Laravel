
<div class="modal-content">
            <div class="modal-header bg-secondary">
                
                <h5 class="modal-title mt-0" id="myModalLabel">{{$user->householdName}}</h5>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            </div>
            <div class="modal-body">
                
                @if(isset($hhdValue))
                
                <div class="col-lg-12">
                @foreach($hhdValue as $key=>$hhdValueData)
                
                    <div class="card m-b-30">
                        <div class="card-body">
                            <div class="media">
                                <div class="media-body">
                                    <a href="#" class=""><h4>{{$key}}</h4></a>
                                    <ul class="social-links list-inline mb-0">
                                        
                                        
                                        <?php
                                        for($i=0;$i<count($hhdValueData);$i++){
                                        ?>
                                        
                                        <li class="list-inline-item">
                                            <img class="d-flex mr-3 rounded-circle img-thumbnail thumb-md" src="{{$hhdValueData[$i]['hh_pic_image']}}" alt="Generic placeholder image">
                                        </li>
                                        
                                        <?php
                                        }
                                        ?>
                                        
                                        
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>                    
                    
                @endforeach   
                
                    <div class="card m-b-30">
                        <div class="card-body">
                            <div class="media">
                                <div class="media-body">
                                    <button type="button" class="btn btn-primary"  onclick="">add household</button>
                                </div>
                            </div>
                        </div>
                    </div>   
                </div> <!-- end col -->
                

                @else
                    <p>
                        <span>{{$user->first_name}} has not been added to a household yet. </span><br/>
                        <a href="">Add one now</a>
                    </p>
                @endif
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary waves-effect" data-dismiss="modal">Close</button>
                <!--<button type="button" class="btn btn-primary waves-effect waves-light">Save changes</button>-->
            </div>
        </div><!-- /.modal-content -->