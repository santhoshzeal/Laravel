<div class="row">
    <div class="col-md-12">
        <div class="" style="background-color:#4d5467">
            <div class="card-body" style="padding-bottom:0px;">
                <div class="row mb-5 mt-4">
                    <div class="col-sm-6 col-md-3 grpTypeSelect"></div>
                    <div class="col-sm-6 col-md-3">
                        <a href="{{URL::asset('/groups/types')}}" class="btn btn-secondary text-white border border-light rounded">Manage Group Types</a>
                    </div>
                </div>
                <ul class="nav nav-tabs groupsUrlTabs">
                </ul>    
            </div>
        </div>
    </div>
</div>
<script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
<script src="{{ URL:: asset('js/url_query_filters.js')}}"></script>
<script src="{{ URL:: asset('js/groups/group_types.js')}}"></script>