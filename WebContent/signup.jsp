<%@page import="com.captcha.botdetect.web.servlet.Captcha"%>
<%@page import="com.util.db.SMS"%>
<%@page import="com.util.db.SendMail"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib prefix="botDetect" uri="https://captcha.com/java/jsp"%>
<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
 icon = "";
 msg  = "";

if (request.getParameter("btnsignup") != null) {
    String name    = request.getParameter("txtname");
    String address = request.getParameter("txtaddress");
    String email   = request.getParameter("txtemail");
    String mobile  = request.getParameter("txtmobile");
    String pass    = request.getParameter("txtpass");
    String cpass   = request.getParameter("txtcpass");
    String type    = request.getParameter("txttype");

    try {
        Captcha captcha = Captcha.load(request, "formCaptcha");
        String ans = request.getParameter("ans");

        if (!captcha.validate(ans)) {
            icon = "error";
            msg  = "Invalid Captcha.";
        } else if (!pass.equals(cpass)) {
            icon = "error";
            msg  = "Passwords do not match.";
        } else {
            try {
                // will fail if UNIQUE constraint on EmailID or MobileNo is violated
                int n = db.executeSql(
                    "INSERT INTO Signup (Name,Address,EmailID,MobileNo,Password,Type) " +
                    "VALUES(?,?,?,?,?,?)",
                    name, address, email, mobile, pass, type
                );
                if (n > 0) {
                    response.sendRedirect("login.jsp");
                    return;
                } else {
                    icon = "error";
                    msg  = "Registration failed.";
                }
            } catch (java.sql.SQLIntegrityConstraintViolationException e) {
                // duplicate email or mobile
                icon = "error";
                msg  = "Email or Mobile already registered.";
            }
        }
    } catch (Exception ex) {
        icon = "error";
        msg  = "Error: " + ex.getMessage();
    }
}
%>

<link rel="stylesheet" href="css/register.css">
<!-- Signup Page Specific Contents -->
<section>
  <div class="container">
    <div class="title">Registration</div>
    <% if(!msg.isEmpty()) { %>
    <div class="alert <%=icon%>"><%=msg%></div>
    <% } %>
    <div class="content">
      <form method="post" id="form1" onsubmit="return validateForm()">
        <div class="user-details">
          <div class="input-box">
            <span class="details">Full Name</span>
            <input type="text" name="txtname" id="txtname" placeholder="Enter your name" required 
                   oninvalid="this.setCustomValidity('Name is required')" oninput="this.setCustomValidity('')">
          </div>

          <div class="input-box">
            <span class="details">Address</span>
            <textarea name="txtaddress" id="txtaddress" rows="2" placeholder="Enter your address" required 
                      oninvalid="this.setCustomValidity('Address is required')" oninput="this.setCustomValidity('')"></textarea>
          </div>

          <div class="input-box">
            <span class="details">Email</span>
            <input type="email" name="txtemail" id="txtemail" placeholder="Enter your email" required 
                   oninvalid="this.setCustomValidity('Valid email is required')" oninput="this.setCustomValidity('')">
          </div>

          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" name="txtmobile" id="txtmobile" placeholder="Enter your number" required 
                   pattern="\d{10}" oninvalid="this.setCustomValidity('Enter a valid 10-digit phone number')" 
                   oninput="this.setCustomValidity('')">
          </div>

          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" name="txtpass" id="txtpass" placeholder="Enter your password" required 
                   oninvalid="this.setCustomValidity('Password is required')" oninput="this.setCustomValidity(''); checkPasswordMatch();">
            <div id="passMatch" style="color: green; font-size: 12px; margin-top: 5px;"></div>
          </div>

          <div class="input-box">
            <span class="details">Confirm Password</span>
            <input type="password" name="txtcpass" id="txtcpass" placeholder="Confirm your password" required 
                   oninvalid="this.setCustomValidity('Confirm password is required')" oninput="this.setCustomValidity(''); checkPasswordMatch();">
          </div>

          <div style="width: 100%; text-align:center; margin: 20px 0;">
            <input type="checkbox" id="showPassword" style="margin-right: 5px;">
            <label for="showPassword" style="font-weight: 500; color: black;">Show Password</label>
          </div>
          <br>

          <div class="gender-details">
            <span class="gender-title">Select User Type</span>
            <br>
            <div class="category">
              <input type="radio" name="txttype" value="Customer" id="dot-1" onchange="changeColor(); validateForm();">
              <label for="dot-1">
                <span class="dot one"></span>
                <span class="gender">Customer</span>
              </label>

              <input type="radio" name="txttype" value="Employee" id="dot-2" onchange="changeColor(); validateForm();">
              <label for="dot-2">
                <span class="dot two"></span>
                <span class="gender">Employee</span>
              </label>
            </div>
            <span id="genderError" style="color: red; font-size: 12px;"></span>
          </div>

          <div class="input-box">
            <span class="details">Captcha</span>
            <botDetect:captcha id="formCaptcha" userInputID="ans" codeLength="4" imageWidth="300" imageStyle="GRAFFITI2" />
            <br>
            <input type="text" id="ans" name="ans" placeholder="Enter captcha" required 
                   oninvalid="this.setCustomValidity('Please enter captcha')" oninput="this.setCustomValidity('')">
          </div>
        </div>

        <div class="button">
          <input type="submit" name="btnsignup" value="Signup">
        </div>

        <div class="register-link">
          <p>Already have an account? <a href="/postoffice/login.jsp">Login</a></p>
        </div>
      </form>
    </div>
  </div>
</section>

<script>
  document.getElementById("showPassword").addEventListener("change", function () {
    let password = document.getElementById("txtpass");
    let confirmPassword = document.getElementById("txtcpass");
    if (this.checked) {
      password.type = "text";
      confirmPassword.type = "text";
    } else {
      password.type = "password";
      confirmPassword.type = "password";
    }
  });

  function checkPasswordMatch() {
    let pass = document.getElementById("txtpass").value;
    let cpass = document.getElementById("txtcpass").value;
    let matchDiv = document.getElementById("passMatch");
    
    if (pass && cpass) {
      if (pass === cpass) {
        matchDiv.textContent = "Passwords match!";
        matchDiv.style.color = "green";
      } else {
        matchDiv.textContent = "Passwords do not match!";
        matchDiv.style.color = "red";
      }
    } else {
      matchDiv.textContent = "";
    }
  }

  function validateForm() {
    let genderSelected = document.querySelector('input[name="txttype"]:checked');
    if (!genderSelected) {
      document.getElementById("genderError").textContent = "Please select a user type.";
      return false;
    }
    document.getElementById("genderError").textContent = "";
    
    let pass = document.getElementById("txtpass").value;
    let cpass = document.getElementById("txtcpass").value;
    if (pass !== cpass) {
      alert("Passwords do not match. Please try again.");
      document.getElementById("passMatch").textContent = "Passwords do not match!";
      document.getElementById("passMatch").style.color = "red";
      return false;
    }
    return true;
  }
</script>

<%@ include file="footer.jsp"%>
