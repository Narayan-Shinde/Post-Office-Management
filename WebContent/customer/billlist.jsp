<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/billtable.css">
<section>
<div class="moneyorder">
<h1>Paid Bills List/History</h1>
<table>
<thead>
<tr>
<th>BillNo</th>
<th>BillType</th>
<th>Email Id</th>
<th>Account No</th>
<th>Amount</th>
<th>PaidDate</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Bills where EmailID=?",session.getAttribute("user"));
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(5) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(6) %></td>
</tr>
<%
}
%>

</tbody>
</table>
</div>
</section>
<%@ include file="../footer.jsp"%>