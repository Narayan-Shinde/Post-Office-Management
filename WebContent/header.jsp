<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DataAccess db = new DataAccess();
String msg = "", search = "", icon = "success";
if (request.getParameter("btnsearch") != null) {
    search = request.getParameter("txtsearch");
    session.setAttribute("search", search);
    response.sendRedirect("/postoffice/products.jsp?q=" + search);
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Post Office Management::</title>
<link href="/postoffice/css/bootstrap.css" rel="stylesheet"/>
<link href="/postoffice/css/datatables.css" rel="stylesheet"/>

<style>
label.error {
    color: red;
    font-weight: bold;
}
.bg-custom-danger {
    background-color: #f50057 !important;
}
.nav-link{
color:black;
}
.navbar-nav .nav-link.active {
    text-decoration: underline;
    text-decoration-color: black;
    text-decoration-thickness: 3px;
    color:white;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-custom-danger" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/postoffice/index.jsp">
      <img src="/postoffice/images/logo.jpg" width="100px" height="60px" alt="NA"/> POST OFFICE
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      String currentPage = request.getRequestURI(); // Get the current page URL
      if (session.getAttribute("user") == null) { // No login
      %>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/index.jsp") ? "active" : "" %>" href="/postoffice/index.jsp">Home</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/services.jsp") ? "active" : "" %>" href="/postoffice/services.jsp">Services</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/about.jsp") ? "active" : "" %>" href="/postoffice/about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/contact.jsp") ? "active" : "" %>" href="/postoffice/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/feedback.jsp") ? "active" : "" %>" href="/postoffice/feedback.jsp">Feedback</a>
        </li>        
      <%
      } else if (session.getAttribute("user") != null && session.getAttribute("type").equals("admin")) {
      %> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/admin.jsp") ? "active" : "" %>" href="/postoffice/admin/admin.jsp">Admin</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/Accountlist.jsp") ? "active" : "" %>" href="/postoffice/admin/Accountlist.jsp">Customers Accounts</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/custlist.jsp") ? "active" : "" %>" href="/postoffice/admin/custlist.jsp">Registers Customers</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/emplist.jsp") ? "active" : "" %>" href="/postoffice/admin/emplist.jsp">Registers Employee</a>
        </li>   
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/parcellist.jsp") ? "active" : "" %>" href="/postoffice/admin/parcellist.jsp">Parcel History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/moneylist.jsp") ? "active" : "" %>" href="/postoffice/admin/moneylist.jsp">Money Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/billlist.jsp") ? "active" : "" %>" href="/postoffice/admin/billlist.jsp">Billing History</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/translist.jsp") ? "active" : "" %>" href="/postoffice/admin/translist.jsp">Transaction History</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/feedbacks.jsp") ? "active" : "" %>" href="/postoffice/admin/feedbacks.jsp">Feedbacks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/reportlist.jsp") ? "active" : "" %>" href="/postoffice/admin/reportlist.jsp">Reports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/admin/changepass.jsp") ? "active" : "" %>" href="/postoffice/admin/changepass.jsp">Change Password</a>
        </li>        
      <%
      } else if (session.getAttribute("user") != null && session.getAttribute("type").equals("Employee")) {
      %>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/employee.jsp") ? "active" : "" %>" href="/postoffice/employee/employee.jsp">Employee</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/custlist.jsp") ? "active" : "" %>" href="/postoffice/employee/custlist.jsp">Register Customer List</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/Accountlist.jsp") ? "active" : "" %>" href="/postoffice/employee/Accountlist.jsp">Customer Account List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/pendingmoneylist.jsp") ? "active" : "" %>" href="/postoffice/employee/pendingmoneylist.jsp">Money Order List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/pendingtransactionlist.jsp") ? "active" : "" %>" href="/postoffice/employee/pendingtransactionlist.jsp">Trans List</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/pendingbilllist.jsp") ? "active" : "" %>" href="/postoffice/employee/pendingbilllist.jsp">Bill Pay List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/pendingparcellist.jsp") ? "active" : "" %>" href ="/postoffice/employee/pendingparcellist.jsp">Parcel List</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/billlist.jsp") ? "active" : "" %>" href="/postoffice/employee/billlist.jsp">Bill Pay History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/translist.jsp") ? "active" : "" %>" href="/postoffice/employee/translist.jsp">Trans History</a>
        </li>     
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/moneylist.jsp") ? "active" : "" %>" href="/postoffice/employee/moneylist.jsp">Money Order History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/parcellist.jsp") ? "active" : "" %>" href="/postoffice/employee/parcellist.jsp">Parcel History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/employee/closeaccount.jsp") ? "active" : "" %>" href="/postoffice/employee/closeaccount.jsp">Close Account</a>
        </li>    
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/changepass.jsp") ? "active" : "" %>" href="/postoffice/changepass.jsp">Change Password</a>
        </li>
      <%
      } else if (session.getAttribute("user") != null && session.getAttribute("type").equals("Customer")) {
      %>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/customer.jsp") ? "active" : "" %>" href="/postoffice/customer/customer.jsp">Customer</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/money.jsp") ? "active" : "" %>" href="/postoffice/customer/money.jsp">Money Order</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/moneylist.jsp") ? "active" : "" %>" href="/postoffice/customer/moneylist.jsp">Money Order History</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/account.jsp") ? "active" : "" %>" href="/postoffice/customer/account.jsp">Account Opening</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/Accountlist.jsp") ? "active" : "" %>" href="/postoffice/customer/Accountlist.jsp">Account Status</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/trans.jsp") ? "active" : "" %>" href="/postoffice/customer/trans.jsp">Transaction</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/translist.jsp") ? "active" : "" %>" href="/postoffice/customer/translist.jsp">Transactions History</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/bill.jsp") ? "active" : "" %>" href="/postoffice/customer/bill.jsp">Bills</a>
        </li>   
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/billlist.jsp") ? "active" : "" %>" href="/postoffice/customer/billlist.jsp">Bills History</a>
        </li>   
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/parcel.jsp") ? "active" : "" %>" href="/postoffice/customer/parcel.jsp">Parcel</a>
        </li> 
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/customer/parcellist.jsp") ? "active" : "" %>" href="/postoffice/customer/parcellist.jsp">Parcel Delivery History</a>
        </li>  
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/ch angepass.jsp") ? "active" : "" %>" href="/postoffice/changepass.jsp">Change Password</a>
        </li>        
      <%
      }
      %>
      </ul>      
      <%
      if (session.getAttribute("user") == null ) {
      %>
      <ul class="navbar-nav float-right">
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/login.jsp") ? "active" : "" %>" href="/postoffice/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link <%= currentPage.equals("/postoffice/signup.jsp") ? "active" : "" %>" href="/postoffice/signup.jsp">Signup</a>
        </li>
      </ul>
      <%
      } else {
      %>
      <ul class="navbar-nav float-right">
        <li class="nav-item">
          <a class="nav-link" href="#"><%= session.getAttribute("user") %></a>
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