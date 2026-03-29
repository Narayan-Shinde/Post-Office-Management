<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/postoffice/css/transactiontable.css">
<section>
<div class="moneyorder">
<h1>Transactions Log</h1>
<table>
<thead>
<tr>
<th>TransNo</th>
<th>Name</th>
<th>Email Id</th>
<th>AcNo</th>
<th>TransDate</th>
<th>TranType</th>
<th>Amount</th>
</tr>
</thead>
<tbody>
<%
String sql="select * from transaction order by TrDate";
if(request.getParameter("id")!=null){
	sql="select * from transaction where AcNo="+request.getParameter("id")+" order by TrDate";
}
ResultSet rs=db.getRows(sql);
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
