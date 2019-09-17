function getConfirmation(title, body_content, cb){
    let cModal = `<div id="confirmationModal" class="modal fade bd-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" data-backdrop="static">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header" id="cModalTitle">dfdfdsa fds</div>
            <div class="modal-body" id="cModalBody">
            </div>
            <div class="modal-footer" id="cModalFooter">
                <button class="btn btn-danger cReject">Cancel</button>
                <button class="btn btn-success cAccept">Accept</button>
            </div>
            </div>
        </div>
    </div>`;
    $(document.body).append(cModal);
    console.log(title);
    $("#cModalTitle").html(`<h6>${title}</h6>`);
    $("#cModalBody").html(body_content);

    $("#confirmationModal").modal("show");

    $(document).on("click", ".cReject", function(){
        $("#confirmationModal").modal("hide");
        // $("#confirmationModal").remove();
        cb(false);
    });

    $(document).on("click", ".cAccept", function(){
        $("#confirmationModal").modal("hide");
        // $("#confirmationModal").remove();
        cb(true);
    });
}