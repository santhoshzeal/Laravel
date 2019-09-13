function getQueries() {
    let queries = decodeURI(window.location.search)
                            .replace('?', '')
                            .split('&')
                            .map(param => param.split('='))
                            .reduce((values, [ key, value ]) => {
                                values[ key ] = value
                                return values
                            }, {});
    return queries;
}

function updateQueryString(queryObj){
    let queryString = "?";
    Object.keys(queryObj).forEach(function(key){
        queryString += key + "=" + queryObj[key] +"&";
    });
    console.log("last char of query String", queryString[queryString.length -1]);
    if(queryString[queryString.length -1] === "&"){
        queryString = queryString.slice(0, -1);
    }
    let newUri = location.href.split("?")[0] + queryString;
    window.history.pushState({path:newUri},'',newUri);
}