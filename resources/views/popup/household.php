<div id="hhModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" data-backdrop="static">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header" id="hhModalTitle"></div>
      <div class="modal-body" id="hhModalBody">
        ...
      </div>
      <div class="modal-footer" id="hhModalFooter">
      </div>
    </div>
  </div>
</div>
<script>
    let houseHolds = [];
    let selectedUser = {};
    let searchedUserList = [];
    let urlPath = location.pathname.split('/');
    let personal_id = urlPath[urlPath.length-1];
    let user = <?php echo json_encode($user) ?>;

    getHouseHolds();

    function getHouseHolds(){
        let apiPath = '/api/people/member/households/'+ personal_id;
        let apiProps = {url: apiPath, method:'get', queryData:null}
        fetchDataApi(apiProps, function(data){
            updateHouseholdBlocks(data);
        })
    }

    function updateHouseholdBlocks(data){
       if(data.length){
            updateHouseholdBlock(data);
        }else {
            getEmptyHouseholdBlock();
        }
    }

    function getEmptyHouseholdBlock(){
        let card = `<div class="card">
            <div class="card-header" id="household-block-header">
               <h6> Household  <span class="float-right" onClick="openHouseholdModal()"><i class="fa fa-edit"></i></span></h6>
            </div>
            <div class="card-body text-center">
                <p><strong>${user.first_name} </strong> has not been added to a household yet.</p>
                <a onClick="openHouseholdModal()" class="btn btn-primary">Add one now</a>
            </div>
        </div>`;
        $("#household-blocks").append(card);
    }
    function updateHouseholdBlock(data){
        let cards = [];
        data.forEach(function(item, index){
            let userEls = [];
            item.users.forEach(function(userItem, index){
                if(userItem.isPrimary === 1){
                    console.log(`${userItem.personal_id} : primary`)
                }else {
                    console.log(`${userItem.personal_id} : Secondary`)
                }
                let primaryContent = userItem.isPrimary === 1? '<i class="fa fa-star></i>' : '';
                console.log(`Primary Content: ${primaryContent}`)
                userEl= `<p id="${'user-block'+userItem.id}"><i class="fa fa-user"></i> 
                    <a href="${personal_id === userItem.personal_id? '#' : '/people/member/'+ userItem.personal_id}" >
                        ${userItem.first_name} 
                        ${userItem.middle_name ?', ' +userItem.middle_name : ''}
                        ${userItem.last_name ?', ' +userItem.last_name : ''}
                    </a>
                    ${primaryContent} 
                </p>`;
                userEls.push(userEl)
            })
            let cardProps = {
                id: 'household-card'+index,
                class: "card"
            }
            let cardBodyProps = {
                class: "card-body"
            }
            let card= $("<div>", cardProps);
            let cardBody = $("<div>", cardBodyProps);
            let cardHead = `<div class="card-header" id="household-block-header">
                                <h6> ${item.name}  <span class="float-right" onClick="openHouseholdModalWithId(${item.id})"><i class="fa fa-edit"></i></span></h6>
                            </div>`;
            cardBody.append(userEls);
            card.append([cardHead, cardBody]);
            cards.push(card);
        });
        $("#household-blocks").append(cards);
    }

    function openHouseholdModal(){
        console.log("Ready to Open Modal without Id");
        updateModalContent();
        $("#hhModal").modal("show");
    }


    function openHouseholdModalWithId(household_id){
        console.log("Ready to Open Modal with Id");
        updateModalContent(household_id);
        $("#hhModal").modal("show");
    }

    function updateModalContent(hh_id = null){
        if(hh_id){

        }else{
            let modal_title = `<h5 class="modal-title"><span>${(user.first_name)? user.first_name: 'Your'}'s Households</span><h5>`
            $("#hhModalTitle").html(modal_title);
            let footer_content = `<button type="button" class="btn btn-secondary" onClick="closeEmptyModal()">Close</button>`
            $('#hhModalFooter').html(footer_content);
            let body_content = `<h5>No HouseHold</h5>
                                <p>${user.first_name? user.first_name: 'Your'}'s profile has not added to a household yet.</p>
                                <button type="button" class="btn btn-primary" onClick="readySearchHhForEmpty()">add a household</button>`
            $("#hhModalBody").addClass('text-center');
            $("#hhModalBody").html(body_content);
        }
    }

    function closeEmptyModal(){
        console.log("closing empty modal");
        $("#hhModal").modal("hide");
    }

    function readySearchHhForEmpty(){
        let modalTitle = `<h5 class="modal-title">${(user.first_name)? user.first_name: 'Your'}'s Households</h5>`;
        let footer_content = `<button type="button" class="btn btn-secondary" onClick="closeEmptyModal()">Close</button>`
        let contentValues = { class:"input-group"}
        let content = $('<div>', contentValues);
        let content_title = `<div class="input-group-prepend">
                                <p>Whose HouseHold would you like ${user.first_name} to Join?</p>
                            </div>`;
        let content_input = `<input type="text" class="input-lg" style="width:100%; padding:5px" id="searchStr" value="" onInput="getNonHhUsers()" placeholder="Search for someone...">`;
        let search_users = `<div id="search-users-list" class="list-group .vh-overflow-80 " style="width:100%"></div>`
        let create_new_user = `<div id='create-user' class="d-none">
                                <a href="/people/member/management" class="btn btn-primary d-none">Create New User <i class="fa fa-user"></i></a>
                            </div>`;
        let content_data = [content_title, content_input, search_users, create_new_user];
        content.append(content_data);

        $("#hhModalTitle").html(modalTitle);
        $("#hhModalBody").html([content]);
        $('#hhModalFooter').html(footer_content);
    }

    function getNonHhUsers(){
        let searchStr = $("#searchStr").val();
        searchedUserList = [];
        if(searchStr.length > 3){
            let apiPath = '/api/people/member/households/get-users-search';
            let apiProps = {url: apiPath, method:'post', queryData:{searchStr, id: user.id}}
            fetchDataApi(apiProps, function(data){
                searchedUserList = data;
                updateSearchUsrList(data);
            })
        }else {
            $("#search-users-list").html("<div></div>");
        }
    }

    function updateSearchUsrList(data){
        $("#hhModalBody").removeClass("text-center");
         let records = [];
        if(data.length > 0){
            data.forEach(function(item, index){
                let userName = extractFullName(item); 
                let block = `<div class="list-group-item list-group-item-action hover-focus"
                                 onClick="pickedUserFromSearchList(${index})">
                                <h6 class="no-margin">${userName}</h6>
                                <p class="text-muted no-padding no-margin">
                                    ${item.mobile_no? item.mobile_no: "No Mobile Number"}
                                </p>
                                <p class="text-muted no-padding no-margin">${item.email}</p>
                                <p class="text-muted no-padding no-margin">${item.address}</p>
                            </div>`;
                records.push(block);
            })
        }else {
            let noRecord = `<p>No records found</p>`;
            records.push(noRecord);
        }
        let createUserBtn = `<a href="/people/member/management" type="button" class="btn btn-secondary btn-lg btn-block">
                             <i class="fa fa-user"></i> Create A New Person</a>`
        records.push(createUserBtn);
        $("#search-users-list").html(records);
    }

    function pickedUserFromSearchList(index){
        selectedUser = searchedUserList[index];
        $("#hhModalBody").addClass("text-center");
        let sFullName = extractFullName(selectedUser);
        let uFullName = extractFullName(user);
        let modalTitle = `<h5 class="modal-title">Join a Household of ${sFullName}</h5> `;
        
        let isReadyToCreateHh = `<a href="#" onClick="crateHousehold()"><i class="fa fa-plus" aria-hidden="true"></i> Create a new houlsehold with ${sFullName} with ${uFullName} as members</a>`;
        let footer_content = `<button type="button" class="btn btn-secondary" onClick="closeEmptyModal()">Close</button>`
        
        $("#hhModalTitle").html(modalTitle);
        $("#hhModalBody").html(isReadyToCreateHh);
        $('#hhModalFooter').html(footer_content);
    }

    function crateHousehold(){
        console.log("Ready to create a household with selected User", selectedUser.first_name);
        $("#hhModalBody").html("<h5>Under progress...</h5>");
    }
    function fetchDataApi(props, callback){
        let payload = {};
        if(props.method == 'post'){
            payload = {
                method: props.method,
                body: props.method === 'post' ? JSON.stringify(props.queryData) : ''
            }
        }
        fetch(props.url, payload).then(
                function(response) {
                if (response.status !== 200) {
                    throw new Error("failure with error code"+response.status)
                }
                response.json().then(function(data) {
                    return callback(data);
                });
                }
            )
            .catch(function(err) {
                console.log('Fetch Error :-S', err);
            });
    }

    // Extracting User Name by marging all name fields
    function extractFullName(item){
        let fullName = '';
        fullName += item.first_name ? item.first_name : '';
        fullName += item.middle_name ? " " + item.middle_name : "";
        fullName += item.last_name ? " " + item.last_name : ''; 
        return fullName;
    }
</script>