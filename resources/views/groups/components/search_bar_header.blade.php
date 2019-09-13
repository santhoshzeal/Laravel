<div class="row">
    <div class="col-md-12">
        <div class="" style="background-color:#4d5467">
            <div class="card-body" style="padding-bottom:0px;">
                <div class="row mb-5 mt-4">
                    <div class="col-sm-6 col-md-3">
                        <select class="select select--group-type custom-select">
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                        </select>
                    </div>
                    <div class="col-sm-6 col-md-3">
                        <a href="#" class="btn btn-secondary text-white border border-light rounded">Manage Group Types</a>
                    </div>
                </div>
                <ul class="nav nav-tabs">
                    <li class="nav-item">
                        <strong><a class="btn nav-link text-white {{request()->routeIs('groups') ? 'bg-secondary active' : ''}}" href='#'>Submissions</a></strong>
                    </li>
                    <li class="nav-item">
                        <strong><a class="btn nav-link text-white {{request()->routeIs('form.fields') ? 'bg-secondary active' : ''}}" href='#'>Fields</a></strong>
                    </li>
                    <li class="nav-item">
                        <strong><a class="btn nav-link text-white {{request()->routeIs('form.settings') ? 'bg-secondary active' : ''}}" href='#'>Settings</a></strong>
                    </li>
                </ul>    
            </div>
        </div>
    </div>
</div>
<script src="{{ URL:: asset('js/fetch_api_call.js')}}"></script>
<script src="{{ URL:: asset('js/url_query_filters.js')}}"></script>
<script src="{{ URL:: asset('js/groups/group_types.js')}}"></script>