<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>{{$title}}</title>
        <link href="{{ URL::asset('assets/theme/css/bootstrap.min.css') }}" rel="stylesheet" type="text/css" />
        <script>var siteUrl = '<?php echo url('/'); ?>';</script>
        <style>
            .pane {
                margin-bottom: 1.5rem;
                border-color: #EBEBEB;
                box-shadow: 0 2px 5px rgb(153, 153, 153);
            }
        </style>
    </head>
    <body>
        @include("groups.public.layout.header")
        <input type="text" class="d-none" id="orgObj" data-org="{{$org}}">
        <div class="container-fluid d-flex justify-content-center bg-light" style="min-height:80vh">
            <div class="row p-4 bg-white" >
                <div class="col-sm-12 col-md-6" style="min-width:60vw;">
                    @yield("content")
                </div>
            </div>
        </div>
        @include("groups.public.layout.footer")
        <script src="{{ URL:: asset('assets/theme/js/jquery.min.js')}}"></script>
        <script src="{{ URL:: asset('assets/theme/js/popper.min.js')}}"></script>
        <script src="{{ URL:: asset('assets/theme/js/bootstrap.min.js')}}"></script>
    </body>
</html>