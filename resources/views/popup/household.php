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
    let selectedHh = [];
    let urlPath = location.pathname.split('/');
    let personal_id = urlPath[urlPath.length-1];
    let user = <?php echo json_encode($user) ?>;

    getHouseHolds();

    /**
    ** Initial Update Household block content in template
    */
    function getHouseHolds(){
        let apiPath = '/api/people/member/households/'+ personal_id;
        let apiProps = {url: apiPath, method:'get', queryData:null}
        fetchDataApi(apiProps, function(data){
            houseHolds = data;
            (houseHolds.length) ? updateHouseholdBlock() : getEmptyHouseholdBlock();
        })
    }

    /**
    ** Initial Update Household block content with No households in template
    */
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
        $("#household-blocks").html(card);
    }

    /**
    ** Initial Update Household block content with Households in template
    */
    function updateHouseholdBlock(){
        let cards = [];
        houseHolds.forEach(function(item, index){
            let userEls = [];
            let cardProps = { id: 'household-card'+index, class: "card" };
            let cardBodyProps = { class: "card-body" };
            let card= $("<div>", cardProps);
            let cardBody = $("<div>", cardBodyProps);
            let hhEditBtn = index === 0 ? `<span class="float-right" onClick="openHouseholdModal()"><i class="fa fa-edit"></i></span>` :'';
            let cardHead = `<div class="card-header" id="household-block-header">
                                <h6> ${item.name} ${hhEditBtn}</h6>
                            </div>`;

            item.users.forEach(function(userItem, index){
                let primaryContent = userItem.isPrimary === 1? '<i class="fa fa-star></i>' : '';
                userEl= `<p id="${'user-block'+userItem.id}"><i class="fa fa-user"></i> 
                    <a href="${personal_id === userItem.personal_id? '#' : '/people/member/'+ userItem.personal_id}" >
                        ${userItem.first_name} 
                        ${userItem.middle_name ? ' ' +userItem.middle_name : ''}
                        ${userItem.last_name ? ' ' +userItem.last_name : ''}
                    </a>
                    ${primaryContent} 
                </p>`;
                userEls.push(userEl)
            })
            
            cardBody.append(userEls);
            card.append([cardHead, cardBody]);
            cards.push(card);
        });
        $("#household-blocks").html(cards);
    }

    /**
    ** Opening Household Modal
    */
    function openHouseholdModal(){
        generateModalContent();
        $("#hhModal").modal("show");
    }

    /**
    ** Initial Houlsehold Content in Modal
    */
    function generateModalContent(){
        if(houseHolds.length === 1){
            selectedHh = houseHolds[0]
            updateModalWithSelectedHh();
        }else if(houseHolds.length > 1){
            updateModalWithHhList();
        }else{
            modalContentWithEmptyHh()
        }
    }

    /**
    ** update content with No Households in Modal
    */
    function modalContentWithEmptyHh(){
        let modal_title = `<h5 class="modal-title"><span>${(user.first_name)? user.first_name: 'Your'}'s Households</span><h5>`;
        let modal_body = `<h5>No HouseHold</h5>
                            <p>${user.first_name? user.first_name: 'Your'}'s profile has not added to a household yet.</p>
                            <button type="button" class="btn btn-primary" onClick="newHhSearchUser()">add a household</button>`
        let modal_footer = `<button type="button" class="btn btn-secondary" onClick="closeModal()">Close</button>`;
        
        updateModalContent(modal_title, modal_body, modal_footer, true);
    }

    /**
    ** Updating Selected Household content in Modal 
    */
    function updateModalWithSelectedHh(){
        let modal_title = `<h5 class="modal-title">${selectedHh.name}</h5>
                            <button type="button" class="btn btn-primary pull-right" style="font-size:.5em">
                                Other Households
                            </button>`;
        let modal_body = generateSelectedHhContent();
        let modal_footer = `<button type="button" class="btn btn-outline-danger">Remove Household</button>
                            <button type="button" class="btn btn-light" onClick="closeModal()">Close</button>
                            <button type="button" class="btn btn-success">Save</button>`

        updateModalContent(modal_title, modal_body, modal_footer, false);
    }

    /**
    ** Search Users to create new Household 
    */
    function newHhSearchUser(){
        selectedHh = [];
        let modal_title = `<h5 class="modal-title">${(user.first_name)? user.first_name: 'Your'}'s Households</h5>`;
        let modal_body = $('<div>', { class:"input-group"});
        let content_title = `<div class="input-group-prepend">
                                <p>Whose HouseHold would you like ${user.first_name} to Join?</p>
                            </div>`;
        let searchBlockEls = getSearchBlock();
        let content_block = [content_title];
        let content_data = content_block.concat(searchBlockEls);
        modal_body.append(content_data);
        let modal_footer = `<button type="button" class="btn btn-secondary" onClick="closeModal()">Close</button>`

        updateModalContent(modal_title, modal_body, modal_footer, false);
    }

    function updateModalWithHhList(){
        let modal_title = `<h5 class="modal-title">Households</h5>`;
        let modal_body = '<h3>Under Progress..</h3>';
        let modal_footer = `<button type="button" class="btn btn-secondary" onClick="closeModal()">Close</button>`
        
        updateModalContent(modal_title, modal_body, modal_footer, false);
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
        let queryData = filterNewHhDetails();
        let apiPath = '/api/people/member/households/create-new';
        let apiProps = {url: apiPath, method:'post', queryData}
        fetchDataApi(apiProps, function(data){
            houseHolds.push(data);
            selectedHh = data;
            updateModalWithSelectedHh();
        })
        $("#hhModalBody").html("<h5>Under progress...</h5>");
    }

    // Listing Househols with relative users in Modal
    function updateModalHhList(){
        console.log(JSON.stringify(houseHolds))
    }

    function hideHhUserSettingBlock(appendIds){
        let settingId = "#hhUserSetting"+appendIds;
        let settingBlockId = "#hhUserSettingBlock"+appendIds;
        $(settingId).removeClass('d-none');
        $(settingBlockId).addClass('d-none');
    }
    
    function showHhUserSettingBlock(appendIds){
        let settingId = "#hhUserSetting"+appendIds;
        let settingBlockId = "#hhUserSettingBlock"+appendIds;
        $(settingId).addClass('d-none');
        $(settingBlockId).removeClass('d-none');
    }

    function changePrimary(userId){
        selectedHh.users = selectedHh.users.map(function(item){
            item.isPrimary = (userId === item.id) ? 1 : 2;
            return item;
        });
        updateModalWithSelectedHh();
    }

    function removeHhUser(user, userIndex){
        let userName = extractFullName(user);
        let confirmed = confirm("Are You sure you'd like to remove " + userName);
        if(confirmed){
            selectedHh.users.splice(userIndex, 1);
            updateModalWithSelectedHh();
        }
    }

    // Extracting User Name by marging all name fields
    function extractFullName(item){
        let fullName = '';
        fullName += item.first_name ? item.first_name : '';
        fullName += item.middle_name ? " " + item.middle_name : "";
        fullName += item.last_name ? " " + item.last_name : ''; 
        return fullName;
    }

    // Filter Data to createa New Household with selected User as member
    function filterNewHhDetails(){
        let newHhName = "";
        if(user.middle_name){
            newHhName = user.first_name + ' Household';
        }else if(user.first_name){
            newHhName = user.first_name + ' Household';
        }else if(user.last_name){
            newHhName = user.last_name + ' Household';
        }else {
            newHhName = "Yours Household";
        }
        let queryData = {hhName:newHhName, primary_user: user.id, user: selectedUser.id};
        return queryData;
    }

    //Create New User Button
    function getCreateUserBtn(){
        let btn = `<div id='create-user' class="d-none">
                        <a href="/people/member/management" class="btn btn-primary d-none">Create New User <i class="fa fa-user"></i></a>
                    </div>`;
        return btn;
    }

    // Search Result Users list block
    function getSearchUserListEl(){
        let el = `<div id="search-users-list" class="list-group .vh-overflow-80 " style="width:100%"></div>`;
        return el;
    }

    // Search input element
    function getSearchInputEl(){
        let inputEl = `<input type="text" class="input-lg" style="width:100%; padding:5px" id="searchStr" value="" onInput="getSearchResults()" placeholder="Search for someone...">`;
        return inputEl;
    }

    // Getting full search block
    function getSearchBlock(){
        let content_input = getSearchInputEl();
        let search_users = getSearchUserListEl();
        let create_new_user_btn = getCreateUserBtn();
        let block = [content_input, search_users, create_new_user_btn]
        return block;
    }

    /**
    ** Updating content in modal
    */
    function updateModalContent(header, body, footer, isContentCenter=false){
        if(isContentCenter){
            $("#hhModalBody").addClass('text-center');
        }else {
            $("#hhModalBody").removeClass('text-center');
        }
        $("#hhModalTitle").html(header);
        $("#hhModalBody").html(body);
        $('#hhModalFooter').html(footer);
    }

    /**
    ** Closing Modal and Updating Household block content in template
    */
    function closeModal(){
        $("#hhModal").modal("hide");
        (houseHolds.length) ? updateHouseholdBlock() : getEmptyHouseholdBlock();
    }

    /**
    **
    */
    function generateSelectedHhContent(){
        let editHhName = `<div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text">Household :</span>
                            </div>
                            <input class="form-control" value="${selectedHh.name}" />
                        </div>`;
        
        let body_content = [editHhName];
        selectedHh.users.forEach(function(item, index){
            let userName = extractFullName(item); 
            let primaryBadge = item.isPrimary === 1 ? `<button class="btn btn-primary btn-sm pull-right" style="font-size:.5em">PRIMARY</button>`: '';
            let primaryBtn = item.isPrimary !== 1 ? `<button type="button" class="btn btn-sm btn-outline-success" onClick="changePrimary(${item.id})">Make Primary</button>`: '';
            let block = `<div class="list-group-item">
                            <h6 class="no-margin">${userName} ${primaryBadge}</h6>
                            <p class="text-muted no-padding no-margin">${item.email}
                            <span id=${'hhUserSetting'+selectedHh.id+'-'+item.id} class="pull-right" onClick="showHhUserSettingBlock(${selectedHh.id+'-'+item.id})"><i class="fa fa-cog"></i></span>
                            </p>
                            <div id=${'hhUserSettingBlock'+selectedHh.id+'-'+item.id} class="bg-secondary d-none">
                                <button type="button" class="btn btn-sm btn-outline-danger" onClick="removeHhUser(${item},${index})">Remove</button>
                                ${primaryBtn}
                                <button type="button" class="btn btn-sm btn-outline-secondary rounded pull-right" onClick="hideHhUserSettingBlock(${selectedHh.id+'-'+item.id})"><i class="fa fa-cog"></i>close</button>  
                            </div>
                        </div>`;
            body_content.push(block);
        });
        return body_content;
    }

    /** 
    ** ------------------ API RELATIVE FUNCTIONS AND API CALL -----------------
    **/ 
    
    // Get Search Users list from API
    function getSearchResults(){
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

    // Calling Restfull Api's
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
</script>