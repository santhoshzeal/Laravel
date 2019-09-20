let scheduleId = recievedData = null;
let events = volunteer_types = [];
let sFields = ['title', 'date', 'time', 'event_id', 'location_id', 'building_block', 'type_of_volunteer', 'checker_count', 'is_auto_schedule', 'is_manual_schedule', 'notification_flag'];
let buildBlks = [{ id: 1, name: "daily" }, { id: 2, name: "weekly" }, { id: 999, name: "none" }];
let locations = [{ id: 1, name: "location1" }, { id: 2, name: "location2" }, { id: 3, name: "location3" }];
let schedule = {};

$(document).ready(function () {
    $(".container-fluid").addClass("m-0 p-0").css({ width: "100vw"});
    $(".wrapper").css("padding-top", "118px");
    scheduleId = $("#scheduleId").val();
    fetchFormSupportedData();
});

function fetchFormSupportedData() {
    let apiPath = siteUrl + '/api/settings/schedule/createRelatedData';
    let apiProps = { url: apiPath, method: 'post', queryData: { scheduleId } };
    fetchDataApi(apiProps, function (data) {
        recievedData = data;
        extractData();
    });
}

function extractData() {
    if (!recievedData.schedule) {
        sFields.forEach(function (key) { schedule[key] = null; });
        schedule.id = null;
        schedule.assign_ids = [];
    }else{
        schedule = recievedData.schedule;
    }
    events = recievedData.events;
    volunteer_types = recievedData.volunteer_types;
    generateForm();
}

function generateForm() {
    let valunteerBlk = getSelectBlk("volunteer_select", "Type Of Volunteer", generateOpts('id', volunteer_types, "mldId", "mldValue"));
    let buildingBlk = getSelectBlk("building_select", "Building Block", generateOpts("id", buildBlks, 'id', "name"));
    let locationBlk = getSelectBlk("location_select", "Location", generateOpts("id", locations, 'id', "name"));
    let eventBlk = getSelectBlk("event_select", "Event", generateOpts("id", events, "eventId", "eventName"));
    let checkerCountBlk = getCheckerBlk();
    $("#scheduleForm").html([generateTitleBlk(), getDateTimeBlk(generateOpts("time")), eventBlk, locationBlk, buildingBlk, valunteerBlk, checkerCountBlk, getNotificationBlk() ]);
    $("#checker_select").removeClass("card-body");
    updateFormData();
}

function generateOpts(valType, arr = [], valName = null, propName = null) {
    let opts = [`<option class="text-secondary" value="">-- Select --</option>`]
    if (valType == "id") {
        arr.forEach(function (item) { opts.push(genOpt(item[valName], item[propName])); })
    } else if (valType == "time") {
        let timeValues = getTimeValues();
        timeValues.forEach(function(item){
            opts.push(genOpt(item.value, item.label))
        }) 
    } else {
        for (let i = 1; i < 10; i++) opts.push(genOpt(i, i));
    }
    return opts;
}

function getDateTimeBlk(timeOpts) {
    let rowBlk = generateBlk("row card-body pb-0", "");
    let dateBlk = generateBlk("col-sm-6 card-body", "date_input");
    let timeBlk = generateBlk("col-sm-6 ", "time_select");
    let dateRowBlk = generateBlk("row", "");
    let dateLabelBlk = genLableBlk('col-sm-3 col-form-label', "Date");
    let dateInputBlk = genInputBlk('col-sm-9', "Scheduling Date", "date");
    dateRowBlk.html([dateLabelBlk, dateInputBlk]);
    let timeRowBlk = getSelectBlk("time_select", "Time", timeOpts)
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
function genInputBlk(classList, elId, placeholder, type) {
    return `<div class="${classList}"><input class="form-control" id="${elId}" placeholder="${placeholder}" type="${type}"></div>`
}
function genCheckboxInput(){
    return '<input type="checkbox" class="form-control-chk form-check-input form_input_req">'
}
function genRadioInput(name, value){
    return `<input type="radio" name="${name}" value="${value}" class="form-control-chk form-check-input form_input_req">`
}
function genSelectInput(classList, options) {
    return `<select class="form-control ${classList}">${options.join("")}</select>`
}
function generateTitleBlk(){
    return generateBlk("row card-body pb-0").html([genLableBlk("col-sm-3", "Schedule Title"), genInputBlk("col-sm-9", "title_input", "Schdule Name", "text")])
}
function getSelectBlk(blkId, elLabel, options) {
    return generateBlk("row card-body", blkId).html([genLableBlk("col-sm-3 pt-2", elLabel), genSelectInput("col-sm-9", options)]);
}
function getCheckerBlk(){
    let checkerSelect = generateBlk("col-sm-6").html(getSelectBlk("checker_select", "Checker", generateOpts("numbers")));
    let asBlkEls = generateBlk("form-check auto_assign").html([genCheckboxInput(),genLableBlk("form-check-label", "Auto Scheduling")]);
    let msBlkEls = generateBlk("form-check manual_assign").html([genCheckboxInput(),genLableBlk("form-check-label", "Manual Scheduling")]);
    let asBlk = generateBlk("col-sm-3 pt-2").html(asBlkEls);
    let msBlk = generateBlk("col-sm-3 pt-2").html(msBlkEls);

    return generateBlk("row pb-3").html([checkerSelect, asBlk, msBlk]);
}

function getCheckerBlk(){
    let checkerSelect = generateBlk("col-sm-6").html(getSelectBlk("checker_select", "Checker", generateOpts("numbers")));
    let asBlkEls = generateBlk("form-check auto_assign").html([genCheckboxInput(), genLableBlk("form-check-label", "Auto Scheduling")]);
    let msBlkEls = generateBlk("form-check manual_assign").html([genCheckboxInput(), genLableBlk("form-check-label", "Manual Scheduling")]);
    let asBlk = generateBlk("col-sm-3 pt-2").html(asBlkEls);
    let msBlk = generateBlk("col-sm-3 pt-2").html(msBlkEls);
    let assignBlk = `<div class="col-12 card p-2 members_list">
                        <div class="card-body border border-3 border-light" >
                            <table class="table table-sm">
                                <tr>
                                    <th scope="col">Sl.no</th>
                                    <th scope="col">Name</th>
                                    <th scope="col">Image</th>
                                    <th scope="col">Email</th>
                                    <th scope="col"></th>
                                </tr>
                            </table>
                        </div>
                    </div>`
    return generateBlk("row").html([checkerSelect, asBlk, msBlk, assignBlk]);
}
function getNotificationBlk(){
    let notifyVals = [{value:2, label:"SMS"}, {value:3, label:"Mail"}, {value:4, label:"Both"}];
    let notifyRadioEls = notifyVals.map(function(item){
                        return `<div class="col-sm-3">${genRadioInput("notify_type", item.value)} ${genLableBlk("form-check-label", item.label)}</div>`;
                    });
    let notifyBlkLabel = genLableBlk("col-sm-3", "Notification");
    return generateBlk("row p-4").html([notifyBlkLabel, notifyRadioEls.join("")])
}

function updateFormData(){
    $("#title_input").val("testing");
}