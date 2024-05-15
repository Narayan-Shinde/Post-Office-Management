<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
if(request.getParameter("pno")!=null){
	String pno=request.getParameter("pno");
	db.executeSql("Update parcel set Status=? where ParcelNo=?","Received",pno);
}
%>
<div class="col-8 offset-1">
<br/>
<h1>Parcel History</h1>
<table id="table1" class="table table-bordered">
<thead class="table-secondary">
<tr class="bg-primary">
<th>Parcel No</th>
<th>Parcel Date</th>
<th>Email Id</th>
<th>Parcel Source</th>
<th>Receiver Name</th>
<th>Receiver Address</th>
<th>Mobile No</th>
<th>Charges</th>
<th>Pay Mode</th>
<th>Status</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from parcel where Status=?","Pending");
int i=0;
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
<td><%=rs.getString(10)%></td>
<td>
<a href="#" onclick="updateDate(<%=rs.getString(1) %>)" class="btn btn-primary">Update</a>
</td>
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
function updateDate(pno){
	//var t=document.getElementById("t"+i);
	window.location="/postoffice/employee/parcellist.jsp?pno="+pno;
}
</script>