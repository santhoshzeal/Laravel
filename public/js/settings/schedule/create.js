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

    let valunteerBlk = getselectBlk("volunteer_select", "Type Of Volunteer", volunteeOpts);
    let buildingBlk = getselectBlk("building_select", "Building Block", buildBlkOpts);
    let locationBlk = getselectBlk("location_select", "Location", locationOpts);
    let eventBlk = getselectBlk("event_select", "Event", eventOpts);
    let checkerCountBlk = getselectBlk("checker_select", "Checker", checkerCountOpts);
    $("#scheduleForm").html([eventBlk, locationBlk, buildingBlk, checkerCountBlk, valunteerBlk])
    // ['title', 'date', 'time', 'event_id', 'location_id',
    //     'building_block', 'type_of_volunteer', 'checker_count',
    //     'is_auto_schedule', 'is_manual_schedule', 'notification_flag'];
    // let elBlk = sFields.map(function (field) {
    //     switch (field) {
    //         case "title":

    //         case "date":
    //         case "time":

    //         case "event_id":

    //         case "location_id":

    //         case "building_block":

    //         case "type_of_volunteer":

    //         case "Radio Button":
    //             let labelEl1 = generateInputField({ name: 'label_' + randNum, value: item.label, placeholder: "Lable", type: "text" }, item.title, false, "form_input_label", true, []);
    //             // let nameEl1 = generateInputField({ name: 'name_' + randNum, value: item.name, placeholder: "Element Name", type: "text" }, '', false, "form_input_name", true, []);
    //             let optEl1 = generateOptionValuePairs(randNum, item);
    //             return `${labelEl1} ${optEl1}`;
    //             break;
    //     }
    // })
}

function generateOpts(valType, arr = [], valName = null, propName = null) {
    let opts = [`<option value="">-- Select --</option>`]
    if (valType == "id") {
        arr.forEach(function (item) {
            opts.push(genOpt(item[valName], item[propName]))
        })
    } else if (valType == "time") {
        for (let i = 1; i < 24; i++) {
            if (i >= 12 && i < 24) opts.push(genOpt('0' + i + ':00', '0' + i + ':00 AM'))
            else if (i >= 12 && i < 24) opts.push(genOpt(i + ':00', i + ':00 AM'))
            else if (i >= 12 && i < 24) opts.push(genOpt(i + ':00', i + ':00 PM'))
            else opts.push(genOpt(i + ':00', i + ':00 AM'))
        }
    } else {
        for (let i = 1; i < 10; i++) opts.push(genOpt(i, i));
    }
    return opts;
}
function getTitleBlk() {
    let rowBlk = generateBlk("row", "name_input");
    let labelBlk = genLableBlk('col-sm-3 col-form-label', "Scheduling Title");
    let inputBlk = genInputBlk('col-sm-9', "Enter Scheduling Title", "text");
    return rowBlk.html([labelBlk, inputBlk]);
}

function getDateTimeBlk() {
    let rowBlk = generateBlk("row", "");
    let dateBlk = generateBlk("col-sm-6", "date_input");
    let timeBlk = generateBlk("col-sm-6", "time_select");
    let dateRowBlk = generateBlk("row", "");
    let timeRowBlk = generateBlk("row", "");
    let dateLabelBlk = genLableBlk('col-sm-6 col-form-label', "Date");
    let dateInputBlk = genInputBlk('col-sm-6', "Scheduling Date", "date");

    let timeLabelBlk = genLableBlk('col-sm-6 col-form-label', "Time");
    let timeSelectBlk = genSelectBlk('col-sm-6', timeOpts);
    dateRowBlk.html([dateLabelBlk, dateInputBlk]);
    timeRowBlk.html([timeLabelBlk, timeSelectBlk]);
    dateBlk.html(dateRowBlk);
    timeBlk.html(timeRowBlk);
    return rowBlk([dateBlk, timeBlk]);
}
// function getEventBlk(){
//     let rowBlk = generateBlk("row", "event_select");
//     let labelBlk = genLableBlk("col-sm-6", "Event");
//     let selectBlk = genSelectBlk("col-sm-6", eventOpts);
//     return rowBlk.html([labelBlk, selectBlk]);
// }

// function getLocationBlk(){
//     let rowBlk = generateBlk("row", "location_select");
//     let labelBlk = genLableBlk("col-sm-6", "Location");
//     let selectBlk = genSelectBlk("col-sm-6", locationOpts);
//     return rowBlk.html([labelBlk, selectBlk]);
// }

// function getBuildingBlk(){
//     let rowBlk = generateBlk("row", "building_select");
//     let labelBlk = genLableBlk("col-sm-6", "Building Block");
//     let selectBlk = genSelectBlk("col-sm-6", buildBlkOpts);
//     return rowBlk.html([labelBlk, selectBlk]);
// }

// function getVolunteerBlk(){
//     let rowBlk = generateBlk("row", "volunteer_select");
//     let labelBlk = genLableBlk("col-sm-6", "Type Of Volunteer");
//     let selectBlk = genSelectBlk("col-sm-6", volunteeOpts);
//     return rowBlk.html([labelBlk, selectBlk]);
// }
function genOpt(val, label) {
    return `<option class="capitalized" value="${val}">${label}</option>`
}
function genBlks() { }

function generateBlk(classList, elId = null) {
    return $('<div/>', { class: classList, id: elId });
}

function genLableBlk(classList, label) {
    return `<label class="${classList}">${label}</label>`
}
function genInputBlk(classList, placeholder, type) {
    return `<div class="${classList}">
                <input class="form_control" placeholder="${placeholder}" type="${type}">
                <br/><span></span>
            </div>`
}
function genSelectInput(classList, options) {
    return `<select class="form-control ${classList}">${options}</select>`
}

function getselectBlk(blkId, elLabel, options) {
    let rowBlk = generateBlk("row", blkId);
    let labelBlk = genLableBlk("col-sm-6", elLabel);
    let selectBlk = genSelectInput("col-sm-6", options);
    return rowBlk.html([labelBlk, selectBlk]);
}