let scheduleId = recievedData = null;
let events = volunteer_types = [];
let sFields = ['title', 'date', 'time', 'event_id', 'location_id',
    'building_block', 'type_of_volunteer', 'checker_count',
    'is_auto_schedule', 'is_manual_schedule', 'notification_flag'];
let buildBlks = [{ id: 1, name: "daily" }, { id: 2, name: "weekly" }, { id: 999, name: "none" }];
let locations = [{ id: 1, name: "location1" }, { id: 2, name: "location2" }, { id: 3, name: "location3" }];
let schedule = {};

$(document).ready(function () {
    $(".container-fluid").addClass("m-0 p-0");
    $(".container-fluid").css({ width: "100vw" });
    $(".wrapper").css("padding-top", "118px");
    scheduleId = $("#scheduleId").val();
    fetchFormSupportedData();
});

function fetchFormSupportedData() {
    let apiPath = siteUrl + '/api/settings/schedule/createRelatedData';
    let queryData = { scheduleId };
    let apiProps = { url: apiPath, method: 'post', queryData };
    fetchDataApi(apiProps, function (data) {
        recievedData = data;
        extractData();
    });
}

function extractData() {
    if (!recievedData.schedule) {
        sFields.forEach(function (key) { schedule[key] = null; })
        schedule.id = null;
        schedule.assign_ids = [];
    }
    events = recievedData.events;
    volunteer_types = recievedData.volunteer_types;
    generateForm();
}

function generateForm() {
    let timeOpts = generateOpts("time");
    let eventOpts = generateOpts("id", events, "eventId", "eventName");
    let volunteeOpts = generateOpts('id', volunteer_types, "mldId", "mldValue");
    let locationOpts = generateOpts("id", locations, 'id', "name");
    let buildBlkOpts = generateOpts("id", buildBlks, 'id', "name");
    let checkerCountOpts = generateOpts("numbers");
    let dateTimeBlk = getDateTimeBlk(timeOpts);

    let valunteerBlk = getselectBlk("volunteer_select", "Type Of Volunteer", volunteeOpts);
    let buildingBlk = getselectBlk("building_select", "Building Block", buildBlkOpts);
    let locationBlk = getselectBlk("location_select", "Location", locationOpts);
    let eventBlk = getselectBlk("event_select", "Event", eventOpts);
    let checkerCountBlk = getselectBlk("checker_select", "Checker", checkerCountOpts);
    $("#scheduleForm").html([dateTimeBlk, eventBlk, locationBlk, buildingBlk, checkerCountBlk, valunteerBlk]);
}

function generateOpts(valType, arr = [], valName = null, propName = null) {
    let opts = [`<option class="text-secondary" value="">-- Select --</option>`]
    if (valType == "id") {
        arr.forEach(function (item) { opts.push(genOpt(item[valName], item[propName])); })
    } else if (valType == "time") {
        for (let i = 1; i <= 24; i++) {
            if (i >= 1 && i < 10) opts.push(genOpt('0' + i + ':00', '0' + i + ':00 AM'))
            else if (i >= 10 && i < 12) opts.push(genOpt(i + ':00', i + ':00 AM'))
            else if (i >= 12 && i < 24) opts.push(genOpt(i + ':00', i + ':00 PM'))
            else opts.push(genOpt(i + ':00', i + ':00 AM'))
        }
    } else {
        for (let i = 1; i < 10; i++) opts.push(genOpt(i, i));
    }
    return opts;
}

function getDateTimeBlk(timeOpts) {
    let rowBlk = generateBlk("row", "");
    let dateBlk = generateBlk("col-sm-6 card-body", "date_input");
    let timeBlk = generateBlk("col-sm-6", "time_select");
    let dateRowBlk = generateBlk("row", "");
    let dateLabelBlk = genLableBlk('col-sm-3 col-form-label', "Date");
    let dateInputBlk = genInputBlk('col-sm-9', "Scheduling Date", "date");
    dateRowBlk.html([dateLabelBlk, dateInputBlk]);
    let timeRowBlk = getselectBlk("time_select", "Time", timeOpts)
    dateBlk.html(dateRowBlk);
    timeBlk.html(timeRowBlk);
    return rowBlk.html([dateBlk, timeBlk]);
}
function genOpt(val, label) {
    return `<option class="capitalized" value="${val}">${label}</option>`
}

function generateBlk(classList, elId = null) {
    return $('<div/>', { class: classList, id: elId });
}

function genLableBlk(classList, label) {
    return `<label class="${classList}">${label}</label>`
}
function genInputBlk(classList, placeholder, type) {
    return `<div class="${classList}">
                <input class="form-control" placeholder="${placeholder}" type="${type}">
            </div>`
}
function genSelectInput(classList, options) {
    return `<select class="form-control ${classList}">${options.join("")}</select>`
}

function getselectBlk(blkId, elLabel, options) {
    let rowBlk = generateBlk("row card-body", blkId);
    let labelBlk = genLableBlk("col-sm-3", elLabel);
    let selectBlk = genSelectInput("col-sm-9", options);
    return rowBlk.html([labelBlk, selectBlk]);
}