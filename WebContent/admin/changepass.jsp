<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("btnchange") != null) { // Login button clicked
    String opass = request.getParameter("txtopass");
    String npass = request.getParameter("txtnpass");
    String cpass = request.getParameter("txtcpass");

    // Check if old password is valid
    String user = session.getAttribute("user") + ""; // Convert Object to String
    String pass = session.getAttribute("pass") + "";

    if(!opass.equals(pass)) { // If not matching with DB password
        msg = "Please enter valid old password";        
    } else {
        db.executeSql("UPDATE AdminLogin SET Password=? WHERE UserName=?", npass, user);
        msg = "Password changed successfully....";
    }
}
%>
   <link rel="stylesheet" href="/postoffice/css/changepass2.css">
    <section class="main-wrapper">
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
    </section>
    <script src="postoffice/js/validate.js"></script>
    <%@ include file="../footer.jsp"%>