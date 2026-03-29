<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/feedbacktable.css">
<section>
<div class="moneyorder">
<h1>Users Feedbacks</h1>
<table>
<thead>
<tr>
<th>ID</th>
<th>Name</th>
<th>Email ID</th>
<th>Mobile No</th>
<th>Review</th>
<th>Message</th>
<th>Date Time</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Feedback");
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
</tr>

<%
}
%>

</tbody>
</table>
</div>
</section>
<%@ include file="../footer.jsp"%>