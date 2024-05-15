<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DataAccess db=new DataAccess();
String msg="",search="",icon="success";
if(request.getParameter("btnsearch")!=null){
	search=request.getParameter("txtsearch");
	session.setAttribute("search",search);
	response.sendRedirect("/postoffice/products.jsp?q="+search);
	//Redirects or moves from one page to another page (State lost)
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Office Management::</title>
<link href="/postoffice/css/bootstrap.css" rel="stylesheet"/>
<link href="/postoffice/js/DataTables/datatables.css" rel="stylesheet"/>

<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-danger" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/postoffice/index.jsp">
    <img src="/postoffice/images/logo.jpg" width="60px" height="60px' alt="NA"/>
    POST OFFICE
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null) //if No login
      {      
      %>
        <li class="nav-item">
          <a class="nav-link active" href="/postoffice/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/feedback.jsp">Feedback</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
       %> 
       <li class="nav-item">
          <a class="nav-link active" href="/postoffice/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/parcellist.jsp">Parcel History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/moneylist.jsp">Money Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/Accountlist.jsp">Customers Accounts</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/emplist.jsp">Registers Employee</a>
        </li>   
         <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/custlist.jsp">Registers Customers</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/translist.jsp">Transaction History</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/billlist.jsp">Billing History</a>
        </li>     
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/feedbacks.jsp">Feedbacks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/reportlist.jsp">Reports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/admin/changepass.jsp">Change Password</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Employee")){
       %>
       <li class="nav-item">
          <a class="nav-link active" href="/postoffice/employee/employee.jsp">Employee
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/moneylist.jsp">Customers Money Order</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/Accountlist.jsp">Account Status</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/trans.jsp">Transaction</a>
        </li>     
         <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/translist.jsp">Transaction History</a>
        </li>     
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/bill.jsp">BillPay</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/billlist.jsp">BillPay History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/parcellist.jsp">Customer Parcels</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/employee/closeaccount.jsp">Closing Account</a>
        </li>    
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/changepass.jsp">Change Password</a>
        </li>
        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("Customer")){
       %>
       <li class="nav-item">
          <a class="nav-link active" href="/postoffice/customer/customer.jsp">Customer
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/money.jsp">MoneyOrder</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/moneylist.jsp">Money Order Status</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/account.jsp">Account Opening</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/Accountlist.jsp">Account Status</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/translist.jsp">Transactions History</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/billlist.jsp">Bills History</a>
        </li>   
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/parcel.jsp">Parcel</a>
        </li> 
         <li class="nav-item">
          <a class="nav-link" href="/postoffice/customer/parcellist.jsp">Parcel Delivery History</a>
        </li>  
        
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/changepass.jsp">Change Password</a>
        </li>        
       <%
       }
       %>
      </ul>      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="/postoffice/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/signup.jsp">Signup</a>
        </li>
      </ul>
      <%
      }else{
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="#"><%=session.getAttribute("user")%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/postoffice/logout.jsp">Logout</a>
        </li>
      </ul>
      <%
      }
      %>
    </div>
  </div>
</nav>
