<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/moneyordertable.css">
<section>
<div class="moneyorder">
<h1>Money Order History</h1>
<table>
<thead>
<tr>
<th>TrNo</th>
<th>TrDate</th>
<th>Sender Name</th>
<th>Sender Address</th>
<th>Sender Contact Number</th>
<th>Receiver Name</th>
<th>Receiver Address</th>
<th>Receiver Contact Number</th>
<th>Amount</th>
<th>Recepit Date</th>
<th>Pay Mode</th>
<th>Email ID</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from MoneyOrder where EmailID=?",session.getAttribute("user"));
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
<td><%=rs.getString(11) %></td>
<td><%=rs.getString(12) %></td>
<td><%=rs.getString(13) %></td>
</tr>
<%
}
%>

</tbody>
</table>
</div>
</section>
<%@ include file="../footer.jsp"%>