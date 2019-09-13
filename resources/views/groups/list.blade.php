@extends('layouts.default')

@section('content')
    <div style="width:100vw">
        @include('groups.components.search_bar_header')
        <h1>Groups List comes to here</h1>
    </div>
    
<script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
@endsection