$(function(){
    $("#passwordChangeForm").validate({
        rules:{
            txtopass:{ required:true },
            txtnpass:{ required:true },
            txtcpass:{ required:true, equalTo:"#newPassword" }
        },
        messages:{
            txtopass:{ required:"Old Password is required" },
            txtnpass:{ required:"New Password is required" },
            txtcpass:{ required:"Confirm New Password is required", equalTo:"Password Mismatch" }
        }
    });
});
