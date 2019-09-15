@extends('layouts.default')

@section('content')
    <div style="width:100vw">
        <div class="row">
            <div class="col-md-12" style="background-color:#4d5467">
                <div class="card-body">
                      <h3 class="text-white">Group Types</h3>  
                </div>
            </div>
        </div>
        <h5 class="text-center"> !! Groups Types List will be listed here !!</h5>
        <h5 class="text-center"> !! Under Implimentation !!</h5>
    </div>
    <script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
    <script src="{{ URL:: asset('js/groups/group_types_list.js')}}"></script>
@endsection