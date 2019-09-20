$(document).ready(function () {
    $(".container-fluid").addClass("m-0 p-0");
    $(".container-fluid").css({ width: "100vw" });
    $(".wrapper").css("padding-top", "118px");
    updateDatatable();
});

function updateDatatable() {
    $('#scheduleDatatable').DataTable({
        "serverSide": true,
        "destroy": true,
        "autoWidth": false,
        "searching": true,
        "aaSorting": [[1, "desc"]],
        "nowrap": true,
        "ajax": {
            type: "GET",
            url: siteUrl + `/api/settings/schedule/list`,
        }
    });
}