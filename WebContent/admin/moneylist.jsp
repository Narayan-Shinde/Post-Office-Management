<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-8 offset-2">
<br/>
<h1>Money Order History</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>TrNo</th>
<th>TrDate</th>
<th>Sender Name</th>
<th>Sender Address</th>
<th>Contact No1</th>
<th>Receiver Name</th>
<th>Receiver Address</th>
<th>Contact No2</th>
<th>Amount</th>
<th>Receipt Date</th>
<th>PayMode</th>
<th>Status</th>
<th>Email Id</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from MoneyOrder order by trndate desc");
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

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>