<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/customertable.css">
<section>
<div class="moneyorder">
<h1>Registered Customers List</h1>
<table>
<thead>
<tr>
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
ResultSet rs=db.getRows("select * from Signup where Type='Customer'");
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
</section>
<%@ include file="../footer.jsp"%>