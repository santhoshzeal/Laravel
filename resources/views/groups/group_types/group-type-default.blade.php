<form method="post" action="{{ route('group_type.store') }}" name="create_group_type_form" id="create_group_type_form" enctype="multipart/form-data">
    <div id="create_resource_form_status"></div>
       <div class="row">

                       <div class="col-12">
                           <div class="card m-b-30 " style="margin-bottom: 0">
                               <div class="card-body">
                                   <input name="_token" type="hidden" value="{{ csrf_token() }}">

                                   <h6 class="fs-2 mb-2">Basic Settings</h6>
                                   <div class="card pane">
                                        <div class="card-body">

                                        <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-3 col-form-label">Meeting schedule</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" required="" type="text" value="{{ isset($groupType)?$groupType->d_meeting_schedule:'' }}" id="d_meeting_schedule" name="d_meeting_schedule" >
                                            </div>
                                        </div>


                                    <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-3 col-form-label">Description</label>
                                            <div class="col-sm-9">
                                                <textarea rows="4" required name="d_description" id="d_description" class="form-control">{{ isset($groupType)?$groupType->d_description:'' }}</textarea>
                                            </div>
                                        </div>

                                </div>
                            </div>



                            <h6 class="fs-2 mb-2">Location Settings</h6>
                                   <div class="card pane">
                                        <div class="card-body">

                                        <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-3 col-form-label">Location</label>
                                            <div class="col-sm-9">
                                                <input class="form-control"  type="text" value="{{ isset($groupType)?$groupType->d_meeting_schedule:'' }}" id="d_location" name="d_location" >
                                            </div>
                                        </div>



                                </div>
                            </div>

                            <h6 class="fs-2 mb-2">Contact Person</h6>
                            <div class="card pane">
                                 <div class="card-body">

                                 <div class="form-group row">
                                     <label for="example-date-input" class="col-sm-3 col-form-label">Contact email</label>
                                     <div class="col-sm-9">
                                         <input class="form-control"  type="text" value="{{ isset($groupType)?$groupType->d_contact_email:'' }}" id="d_contact_email" name="d_contact_email" >
                                     </div>
                                 </div>
                                </div>
                            </div>

                            <h6 class="fs-2 mb-2">Member Visibility</h6>
                            <div class="card pane">
                                 <div class="card-body">

                                 <div class="form-group row">
                                     <label for="example-date-input" class="col-sm-7 col-form-label">Members can see leader's:</label>
                                     <div class="col-sm-5">
                                         <input class="form-control"  type="text" value="{{ isset($groupType)?$groupType->d_contact_email:'' }}" id="d_contact_email" name="d_contact_email" >
                                     </div>
                                 </div>
                                </div>
                            </div>






                               </div>
                           </div>
                       </div> <!-- end col -->
                   </div>
    <input type="hidden" name="groupTypeId" value="{{ isset($groupType)?$groupType->id:'' }}" />
    <input type="submit" id="formSubmitBtn" style="display: none;" />
   </form>


