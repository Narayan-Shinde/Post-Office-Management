<%@ page import="java.sql.ResultSet" %>
<%@ include file="header.jsp"%>
<%
if(request.getParameter("btnlogin")!=null) //Login button clicked
{
	String user=request.getParameter("txtuser");
	String pass=request.getParameter("txtpass");
	
	//admin email id ==> admin@gmail.com	
	if(user.contains("admin")){ //if user string contains admin word then it is admin
		//Validate it against adminlogin table	
		ResultSet rs=db.getRows("select * from AdminLogin where UserName=? and Password=?", user,pass);
		if(rs.next()){ //true/false
			//redirect to admin dashboard
			session.setAttribute("user", user);
			session.setAttribute("pass",pass);
			session.setAttribute("type","admin");
			msg="Login Successfull";
			response.sendRedirect("/postoffice/admin/admin.jsp");
		}else{
			session.setAttribute("user",null);
			session.setAttribute("pass",null);
			session.setAttribute("type",null);
			icon="error";
			msg="Invalid UserName/Password... Try again...";
		}
		
	}else{ //otherwise it is customer
		//Validate it against signup table	
		ResultSet rs=db.getRows("select * from Signup where EmailID=? and Password=?", user,pass);
		if(rs.next()){ //true/false
			//redirect to customer dashboard
			session.setAttribute("user", user);
			session.setAttribute("pass",pass);
			String type=rs.getString("Type");
			session.setAttribute("type",type);
			if(request.getParameter("pid")!=null){
				response.sendRedirect("/postoffice/customer/addToCart.jsp?pid="+request.getParameter("pid"));
			}else{
				if(type.equals("Employee")){
					response.sendRedirect("/postoffice/employee/employee.jsp");
				}else{
					response.sendRedirect("/postoffice/customer/customer.jsp");
				}
			}
		}else{
			session.setAttribute("user",null);
			session.setAttribute("pass",null);
			session.setAttribute("type",null);
			icon="error";
			msg="Invalid UserName/Password... Try again...";
		}		
	}
}

%>
<link rel="stylesheet" href="css/login2.css">
    <section>
    <div class="form-container">
        <h2>Login</h2>
        <form method="post">
            <div class="input-field">
                <label for="txtuser">Email</label>
                <input type="email" name="txtuser" id="txtuser" placeholder="Enter your email" required>
            </div>
            <div class="input-field">
                <label for="txtpass">Password</label>
                <input type="password" name="txtpass" id="txtpass" placeholder="Enter your password" required>
            </div>
            <div class="center-button">
                <button type="submit" name="btnlogin">Login</button>
            </div>
            <div class="register-link">
                <p>Don't have an account? <a href="/postoffice/signup.jsp">Register</a></p>
            </div>
        </form>
    </div>
</section>
<%@ include file="footer.jsp"%>
 
 