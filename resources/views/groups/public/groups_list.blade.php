@extends("groups.public.layout.public_layout")

@section("content")
    <!-- @include("groups.public.layout.groups_select_blk") -->
    <div class="row">
      <div class="col-12">
 
    	 @foreach ($group_types as $types)
		 <div class="card m-b-30 card-body">
			<h4 class="card-title font-20 mt-0">{{ $types->name }}</h4>
			<p class="card-text">{{ $types->description }}</p>
			
			<p class="mb-0 m-t-20 text-muted">
	            	<span class="pull-left">
	            		<a href="{{URL::asset($org.'/groups/list')}}/{{ $types->id }}" type="button" class="btn btn-primary waves-effect waves-light"><i class="fa fa-plus"></i>View Groups</a>

	            	</span>
	            	<span class="pull-right">
	            		
	            			<img class="d-flex mr-3 rounded-circle" src="http://localhost/dallas/public/assets/uploads/organizations/1/profile/1575420319.png" alt="Generic placeholder image" height="64" />
	            		
	            		
	            	</span>
            </p>
		  </div>
<hr style="border: 1px solid red;">	 
         @endforeach		
       </div>
	</div>
@endsection