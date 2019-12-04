<form method="post" action="{{ route('groups.storejoinGroup') }}" name="create_join_group" id="create_join_group" enctype="multipart/form-data">
 <div id="create_join_group_status"></div>
    <div class="row">

                    <div class="col-12">
                        <div class="card m-b-30" style="margin-bottom: 0">
                            <div class="card-body">
                                <input name="_token" type="hidden" value="{{ csrf_token() }}">
								
                                 <div class="form-group row">
                                        <label for="example-date-input" class="col-sm-12 col-form-label">Ask to join this group</label>
                                        <label for="example-date-input" class="col-sm-3 col-form-label">Name</label>
                                        <div class="col-sm-9">
                                            <input class="form-control" required="" type="text" value="" id="contact_name" name="contact_name">
                                        </div>
                                    </div>

                                    <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-3 col-form-label">E-Mail Address</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" required="" type="text" value="" id="contact_email" name="contact_email">
                                            </div>
                                    </div>

                                    <div class="form-group row">
                                            <label for="example-date-input" class="col-sm-3 col-form-label">Phone Number</label>
                                            <div class="col-sm-9">
                                                <input class="form-control" required="" type="text" value="" id="contact_phone" name="contact_phone">
                                            </div>
                                    </div>

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
 <input type="submit" id="formSubmitBtn" style="display: none;" />
</form>

