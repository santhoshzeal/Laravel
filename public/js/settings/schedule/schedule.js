
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
 
    

    // $('.selecteventdate').datepicker({
    //     format: "dd-mm-yyyy",
    // })
    // .change(eventDateChanged);

 
function eventDateChanged(ev) {

    //alert("selecteventdate2"+ev.target.value);
    var datastring = "event_date="+ev.target.value;
    //alert(datastring+"--"+siteUrl);
    $.ajax({
        url: siteUrl + '/events/get_events_upon_date/'+ev.target.value,
        async: true,
        type: "GET",
        data: datastring,
        dataType: "html",
        // contentType: false,
        // cache: false,
        // processData: false,
        success: function (data)
        {
            //alert("s");
            console.log(data);
            $("#load_events").html(data);

            $("#event_id").val($("#event_id_hidden").val()).change();
        }

    }); 
    // $(this).datepicker('hide');
    // if ($('#startdate').val() != '' && $('#enddate').val() != '') {
    //     $('#period').text(diffInDays() + ' d.');
    // } else {
    //     $('#period').text("-");
    // }
}