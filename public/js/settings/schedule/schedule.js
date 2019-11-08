
$("#btnAssignFlag").click(function () {

    var datastring = "is_manual_schedule="+$("#is_manual_schedule").val()+"&team_id="+$("#team_id").val();
    //alert(datastring);
    $.ajax({
        url: siteUrl + '/settings/position/load_schedule_positions',
        async: true,
        type: "POST",
        data: datastring,
        dataType: "html",
        // contentType: false,
        // cache: false,
        // processData: false,
        success: function (data)
        {

            $("#load_positions").html(data);
        }

    }); 
});