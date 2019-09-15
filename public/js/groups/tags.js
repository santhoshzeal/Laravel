$(function () {
    $(".container-fluid").addClass("m-0 p-0");
    $(".container-fluid").css({ width: "100vw" });
    $(".wrapper").css("padding-top", "118px");
    $(".groupSortable").sortable({
        handle: ".handle",
        cursor: "move",
        connectWith: '.groupSortable'
    });
    $(".groupSortable").disableSelection();
    updateTabs();
});

let tagGroups = [
    {
        id: 1, name: "Testing1", isPublic: false, order: 4, isMultiple_select: false,
        tags: [{ id: 11, name: "child1", order: 4 }, { id: 12, name: "child2", order: 3 }, { id: 13, name: "child3", order: 2 }, { id: 14, name: "child4", order: 1 }]
    },
    {
        id: 2, name: "Testing2", isPublic: false, order: 2, isMultiple_select: false,
        tags: [{ id: 21, name: "child1", order: 4 }, { id: 22, name: "child2", order: 3 }, { id: 23, name: "child3", order: 2 }, { id: 24, name: "child4", order: 1 }]
    },
    {
        id: 3, name: "Testing3", isPublic: false, order: 8, isMultiple_select: false,
        tags: [{ id: 31, name: "child1", order: 4 }, { id: 32, name: "child2", order: 3 }, { id: 33, name: "child3", order: 2 }, { id: 34, name: "child4", order: 1 }]
    },
    {
        id: 4, name: "Testing4", isPublic: false, order: 9, isMultiple_select: false,
        tags: [{ id: 41, name: "child1", order: 4 }, { id: 42, name: "child2", order: 3 }, { id: 43, name: "child3", order: 2 }, { id: 44, name: "child4", order: 1 }]
    },
    {
        id: 5, name: "Testing1", isPublic: false, order: 4, isMultiple_select: false,
        tags: [{ id: 11, name: "child1", order: 4 }, { id: 12, name: "child2", order: 3 }, { id: 13, name: "child3", order: 2 }, { id: 14, name: "child4", order: 1 }]
    },
    {
        id: 6, name: "Testing2", isPublic: false, order: 2, isMultiple_select: false,
        tags: [{ id: 21, name: "child1", order: 4 }, { id: 22, name: "child2", order: 3 }, { id: 23, name: "child3", order: 2 }, { id: 24, name: "child4", order: 1 }]
    },
    {
        id: 7, name: "Testing3", isPublic: false, order: 8, isMultiple_select: false,
        tags: [{ id: 31, name: "child1", order: 4 }, { id: 32, name: "child2", order: 3 }, { id: 33, name: "child3", order: 2 }, { id: 34, name: "child4", order: 1 }]
    }
]

function updateTabs() {
    tagGroups.sort(function (a, b) {
        return a.order - b.order;
    });
    tagGroups = tagGroups.map(function (item) {
        item.tags.sort(function (a, b) {
            return a.order - b.order
        });
        return item;
    })

    let tagGroupEls = tagGroups.map(function (gItem, index) {
        let randNum = generateRandNum();
        let tabEls = gItem.tags.map(function (item, index) {
            return `<div class="row tag_items items_row_${randNum}" data-randNum="${randNum}">
                                                    <div class="col-sm-12">
                                                        <i class="fa fa-bars child_handle"></i>
                                                         ${item.name} 
                                                         <i class="fa fa-edit btn btn-sm pull-right"></i>
                                                    </div>  
                                                </div>`
        });
        return `<div class="col-sm-12 col-md-3 mb-3 group_${randNum}" 
                    data-groupId="${gItem.id}" data-name="${gItem.name}" data-isPublic="${gItem.isPublic}"
                    data-isMultiple_select="${gItem.isMultiple_select}">
                    <div class="row m-2">
                        <div class="col-sm-12 card p-0">
                            <div class="card-title p-2 text-white bg-secondary">
                                    <h5><i class="fa fa-bars handle"></i>  ${gItem.name}
                                    <i class="fa fa-edit pull-right"></i></h5>
                            </div>
                            <div class="card-body ml-4 mr-4 mt-0 mb-0 pt-1 pb-0 itemsSortable" style="height:200px; overflow:auto;border:1px solid #f3eeee;">
                                ${tabEls.join("")}
                                <small class="error_msg_${randNum} text-danger"></small>
                            </div>
                            <div class="card-body m-0 pb-2">
                                <div class="input-group">
                                    <input type="text" class="form-control new_tag_${randNum}" placeholder="add tag " data-randNum="${randNum}">
                                    <div class="input-group-append">
                                        <span class="input-group-text bg-success text-white" onClick="addNewTag(${randNum})" style="cursor:pointer">+</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>`
    })

    $(".groupSortable").html(tagGroupEls);
    $(".itemsSortable").sortable({
        handle: ".child_handle",
        cursor: "move"
    });
    $(".tag_list_items").disableSelection();
}

function addNewTag(randomNum) {
    let newTag = $(".new_tag_" + randomNum).val();
    if (newTag) {
        let groupId = $(".group_" + randomNum).attr('data-groupId');
        let tagPresent = null;
        let sGroup = tagGroups.find(function (item) { return item.id == groupId; });
        if (sGroup) {
            tagPresent = sGroup.tags.find(function (item) {
                return item.name == newTag;
            })
        }
        if (tagPresent) {
            showTagErr(randomNum, "Tag Already Present")
        }
    } else {
        showTagErr(randomNum, "Enter tag Name");
    }
}

function groupWrapper(randNum) {

}

function generateRandNum() {
    return Math.floor(Math.random() * (100000 - 1 + 1) + 57);
}

function showTagErr(randomNum, msg) {
    $(".error_msg_" + randomNum).text(msg);
    setTimeout(function () {
        $(".error_msg_" + randomNum).text(null);
    }, 1500);
}