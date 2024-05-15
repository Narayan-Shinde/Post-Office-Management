<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-7 offset-2">
<br/>
<h1>Registered Employees List</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>Id</th>
<th>Name</th>
<th>Address</th>
<th>Email ID/UserName</th>
<th>Mobile No</th>
<th>Password</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Signup where Type='Employee'");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%="********" %></td>
</tr>

<%
}
%>

</tbody>
</table>
</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>