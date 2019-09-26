@extends('layouts.default')

@section('content')

    <div style="width:100vw">
        @include('groups.components.search_bar_header')

        <div id="data-container"></div>
        <div id="pagination-container"></div>



            <script>
                 $(document).ready(function() {
                    $('#pagination-container').pagination({
                        dataSource: siteUrl + '/groups/groupsListPagination',
                        locator: 'items',
                        totalNumberLocator: function(response) {
                            // you can return totalNumber by analyzing response content
                            return response.count;
                        },
                        pageSize: 8,
                        ajax: {
                            method:"post",
                            beforeSend: function() {
                                $('#data-container').html('Loading data from flickr.com ...');
                            }
                        },
                        callback: function(data, pagination) {
                            // template method of yourself
                            var html = simpleTemplating(data);
                            $('#data-container').html(html);
                        }
                    })
                });

                function simpleTemplating(data) {
                    var html = '<div class="row no-gutters">';
                    $.each(data, function(index, item){
                        html += '<div class="col-md-3">'+ item +'</div>';
                    });
                    html += '</div>';
                    return html;
                }
            </script>


    </div>
@endsection
