<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("id")!=null){
	db.executeSql("Update AccountDetails set Status=? where AcNo=?","Closed",request.getParameter("id"));
	response.sendRedirect("closeaccount.jsp");
}

%>
<link rel="stylesheet" href="/postoffice/css/closeaccount.css">
<section>
<div class="moneyorder">
<h1>Close Account</h1>
<table>
<thead>
<tr>
<th>ACNo</th>
<th>Name</th>
<th>EmailID</th>
<th>OpeningDate</th>
<th>AcType</th>
<th>AC Balance</th>
<th>Status</th>
<th>Mobile</th>
<th>Address</th>
<th>ClosingDate</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from accountdetails where Status!='Closed'");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
<td><%=rs.getString(8) %></td>
<td><%=rs.getString(9) %></td>
<td><%=rs.getString(10) %></td>

<td>
<a onclick="if(confirm('Are you sure to close account?')) return true; else return false;" href="?id=<%=rs.getString(1) %>" class="btn btn-info">Close Account</a>
</td>
</tr>
<%
}
%>

</tbody>
</table>
</div>
</section>
<%@ include file="../footer.jsp"%>