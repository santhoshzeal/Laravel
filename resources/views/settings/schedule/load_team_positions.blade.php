<!-- <div class="row"> -->
    <!-- <div class="col-lg-6"> -->
        <!-- <div class="card m-b-30"> -->
            <div class="card-body">

                <h4 class="mt-0 header-title">Assign Positions To Members</h4>
                <!-- <p class="text-muted m-b-30 font-14">Your awesome text goes here.</p> -->

                <table class="table table-dark">
                    <thead>
                        <tr>
                            <th>Position</th>
                            <th>Name</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                     

                        @foreach($loadTeamPositions as $loadTeamPositionsValues)
                            <tr>
                                <td>{{$loadTeamPositionsValues->position_name}}</td>
                                <td>{{$loadTeamPositionsValues->first_name}}</td>
                                <td><a href={{url("/settings/team/assign_position/". $loadTeamPositionsValues->scheduling_user_id)}}>  <i class='fa fa-pencil-square-o'></i></a></td>
                            </tr>
                        @endforeach
                        
                    </tbody>
                </table>

            </div>
        <!-- </div> -->
    <!-- </div>  -->
<!-- </div> -->