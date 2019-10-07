<form method="post" action="{{ route('group.resources.store') }}" name="create_resources_form" id="create_resources_form" enctype="multipart/form-data">
    <div id="create_resources_form_status"></div>
       <div class="row">

                       <div class="col-12">
                           <div class="card m-b-30" style="margin-bottom: 0">
                               <div class="card-body">
                                   <input name="_token" type="hidden" value="{{ csrf_token() }}">


                                    <div class="form-group row">
                                       <label for="example-date-input" class="col-sm-3 col-form-label">File:</label>
                                       <div class="col-sm-9">
                                           <input class="form-control" required="" type="file" value="" id="file" name="file" >
                                       </div>
                                       <label for="example-date-input" class="col-sm-3 col-form-label">{{ isset($resource)?$resource->name:'' }}</label>
                                   </div>

                                    <div class="form-group row">
                                       <label for="example-date-input" class="col-sm-3 col-form-label">Name:</label>
                                       <div class="col-sm-9">
                                           <input class="form-control" required="" type="text" value="{{ isset($resource)?$resource->name:'' }}" id="name" name="name" >
                                       </div>
                                   </div>

                                   <div class="form-group row">
                                    <label for="example-date-input" class="col-sm-3 col-form-label">Description</label>
                                    <div class="col-sm-9">
                                        <textarea name="description" id="description" class="form-control">{{ isset($resource)?$resource->description:'' }}</textarea>
                                    </div>
                                </div>

                                <div class="form-group row">
                                        <label for="example-date-input" class="col-sm-3 col-form-label"> Visibility:</label>

                                        <div class="col-sm-9">
                                                <select id="visibility" name="visibility" class="form-control" required="">

                                                        <option value="1" <?= isset($resource)?($resource->visibility=='1')?'selected':'':'' ?>>Leaders</option>
                                                        <option value="2" <?= isset($resource)?($resource->visibility=='2')?'selected':'':'' ?>>Members</option>

                                                    </select>
                                    </div>


                                </div>









                               </div>
                           </div>
                       </div> <!-- end col -->
                   </div>
    <input type="hidden" name="resourceId" value="{{ isset($resource)?$resource->id:'' }}" />
    <input type="hidden" name="group_id" value="{{ $groupId }}" />
    <input type="submit" id="formSubmitBtn" style="display: none;" />
   </form>

   <script>

   </script>
