<div id="hhModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" data-backdrop="static" aria-hidden="true">
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
function getHouseHolds(){
        fetch('/api/people/member/households/'+ personal_id)
            .then(
                function(response) {
                if (response.status !== 200) {
                    console.log('Looks like there was a problem. Status Code: ' +
                    response.status);
                    return;
                }

                // Examine the text in the response
                response.json().then(function(data) {
                    updateHouseholdBlocks(data);
                });
                }
            )
            .catch(function(err) {
                console.log('Fetch Error :-S', err);
            });
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
        let modalTitle = `<h5 class="modal-title">${(user.first_name)? user.first_name: 'Your'}'s Households</h5> `;
        $("#hhModalTitle").html(modalTitle);
        let footer_content = `<button type="button" class="btn btn-secondary" onClick="closeEmptyModal()">Close</button>`
        $('#hhModalFooter').html(footer_content);
        let contentValues = { class:"input-group"}
        let content = $('<div>', contentValues);
        let content_title = `<div class="input-group-prepend">
                                <p>Whose HouseHold would you like ${user.first_name} to Join?</p>
                            </div>`;
        let content_input = `<input type="text" class="input-lg" style="width:100%; padding:5px" placeholder="Search for someone...">`;
        let content_data = [];
        content_data.push(content_title);
        content_data.push(content_input);
        content.append(content_data);
        $("#hhModalBody").html([content]);
    }
</script>