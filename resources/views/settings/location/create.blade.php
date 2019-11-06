<form method="post" action="{{ route('location.store') }}" name="create_location_form" id="create_location_form" enctype="multipart/form-data">
 <div id="create_room_form_status"></div>
    <div class="row">

                    <div class="col-12">
                        <div class="card m-b-30" style="margin-bottom: 0">
                            <div class="card-body">
                                <input name="_token" type="hidden" value="{{ csrf_token() }}">


                                 <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Name</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" required="" type="text" value="{{ isset($location)?$location->name:'' }}" id="name" name="name" >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Latitude</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" required="" type="text" value="{{ isset($location)?$location->latitude:'' }}" id="latitude" name="latitude" >
                                    </div>
                                </div>

                                <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Longitude</label>
                                    <div class="col-sm-9">
                                        <input class="form-control" required="" type="text" value="{{ isset($location)?$location->longitude:'' }}" id="longitude" name="longitude" >
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div> <!-- end col -->
                </div>
 <input type="hidden" name="locationId" value="{{ isset($location)?$location->id:'' }}" />
 <input type="submit" id="formSubmitBtn" style="display: none;" />
</form>

