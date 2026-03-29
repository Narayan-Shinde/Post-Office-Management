<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
if(request.getParameter("billno") != null){
    String billno = request.getParameter("billno");
    db.executeSql("UPDATE Bills SET Status=? WHERE BillNo=?", "Paid", billno);
    msg = "Bill Updated Successfully!";
}
%>

<link rel="stylesheet" href="/postoffice/css/billtable.css">
<section>
<div class="moneyorder">
<h1>Pending Bills List</h1>
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
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs = db.getRows("SELECT * FROM Bills WHERE Status='Pending' ORDER BY PaidDate");
int i = 0;
while(rs.next()){
%>
<tr>
<td><%=rs.getString("BillNo") %></td>
<td><%=rs.getString("BillType") %></td>
<td><%=rs.getString("EmailId") %></td>
<td><%=rs.getString("AcNo") %></td>
<td><%=rs.getString("Amount") %></td>
<td><%=rs.getString("PaidDate") %></td>
<td><%=rs.getString("Status") %></td>
<td>
    <a href="#" onclick="updateBill('<%=rs.getString("BillNo")%>')" class="btn btn-primary">Update</a>
</td>
</tr>
<%
i++;
}
%>
</tbody>
</table>
</div>
</section>

<%@ include file="../footer.jsp"%>

<script>
function updateBill(billno){
    window.location="/postoffice/employee/pendingbilllist.jsp?billno="+billno;
}
</script>
