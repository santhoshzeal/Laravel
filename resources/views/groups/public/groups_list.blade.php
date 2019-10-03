@extends("groups.public.layout.public_layout")

@section("content")
    @include("groups.public.layout.groups_select_blk")
    <div class="row" id="group-list-content"></div>
    <script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
    <script src="{{ URL:: asset('js/groups/public/group_types.js')}}"></script>
@endsection