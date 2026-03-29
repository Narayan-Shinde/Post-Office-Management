<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnchange")!=null) //Login button clicked
{	
	String opass=request.getParameter("txtopass");
	String npass=request.getParameter("txtnpass");
	String cpass=request.getParameter("txtcpass");
	
	//CHeck old password is valid or not
	String user=session.getAttribute("user")+""; //Convert Object to String
	String pass=session.getAttribute("pass")+"";
	
	if(!opass.equals(pass)){ //if not matching with db password
		msg="Please enter valid old password";		
	}else{
		db.executeSql("Update Signup set Password=? where EmailID=?",npass,user);
		msg="Password changed successfully....";
	}
	
}

%>
<link rel="stylesheet" href="css/changepass.css" />
<!-- Login Page Specific Contents -->
<!-- Updated Login Page with Required Inputs -->
<div class="main-wrapper">
    <form method="post" id="passwordChangeForm">
        <div class="password-form-wrapper">
            <h2 class="form-title">Change Password</h2>

            <div class="input-group">
                <label for="oldPassword">Old Password</label>
                <input type="password" name="txtopass" id="oldPassword" class="input-field" placeholder="Enter Old Password" required/>
            </div>

            <div class="input-group">
                <label for="newPassword">New Password</label>
                <input type="password" name="txtnpass" id="newPassword" class="input-field" placeholder="Enter New Password" required/>
            </div>

            <div class="input-group">
                <label for="confirmPassword">Confirm New Password</label>
                <input type="password" name="txtcpass" id="confirmPassword" class="input-field" placeholder="Confirm New Password" required/>
            </div>

            <input type="submit" name="btnchange" value="Submit" class="submit-btn"/>
        </div>
    </form>
</div>
<%@ include file="footer.jsp"%>
 <script>
 $(function(){
	$("#form1").validate({
		rules:{
			txtopass:{
				required:true
			},
			txtnpass:{
				required:true
			},
			txtcpass:{
				required:true,
				equalTo:"#txtnpass"
			}
		},
		messages:{
			txtopass:{
				required:"Old Password is required"
			},
			txtnpass:{
				required:"New Password is required"
			},
			txtcpass:{
				required:"Confirm New Password is required",
				equalTo:"Password Mismatch"
			}
		}
		
	}); 
 });
 
 </script>
 