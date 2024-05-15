<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-8 offset-2">
<br/>
<h1>Parcel Delivery History</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>Parcel No</th>
<th>Parcel Date</th>
<th>Email ID</th>
<th>Parcel Source</th>
<th>Receiver Name</th>
<th>Receiver Address</th>
<th>Mobile No</th>
<th>Charges</th>
<th>PayMode</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from parcel where EmailID=?",session.getAttribute("user"));
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