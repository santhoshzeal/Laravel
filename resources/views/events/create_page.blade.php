<form method="post" action="{{ route('events.store') }}" name="create_event_form" id="create_event_form">
<div class="row">
                    <div class="col-12">
                        <div class="card m-b-30">
                            <div class="card-body">
                                <input name="_token" type="hidden" value="{{ csrf_token() }}">
                                <div class="form-group row">
                                    <label for="example-text-input" class="col-sm-3 col-form-label">Title Event</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" value="" id="eventName" name="eventName">
                                    </div>
                                </div>
                                
                                 <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Date</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="date" value="" id="eventCreatedDate" name="eventCreatedDate" >
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea name="eventDescription" id="eventDescription" class="form-control" />
                                    </div>
                                </div>
                                
                                 <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Occurence</label>
                                    <div class="col-sm-9">
                                        <select id="eventFreq" name="eventFreq" class="form-control">
                                            <option value="Daily">Daily</option>
                                            <option value="Weekly">Weekly</option>
                                            <option value="None">None</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Child Care</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" type="text" value="" id="eventChildCare" name="eventChildCare" >
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Location</label>
                                    <div class="col-sm-9">
                                        <select id="eventLocation" name="eventLocation" class="form-control">
                                            <option value="Daily">Daily</option>
                                            <option value="Weekly">Weekly</option>
                                            <option value="None">None</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Building Block</label>
                                    <div class="col-sm-9">
                                        <select id="eventBuildingBlock" name="eventBuildingBlock" class="form-control">
                                            <option value="Daily">Daily</option>
                                            <option value="Weekly">Weekly</option>
                                            <option value="None">None</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Booked For</label>
                                    <div class="col-sm-6">
                                        <select id="eventBookedFor" name="eventBookedFor" class="form-control">
                                            <option value="room1">Room 1</option>
                                            <option value="room2">Room 2</option>
                                        </select>
                                        
                                    </div>
                                    <div class="col-sm-3">
                                        <button class="btn btn-primary">add person</button>
                                        
                                    </div>
                                </div>
                                
                                 <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Room</label>
                                    <div class="col-sm-9">
                                        <select id="eventRoom" name="eventRoom" class="form-control">
                                            <option value="room1">Room 1</option>
                                            <option value="room2">Room 2</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                
                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Suggested Resources</label>
                                    <div class="col-sm-9">
                                        <select id="eventSuggestedResources" name="eventSuggestedResources" class="form-control">
                                            <option value="Food Table">Food Table</option>
                                            <option value="Mobile">Mobile</option>
                                            <option value="Chair">Chair</option>
                                        </select>
                                        
                                    </div>
                                </div>
                                
                                 <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Notification</label>
                                    <div class="col-sm-4">
                                        <label class="radio-inline"><input type="radio" name="eventNotification"  value="yes">Yes</label>
                                        
                                        
                                    </div>
                                    <div class="col-sm-4">
                                       
                                        <label class="radio-inline"><input type="radio" name="eventNotification" checked value="no">No</label>
                                        
                                    </div>
                                </div>
                                
                            
                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
    
</form>