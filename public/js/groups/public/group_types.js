let selectedGType = null;
let org = null;
let groupTypes = null;
let tagGroups = null;
document.addEventListener('DOMContentLoaded', function () {
    org = $("#orgObj").attr("data-org");
    org = JSON.parse(org);
    selectedGType = $("#group-type").attr("data-gType") ? $("#group-type").attr("data-gType") : "all";
    fetchGroupTypes();
});

function fetchGroupTypes() {
    let apiPath = siteUrl + '/api/hosting/groups/typesList';
    let queryData = { orgId: org.orgId, group_type: selectedGType };
    let apiProps = { url: apiPath, method: 'post', queryData };
    fetchDataApi(apiProps, function (data) {
        groupTypes = data.groupTypes;
        if (selectedGType === "all") {
            listGroupTypes();
        } else {
            tagGroups = data.tagGroups;
            listGroupsWithFilters();
        }
        updateSelectInput();
    });
}

function updateSelectInput() {
    let optEls = groupTypes.map(function (item) { return `<option value="${item.name}" ${selectedGType == item.name ? "selected" : ""}>${item.name}</option>`; });
    let selectEl = `<select name="${selectedGType}" onChange="gTypeChanged()" id="gTypeSelectEl" class="select custom-select"><option value="all" ${selectedGType == "all" ? "selected" : ""}>All Groups</option><hr/>${optEls}</select>`;
    $(".groupsUrlTabs").val(selectedGType);
    $('.groupsUrlTabs').html(selectEl);
}

function listGroupTypes() {
    let groupTypeEls = groupTypes.map(function(item){

                        })
}

function listGroupsWithFilters() {

}

function gTypeChanged() {
    selectedGType = $("#gTypeSelectEl").val();
    if (selectedGType !== "all") {
        location = `${siteUrl}/${org.orgDomain}/hosting/groups/${selectedGType.toLowerCase()}`;
    } else {
        location = `${siteUrl}/${org.orgDomain}/hosting/groups`
    }
}

function genSelectInput(classList, elId, options) {
    return `<select class="form-control ${classList}" id="${elId}">${options.join("")}</select>`
}