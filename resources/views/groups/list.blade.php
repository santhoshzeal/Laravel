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
                        html += '<div class="col-md-3 p-3">'+ item +'</div>';
                    });
                    html += '</div>';
                    return html;
                }

                function addGroup(){

                    $html = `<form method="post" action="http://localhost/dallas/public/groups/types/store" name="create_group_form" id="create_group_form" enctype="multipart/form-data">
                                <div id="create_group_form_status"></div>
                                <div class="row">
                                                <div class="col-12">
                                                    <div class="card m-b-30" style="margin-bottom: 0">
                                                        <div class="card-body">
                                                            <input name="_token" type="hidden" value="{{ csrf_token() }}">


                                                                <div class="form-group row">
                                                                <label for="example-date-input" class="col-sm-3 col-form-label">Group Type:</label>
                                                                <div class="col-sm-9">
                                                                    <input class="form-control" required="" type="text" value="" id="add_group_type" name="add_group_name">
                                                                </div>
                                                            </div>



                                                            <div class="form-group row">
                                                                <label for="example-date-input" class="col-sm-3 col-form-label">Group Name:</label>
                                                                <div class="col-sm-9">
                                                                    <input class="form-control" required="" type="text" value="" id="add_group_name" name="add_group_name">
                                                                </div>
                                                            </div>





                                                        </div>
                                                    </div>
                                                </div> <!-- end col -->
                                            </div>
                                <input type="hidden" name="groupTypeId" value="">
                                <input type="submit" id="formSubmitBtn" style="display: none;">
                            </form>`;
                    BootstrapDialog.show({
                        title: 'Button Hotkey',
                        message: addGroup,
                        buttons: [{
                            label: '(Enter) Button A',
                            cssClass: 'btn-primary',

                            action: function() {
                                alert('You pressed Enter.');
                            }
                        }]
                    });

                    gTypeSelectEl

                }
            </script>


    </div>
@endsection
