@extends("groups.public.layout.public_layout")

@section("content")
    <!-- @include("groups.public.layout.groups_select_blk") -->
    <div class="row">
      <div class="col-12">
 
    	 @foreach ($group_types as $types)
		 <div class="card m-b-30 card-body">
			<h4 class="card-title font-20 mt-0">{{ $types->name }}</h4>
			<p class="card-text">{{ $types->description }}</p>
			<p class="card-text">			    
				<a href="{{URL::asset($org.'/groups/list')}}/{{ $types->id }}" type="button" class="btn btn-primary waves-effect waves-light"><i class="fa fa-plus"></i>View Groups</a>
			</p>
		  </div>
		  <hr>	
         @endforeach		
       </div>
	</div>
@endsection