<%@ include file="../header.jsp"%>
<div class="row">
<div class="col-7 offset-2">
<h1>Admin Dashboard</h1>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">Admin can do::</a>
  <a href="/postoffice/admin/parcellist.jsp" class="list-group-item list-group-item-action">Parcels History</a>
  <a href="/postoffice/admin/moneylist.jsp" class="list-group-item list-group-item-action">Money Orders</a>
  <a href="/postoffice/admin/Accountlist.jsp" class="list-group-item list-group-item-action">Registered Accounts</a>
  <a href="emplist.jsp" class="list-group-item list-group-item-action">Registered Employees</a>
  <a href="custlist.jsp" class="list-group-item list-group-item-action">Registered Customers</a>
  <a href="translist.jsp" class="list-group-item list-group-item-action">Transaction History</a>
  <a href="billlist.jsp" class="list-group-item list-group-item-action">Billing History</a>
  <a href="/postoffice/admin/feedbacks.jsp" class="list-group-item list-group-item-action">Review Feedbacks</a>
  <a href="/postoffice/admin/reportlist.jsp" class="list-group-item list-group-item-action">Generate Different Reports</a>    
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>