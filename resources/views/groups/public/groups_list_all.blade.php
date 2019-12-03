@extends("groups.public.layout.public_layout")

@section("content")
    
			
    <div class="row">
	    @foreach ($list_all_group_types as $types)
      <div class="col-md-6 col-xl-3">
    	
		 <div class="card m-b-30 card-body">
			<h4 class="card-title font-20 mt-0">{{ $types->name }}</h4>
			<p class="card-text">{{ $types->description }}</p>
			<p class="card-text">
			    <small class="text-muted"></small>				
			</p>
		</div>	
            
       </div>
	   @endforeach
	</div>
					
@endsection