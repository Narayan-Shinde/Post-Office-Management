<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
if(request.getParameter("trno") != null){
    String trno = request.getParameter("trno");
    db.executeSql("UPDATE Transaction SET Status=? WHERE TransNo=?", "Received", trno);
    msg = "Transaction Updated Successfully!";
}
%>

<link rel="stylesheet" href="/postoffice/css/moneyordertable.css">
<section>
<div class="moneyorder">
<h1>Pending Transactions</h1>
<table>
<thead>
<tr>
<th>TransNo</th>
<th>Name</th>
<th>AcNo</th>
<th>TransDate</th>
<th>TranType</th>
<th>Amount</th>
<th>Status</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs = db.getRows("SELECT * FROM Transaction WHERE Status='Pending' ORDER BY TrDate");
int i = 0;
while(rs.next()){
%>
<tr>
<td><%=rs.getString("TransNo") %></td>
<td><%=rs.getString("Name") %></td>
<td><%=rs.getString("AcNo") %></td>
<td><%=rs.getString("TrDate") %></td>
<td><%=rs.getString("TrType") %></td>
<td><%=rs.getString("Amount") %></td>
<td><%=rs.getString("Status") %></td>
<td>
    <a href="#" onclick="updateTransaction('<%=rs.getString("TransNo")%>')" class="btn btn-primary">Update</a>
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
function updateTransaction(trno){
    window.location="/postoffice/employee/pendingtransactionlist.jsp?trno="+trno;
}
</script>
