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
        id: 6, name: "Testing99", isPublic: true, order: 0, isMultiple_select: false,
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
            return generateChildNode(randNum, item);
        });
        return generateParentNode(randNum, gItem, tabEls);
    })

    $(".groupSortable").html(tagGroupEls);
    $(".itemsSortable").sortable({
        handle: ".child_handle",
        cursor: "move"
    });
    $(".tag_list_items").disableSelection();
    $(".edit_child_node").hide();
    $(".edit_group_node").hide();
}

function generateChildNode(randNum, item){
    return `<div class="row tag_items child_node" data-randNum="${randNum}" data-id="${item.id}", data-name="${item.name}">
                <div class="col-sm-12 sort_child_node">
                    <i class="fa fa-bars child_handle"></i>
                    <span class="child_value">${item.name}</span>
                    <i class="fa fa-edit btn btn-sm pull-right child_edit_btn"></i>
                </div>
                <div class="col-sm-12 edit_child_node ">
                    <div class="input-group input-group-sm mb-2">
                        <input class="child_node_input form-control" value="${item.name}">
                        <div class="input-group-append">
                        <i class="btn btn-danger fa fa-times child_node_delete"></i>
                        <button class="btn btn-sm btn-success pull-right child_node_sucess"><i class="fa fa-check"></i></button>
                        </div>
                    </div>
                </div>  
            </div>`
}

function generateParentNode(randNum, gItem, tabEls){
    let wrapper = generateGroupWrapper(gItem.name, gItem.isPublic, gItem.isMultiple_select)
    return `<div class="col-sm-12 col-md-3 mb-3 parent_node group_${randNum}" 
                data-groupId="${gItem.id}" data-name="${gItem.name}" data-isPublic="${gItem.isPublic}"
                data-isMultiple_select="${gItem.isMultiple_select}">
                <div class="row m-2 sort_group_node">
                    <div class="col-sm-12 card p-0">
                        <div class="card-title pl-2 pr-2 text-white bg-secondary">
                                <h6><i class="fa fa-bars handle"></i>  ${gItem.name}
                                <i class="fa fa-edit btn btn-sm pull-right edit_group_btn"></i></h6>
                        </div>
                        <div class="card-body ml-4 mr-4 mt-0 mb-0 pt-1 pb-0 child_nodes_group itemsSortable" style="height:200px; overflow:auto;border:1px solid #f3eeee;">
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
                ${wrapper}
            </div>`
}

function generateGroupWrapper(name = null, isPublic = true, isMultiple_select = true){
    return `<div class="row m-2 edit_group_node card">
                <div class="col-sm-12 card p-0">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Name</label>
                            <input type="text" class="form-control group-name" value="${name}" placeholder="Example: Stage of Life">
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input type="checkbox" ${isPublic ? 'checked' : ''}  class="form-control-chk form-check-input form_input_req">
                                <label class="form-check-label"> Display tag publicly</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Can one group belong to many Neighborhoods?</label>
                            <select  class="form-control" >
                                <option value="true" ${isMultiple_select? "selected": ''}>Yes</option>
                                <option value="false" ${!isMultiple_select? "selected": ''}>No</option>
                            </select>
                        </div>
                    </div>
                    <div class="card-body" style="bottom:0;">
                        <h6 >
                            <button class="btn btn-danger btn-sm">Delete</button>
                            <button class="btn btn-success btn-sm pull-right">Save</button>
                            <button class="btn btn-light btn-sm pull-right">Cancel</button>
                        </h6>
                    </div>
                </div>
            </div>`
}

function generateRandNum() {
    return Math.floor(Math.random() * (100000 - 1 + 1) + 57);
}

function showTagErr(randomNum, msg) {
    $(".error_msg_" + randomNum).text(msg);
    setTimeout(function () {
        $(".error_msg_" + randomNum).text(null);
    }, 2500);
}

$(document).on('click', '.child_edit_btn', function(){
    $(this).parent().siblings(".edit_child_node").show(500);
    $(this).closest(".sort_child_node").hide();
})

$(document).on('click', ".edit_group_btn", function(){
    let blkHeight = $(this).closest(".sort_group_node").height();
    $(this).closest(".sort_group_node").siblings(".edit_group_node").css("height",blkHeight+"px");
    $(this).closest(".sort_group_node").siblings(".edit_group_node").show(500);
    $(this).closest(".sort_group_node").hide();
})

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