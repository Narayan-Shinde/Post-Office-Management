<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/transactiontable.css">
<section>
<div class="moneyorder">
<h1>Transactions Log::</h1>
<table>
<thead>
<tr>
<th>TransNo</th>
<th>Name</th>
<th>EmailId</th>
<th>AcNo</th>
<th>TransDate</th>
<th>TranType</th>
<th>Amount</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Transaction where EmailID=?",session.getAttribute("user"));
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