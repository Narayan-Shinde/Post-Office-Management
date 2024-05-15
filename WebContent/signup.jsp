<%@page import="java.sql.ResultSet"%>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnsignup")!=null) 
{
	String name=request.getParameter("txtname");
	String address=request.getParameter("txtaddress");	
	String email=request.getParameter("txtemail");
	String mobile=request.getParameter("txtmobile");
	String pass=request.getParameter("txtpass");
	String type=request.getParameter("txttype");
	db.executeSql("Insert into Signup (Name,Address,EmailID,MobileNo,Password,Type) values(?,?,?,?,?,?)", name,address,email,mobile,pass,type);
	msg="You have successfully registered with Site. Please Login";
}

%>
<!-- Signup Page Specific Contents -->
<div class="container">
<form method="post" id="form1">
<div class="col-5 offset-3">
<br/>
<br/>
<h2>Create Account</h2>
<div class="form-group">
Name
<input type="text" name="txtname" id="txtname" class="form-control" placeholder="Enter Name"/>
</div>
<div class="form-group">
Address
<textarea name="txtaddress" id="txtaddress" class="form-control"></textarea>
</div>
<div class="form-group">
Email Address
<input type="text" name="txtemail" id="txtemail" class="form-control" placeholder="Enter Username"/>
</div>
<div class="form-group">
Mobile No
<input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile No"/>
</div>
<div class="form-group">
Password
<input type="password" name="txtpass" id="txtpass" class="form-control" placeholder="Enter Password"/>
</div>
<div class="form-group">
Confirm Password
<input type="password" name="txtcpass" id="txtcpass" class="form-control" placeholder="Enter New Password"/>
</div>
<div class="form-group">
User Type
<select class="form-select" name="txttype">
<option value="">--Select User Type--</option>
<option value=Customer>Customer</option>
<option value="Employee">Employee</option>
</select>
</div>
<br/>
<input type="submit" name="btnsignup" value="Signup" class="btn btn-primary"/>
</div>
</form>
</div>
<%@ include file="footer.jsp"%>
 <script>
 $(function(){
	$("#form1").validate({
		rules:{
			txtemail:{
				required:true,
				email:true
			},
			txtmobile:{
				required:true,
				pattern:/^\d{10}$/
			},
			txtpass:{
				required:true
			},
			txtcpass:{
				required:true,
				equalTo:"#txtpass"
			},
			type:{
				required:true
			}
		},
		messages:{
			txtemail:{
				required:"EmailID is required",
				email:"Invalid Email ID"
			},
			txtmobile:{
				required:"Mobile No is required",
				pattern:"Mobile No allows only 10 digits"
			},
			txtpass:{
				required:"Password is required"
			},
			txtcpass:{
				required:"Confirm Password is required",
				equalTo:"Password Mismatch"
			},
			type:{
				required:"Please select user type"
			}
		}
		
	}); 
 });
 
 </script>
 