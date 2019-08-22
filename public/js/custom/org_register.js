$(document).ready(function () {


    chkValidateStatus = "";
    chkValidateStatus = $("#organizationCreateForm").validate({
        //ignore:[],// false,
        ignore: false,
        errorClass: "error",
        rules: {
            orgName: {
                required: true                
            },
            orgDomain: {
                required: true,
                uniqueOrgDomain:true
            },
            first_name: {
                required: true
            },
            email: {
                required: true,
                email:true
            },
            password: {
                required: true,
                minlength : 5

            },
            confirm_password: {
                required: true,
                minlength : 5,
                equalTo : "#password"
            },
            orgTimeZone: {
                required: true

            }
        },
        messages: {
            orgName: {
                required: "Please enter oraganization name"
            },
            orgDomain: {
                required: "Please enter oraganization domain name"
            },
            first_name: {
                required: "Please enter name"
            },
            email: {
                required: "Please enter email",
                email: "Please enter valid email"
            },
            password: {
                required: "Please enter password"
            },
            confirm_password: {
                required: "Please enter confirm_password"
            },
        }
    });

});
 

//DUPLICATE BRANCH CODE WITH SAME ACCOUNT HEAD TYPE VALIDATION
    $.validator.addMethod("uniqueOrgDomain", function(ahSiteId, element) {
        //alert('ss');
        var mydata1 = null;
        var orgDomain = $.trim($('#orgDomain').val());
        
        var dataString = 'orgDomain='+orgDomain;
        //alert(dataString);
        $.ajax({
            type: "POST",
            async: false,
            data: dataString,
            url: siteUrl+'/check_unique_org_domain',
            success: function(data){
                //alert(data);
                if (data == "found"){
                    mydata1 = data;
                }
            }
        });
        return (mydata1 != "found");
    }, 'This Domain Name is already exist');
    
$("#btnCreateOrg").click(function () {

    var formObj = $('#organizationCreateForm');
    var formData = new FormData(formObj[0]);

    $("#organizationCreateForm").valid();

    var errorNumbers = chkValidateStatus.numberOfInvalids();

    if (errorNumbers == 0) {
        $.ajax({
            url: siteUrl + '/org_register',
            async: true,
            type: "POST",
            data: formData,
            dataType: "json",
            contentType: false,
            cache: false,
            processData: false,
            success: function (data)
            {
                
                if(data.result_code === 1){
                    alert(data.message);
                    $("#organizationLoginDetails").html(data.logindetails);
                    //$('#organizationLoginDetails').focus();
                    // var scrollPos =  $(".organizationLoginDetails").offset().top;
                    //$(window).scrollTop(scrollPos);


                    $("#organizationCreateForm").trigger("reset");
                }else{
                    alert(data.message);
                    return false;
                }
                
                //console.log(data);
//                
//                $('#modal-account_head').modal('hide');
//                if (data == "updated") {
//                    alert("Account Head Updated");
//                    //location.reload();
//                    load_account_heads_datatable();
//
//                }else if (data == "inserted") {
//                    alert("Account Head Added");
//                    //location.reload();
//                    load_account_heads_datatable();
//
//                } else {
//                    alert("Error in Updation");
//                    return false;
//                }
            }

        });

    } else {

    }
});

//form submission
$('#organizationCreateForm').submit(function (e) {
    var errorNumbers = chkValidateStatus.numberOfInvalids();
    if (errorNumbers == 0) {
        return true;
    }
    else
    {
    
    }
});