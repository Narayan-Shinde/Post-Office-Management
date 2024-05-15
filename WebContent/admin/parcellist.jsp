<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-8 offset-1">
<br/>

<h1>Parcels List/Status</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>ParcelNo</th>
<th>ParcelDate</th>
<th>EmailID</th>
<th>Source</th>
<th>Receiver</th>
<th>ReceiverAdd</th>
<th>MobileNo</th>
<th>Charges</th>
<th>PayMode</th>
<th>Status</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Parcel");
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