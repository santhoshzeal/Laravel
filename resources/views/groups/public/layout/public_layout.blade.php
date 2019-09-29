<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>{{$title}}</title>
    <!-- Bootstrap CSS -->
    <link href="{{ URL::asset('assets/theme/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
</head>
<body>
    @include("groups.public.layout.header")
    @yield("content")
    @include("groups.public.layout.footer")
    <script src="{{ URL:: asset('assets/theme/js/jquery.min.js')}}"></script>
    <script src="{{ URL:: asset('assets/theme/js/popper.min.js')}}"></script>
    <script src="{{ URL:: asset('assets/theme/js/bootstrap.min.js')}}"></script>
</body>
</html>