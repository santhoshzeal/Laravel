<form method="post" action="{{ route('group_type.store') }}" name="create_group_type_form" id="create_group_type_form" enctype="multipart/form-data">
    <div id="create_resource_form_status"></div>
       <div class="row">

                       <div class="col-12">
                           <div class="card m-b-30" style="margin-bottom: 0">
                               <div class="card-body">
                                   <input name="_token" type="hidden" value="{{ csrf_token() }}">


                                    <div class="form-group row">
                                       <label for="example-date-input" class="col-sm-3 col-form-label">Item Name</label>
                                       <div class="col-sm-9">
                                           <input class="form-control" required="" type="text" value="{{ isset($resource)?$resource->item_name:'' }}" id="item_name" name="item_name" >
                                       </div>
                                   </div>



                                   <div class="form-group row">
                                       <label for="example-date-input" class="col-sm-3 col-form-label">Description</label>
                                       <div class="col-sm-9">
                                           <textarea name="item_desc" id="item_desc" class="form-control">{{ isset($resource)?$resource->item_desc:'' }}</textarea>
                                       </div>
                                   </div>





                               </div>
                           </div>
                       </div> <!-- end col -->
                   </div>
    <input type="hidden" name="groupTypeId" value="{{ isset($resource)?$resource->id:'' }}" />
    <input type="submit" id="formSubmitBtn" style="display: none;" />
   </form>


