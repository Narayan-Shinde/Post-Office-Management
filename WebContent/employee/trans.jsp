<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String name="",email="",acno="",amt="",type="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Submit")){
	name=request.getParameter("txtname");
	email=request.getParameter("txtemail");
	acno=request.getParameter("txtacno");
	type=request.getParameter("txttype");
	amt=request.getParameter("txtamt");
	
	db.executeSql("Insert into Transaction (Name,EmailId,AcNo,TrType,Amount) values(?,?,?,?,?)",name,email, acno,type,amt);
	if(type.equals("Deposit")){
		// Update the account balance by adding the deposit amount
		db.executeSql("Update AccountDetails set AcBalance=AcBalance+? where AcNo=?",amt,acno);
		msg="Deposit Successfully...";
	}else if(type.equals("Withdraw")){
		// Check if the withdrawal amount is less than the account balance
		ResultSet rs=db.getRows("select AcBalance from AccountDetails where AcNo=?",acno);
		if(rs.next()){
			if(rs.getInt(1)>=Integer.parseInt(amt)){
				// Update the account balance by subtracting the withdrawal amount
				db.executeSql("Update AccountDetails set AcBalance=AcBalance-? where AcNo=?",amt,acno);
				msg="Withdrawal Successfully...";
			}else{
				msg="Insufficient Balance...";
			}
		}
	}
}	
}

%>
<div class="col-6 offset-3">
<br/>
<h3>Transaction Form::</h3>
<form method="post" id="form1">
<div class="form-group">
Name
<input name="txtname" type="text" class="form-control" placeholder="Name" autofocus/>
</div>
<div class="form-group">
Email Id
<input name="txtemail" type="text" class="form-control" placeholder="Email" autofocus/>
</div>
<div class="form-group">
Account Holder
<select name="txtacno" id="txtacno" class="form-select">
<option value="">-- Select Account --</option>
<%
ResultSet rs=db.getRows("select * from AccountDetails");
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>" <%=acno.equals(rs.getString(1))?"selected":"" %>><%=rs.getString(1)%> | <%=rs.getString(3)%> | <%=rs.getString(4)%></option>
<%
}
%>
</select>
</div>
<div class="form-group">
Trans Type
<select id="txttype" name="txttype" class="form-select">
<option value="Deposit">Deposit</option>
<option value="Withdraw">Withdraw</option>
</select>
</div>
<br/>
<br/>
<div class="form-group">
Trans Amount
<input name="txtamt" class="form-control" placeholder="Trans Amount"/>
</div>
<br/>
<input type="submit" name="btnsave" value="Submit" class="btn btn-primary"/>
<a href="money.jsp" class="btn btn-secondary">Clear</a>
</form>
<br/>
<br/>

</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>