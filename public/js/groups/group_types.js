let queries = null;
$(document).ready(function () {
    $(".container-fluid").addClass("m-0 p-0");
    $(".container-fluid").css({width: "100vw"});
    let url = location.search;
    queries = getQueries();
    if(queries.groupType){
        queries.groupType = 2;
        updateQueryString(queries);
    }else{
        queries.groupType = 2;
        updateQueryString(queries);
        console.log("group query not defined");
    }

});
setInterval(function(){
    queries.groupType = parseInt(queries.groupType) + 2;
        updateQueryString(queries);
}, 3000)

function fetchGroupTypes() {
    let apiPath = siteUrl + '/api/settings/forms/content/' + formId;
    let queryData = {};
    let apiProps = { url: apiPath, method: 'get', queryData };
    fetchDataApi(apiProps, function (data) {
        formData = data
        updateReviewBlock();
    });
}