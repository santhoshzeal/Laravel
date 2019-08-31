let personalFieldsList = [{ title: "Phone", type: 1, tag: "mobile_no", icon: "fa fa-phone", required: false }, { title: "Address", type: 1, tag: "address", icon: "fa fa-address-card", required: false }, { title: "Birthday", type: 1, tag: "dob", icon: "fa fa-birthday-cake", required: false }, { title: "Medical Note", type: 1, tag: "medical_note", icon: "fa fa-heartbeat", required: false }, { title: "Marital Status", type: 1, tag: "marital_status", icon: "fa fa-users", required: false }, { title: "Social Profile", type: 1, tag: "life_stage", icon: "fa fa-user", required: false }, { title: "Gender", tag: "gender_id", type: 1, icon: "fa fa-mars-double", required: false }];
let basicFieldsList = [{ fieldTitle: "Text", inputType: "text", type: 2, label: "", placeholder: "", name: '', required: false }, { fieldTitle: "Paragraph", inputType: "textarea", type: 2, label: "", placeholder: "", name: '', required: false }, { fieldTitle: "Select", inputType: "select", type: 2, label: "", name: "", options: [{ option: '', value: '' }], required: false }, { fieldTitle: "Date", inputType: "date", type: 2, label: "", name: "", options: [{ option: '', value: '' }], required: false }, { fieldTitle: "Checkbox", inputType: "checkbox", type: 2, label: "", name: "", options: [{ option: '', value: '' }], required: false }, { fieldTitle: "Radio Button", inputType: "radioBtn", type: 2, label: "", name: "", options: [{ option: '', value: '' }], required: false }, { fieldTitle: "Number", inputType: "number", type: 2, label: "", placeholder: "", name: '', required: false }];
let preDefinedData = [{ "fieldTitle": "Select", "inputType": "select", "type": "2", "isRequired": false, "options": [{ "option": "fsfsdf", "value": "dsf dsaf" }, { "option": "dsaf sdaf", "value": "adsf dsaf sda" }] }];
$(".footer").css( "display", "none" );
$(document).ready(function () {
    
    updateProfileFields();
    updateBasicFields();
    basicFieldsList.forEach(function (item) {
        $(".form_bal_" + item.inputType).draggable({
            helper: function () { return getGeneralHTMLfields(item); },
            connectToSortable: ".form_builder_area"
        });
    });
    personalFieldsList.forEach(function (item) {
        $(".form_bal_" + item.tag).draggable({
            helper: function () { return getProfileHTMLFields(item); },
            connectToSortable: ".form_builder_area"
        });
    });
    // loopPredefinedEls();
    $(".form_builder_area").sortable({
        cursor: 'move',
        placeholder: 'placeholder',
        start: function (e, ui) { ui.placeholder.height(ui.helper.outerHeight()); },
        stop: function (ev, ui) { enableOrDisableProfileFields(); }
    });
    $(".form_builder_area").disableSelection();
});

$(document).on('click', '.remove_more_options', function () {
    console.log("Ready to remove option element")
    var randNum = $(this).attr('data-randNum');
    $(this).closest('.options_row_' + randNum).hide('400', function () {
        console.log("option remove block")
        $(this).remove();
    });
});

$(document).on('click', '.remove_bal_field', function () {
    var randNum = $(this).attr('data-randNum');
    $(this).closest('.li_' + randNum).hide("400", function () {
        let dataType = $('.form_output_block_' + randNum).attr('data-type');
        if (dataType == 1) {
            let dataTag = $('.form_output_block_' + randNum).attr('data-tag');
            $(".form_bal_" + dataTag).draggable('enable').removeClass("bg-secondary text-white");
        }
        $(this).remove();
    })
});
$(document).on('click', '.add_more_options', function () {
    $(this).closest('.form_builder_field').css('height', 'auto');
    var randNum = $(this).attr('data-randNum');
    var optNum = generateRandNum();
    let optionEl = `<div data-randNum="${randNum}" class="row options_row_${randNum} pad-b-5" data-opt="${optNum}">
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="text" value="Option" class="c_opt form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="text" value="Value" class="c_val form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <i class="margin-top-5 fa fa-plus-circle fa-2x default_blue add_more_options" data-randNum="${randNum}"></i>
                            <i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_options" data-randNum="${randNum}"></i>
                        </div>
                    </div>`
    $('.field_extra_info_' + randNum).append(optionEl);
});
function updateProfileFields() {
    let profileEls = personalFieldsList.map(function (item) {
        return `<li class="form_bal_${item.tag}"><a href="javascript:;"><small><i class="${item.icon}"></i></small> ${item.title}</a></li>`;
    });
    $(".profile_fields").html(profileEls);
}
function updateBasicFields() {
    let generalEls = basicFieldsList.map(function (item) {
        return `<li class="form_bal_${item.inputType}"><a href="javascript:;"><small><i class="fa fa-plus-circle pull-left"></i></small> ${item.fieldTitle}</a></li>`;
    });
    $(".basic_fields").html(generalEls);
}
function enableOrDisableProfileFields() {
    personalFieldsList.forEach(function (item, index) {
        $(".form_bal_" + item.tag).draggable('enable');
    });
    var formOutputEls = $('.form_builder_area .form_output');
    formOutputEls.each(function () {
        var tag = $(this).attr('data-tag');
        $(".form_bal_" + tag).draggable('disable').addClass("bg-secondary text-white");
    })
}
function getGeneralHTMLfields(item){
    var randNum = generateRandNum();
    let blockCloseBtn = generateBlockCloseBtn(randNum, item.fieldTitle + " Element");
    let requiredElBlock = generateRequiredElBlock(randNum, item);
    let inputBlocks = generateContentBlkForGeneral(randNum, item);
    var blockEl = `${blockCloseBtn}<hr/><div class="row form_output form-font-13 form_output_block_${randNum}" data-type="${item.type}" 
                            data-title="${item.title}" data-tag="${item.tag}" 
                            data-iconList="${item.icon}" data-randNum="${randNum}">
                        ${inputBlocks}${requiredElBlock}
                    </div>`;
    return $('<div>').addClass('li_' + randNum + ' form_builder_field').html(blockEl);
}

function getProfileHTMLFields(item){
    var randNum = generateRandNum();
    var blockCloseBtn = generateBlockCloseBtn(randNum, '');
    var inputBlocks = generateContentBlkForProfile(randNum, item);
    var requiredElBlock = generateRequiredElBlock(randNum, item);
    var html = `${blockCloseBtn}<hr/><div class="row form_output form-font-13 form_output_block_${randNum}" data-type="${item.type}" 
                            data-title="${item.title}" data-tag="${item.tag}" 
                            data-iconList="${item.icon}" data-randNum="${randNum}">
                        ${inputBlocks}${requiredElBlock}
                    </div>`;
    return $('<div>').addClass('li_' + randNum + ' form_builder_field').html(html);
}

function generateBlockCloseBtn(randNum, elTitle) {
    return `<div class="row"><div class="col-sm-12"><strong>${elTitle}<button type="button" class="btn btn-outline-danger btn-sm remove_bal_field pull-right" data-randNum="${randNum}"><i class="fa fa-times"></i></button></strong></div></div>`
}
function generateRequiredElBlock(randNum, item) {
    return `<div class="col-sm-12"><hr/><div class="form-check"><label class="form-check-label"><input data-randNum="${randNum}" type="checkbox" value="${item.isRequired ? 'checked' : ''}" class="form-check-input form_input_req">Required</label></div></div>`;
}

function generateContentBlkForProfile(randNum, item) {
    switch (item.title) {
        case "Phone":
            return generateInputField({name:item.tag, value: '', placeholder:item.title, type:"text"}, item.title, true, "form_input_name", true, []);
            break;
        case "Address":
            let streetAdr = generateInputField({placeholder:"Street Address", value:'', type:'text'}, '', true, "form_input_street", false, []);
            let aptAdr = generateInputField({placeholder:"Apt/unit/box", value:'', type:'text'}, '', true, "form_input_apt", false, []);
            let cityAdr = generateInputField({placeholder:"City", value:'', type:'text'}, '', true, "form_input_city", false, []);
            let stateAdr = generateInputField({placeholder:"State", value:'', type:'text'}, '', true, "form_input_state", false, []);
            let zipAdr = generateInputField({placeholder:"Zip Number", value:'', type:'text'}, '', true, "form_input_zip", false, []);
            return `<div class="col-sm-12">
                        <div class="row" tyle="padding:10px;">
                                <div class="col-sm-6"><label>Street Address</label>${streetAdr}</div>
                                <div class="col-sm-5"><label>Apt/unit/box</label>${aptAdr}</div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4"><label>City</label>${cityAdr}</div>
                            <div class="col-sm-4"><label>State</label>${stateAdr}</div>
                            <div class="col-sm-3"><label>Zip Code</label>${zipAdr}</div>
                        </div>
                    </div>`;
            break;
        case "Birthday":
            return generateInputField({name:item.tag, value:"", placeholder:"dd/mm/yyyy", type: "date"}, item.title, true, "form_input_date", true, []);
            break;
        case "Medical Note":
            return generateInputField({name:item.tag, value:'', placeholder:"Medical Note", type:"textarea"}, item.title, true, "form_input_note", true, []);
            break;
        case "Marital Status":
            return generateInputField({name:item.tag, value:'', placeholder:"select Marital Status", type:"select"}, item.title, true, "form_input_name", true, [{ name: "Married", value: "married" }]);
            break;
        case "Gender":
            return generateInputField({name:item.tag, value:"male", paceholder:'Select Gender', type:"select"}, item.title, true, "form_input_name", true, [{ name: "Male", value: "male" }]);
            break;
        case "Social Profile":
            return generateInputField({name:item.tag, value:'', placeholder:item.title, type:"text"}, item.title, true, "form_input_name", true, []);
            break;
        default:
            return '';
            break;
    }
}
function generateContentBlkForGeneral(randNum, item) {
    // label: "", placeholder: "", name: ''},
    switch (item.fieldTitle) {
        case "Text":
        case "Paragraph":
        case "Date":
        case "Number":
            let labelEl = generateInputField({name:'label_'+randNum, value:item.label, placeholder:"Label", type:"text"}, '', false, "form_input_label", true, []);
            let plasceholderEl = generateInputField({name:'label_'+randNum, value:item.placeholder, placeholder:"Placeholder", type:"text"}, '', false, "form_input_placeholder", true, []);
            let nameEl = generateInputField({name:'label_'+randNum, value:item.name, placeholder:"Element Name", type:"text"}, '', false, "form_input_name", true, []);
            return labelEl + plasceholderEl + nameEl;
            break;
        case "Select":
        case "Checkbox":
        case "Radio Button":
            let labelEl1 = generateInputField({name:'label_'+randNum, value:item.label, placeholder:"Lable", type:"text"}, item.title, false, "form_input_name", true, []);
            let nameEl1 = generateInputField({name:'name_'+randNum, value:item.name, placeholder:"Element Name", type:"text"}, '', false, "form_input_name", true, []);
            let optEl1 = generateOptionValuePairs(randNum, item);
            return `${labelEl1} ${nameEl1} ${optEl1}`;
            break;
    }
}
function generateOptionValuePairs(randNum, item) {
    let optNum = generateRandNum();
    let optionEls = "";
    item.options.forEach(function (lItem, index) {
        let removeOptEl = index == 0? "" : `<i class="margin-top-5 margin-left-5 fa fa-times-circle default_red fa-2x remove_more_options" data-randNum="${randNum}"></i>`;
        optionEls += `<div class="col-md-4">
                            <div class="form-group">
                                <input type="text" value="${lItem.option ? lItem.option : 'Option'}" class="c_opt form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <input type="text" value="${lItem.option ? lItem.option : 'Value'}" class="c_val form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <i class="margin-top-5 fa fa-plus-circle fa-2x default_blue add_more_options" data-randNum="${randNum}"></i>
                            ${removeOptEl}
                        </div>`
    })
    return `<div class="col-md-12">
                <div class="field_extra_info_${randNum}">
                    <div data-randNum="${randNum}" class="row options_row_${randNum} pad-b-5" data-opt="${optNum}">
                        ${optionEls}
                    </div>
                </div>
            </div>`
}
function generateInputField(attrs={}, label, isDisabled, addClass = null, withBlock = false, options = []) {
    let currentEl = null;
    let textInputTypes = ["text", "number", "email", "checkbox", "date", "radio", "password"]
    if (textInputTypes.includes(attrs.type)) {
        currentEl = $('<input/>').attr(attrs).prop("disabled", isDisabled).addClass("form-control " + addClass);
    } else if (attrs.type === "textarea") {
        currentEl = $('<textarea/>').attr(attrs).prop("disabled", isDisabled).addClass("form-control form_input_name");
        if (isDisabled) {
            currentEl.addClass("text-secondary");
        }
    } else if (attrs.type === "select") {
        currentEl = $("<select>").addClass("form-control form_input_name form-font-13").prop("disabled", isDisabled);
        options.forEach(function (option) {
            let opt = $('<option/>').attr({ value: option.value }).text(option.name);
            currentEl.append(opt);
        });
    }
    if (withBlock) {
        let labelEl = $("<lable>").text(label);
        let result = $("<div>").addClass('col-sm-12').html([labelEl, currentEl]);
        return result[0].outerHTML;
    } else {
        return currentEl[0].outerHTML;
    }
}
function generateRandNum() {
    return Math.floor(Math.random() * (100000 - 1 + 1) + 57);
}
