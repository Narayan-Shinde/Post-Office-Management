<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-8 offset-2">
<br/>
<h1>Paid Bills List/History</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>BillType</th>
<th>BillNo</th>
<th>BillDate</th>
<th>PaidDate</th>
<th>Amount</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from bills");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
<td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td>
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