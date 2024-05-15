<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String billno="",billdate="",AcNo="",emailid="",amt="",type="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Submit")){
	type=request.getParameter("txttype");
	billno=request.getParameter("txtbill");
	billdate=request.getParameter("txtbilldate");
	AcNo=request.getParameter("txtacno");	
	emailid=request.getParameter("txtemail");
	amt=request.getParameter("txtamt");
	
	ResultSet rs=db.getRows("select ACBalance from accountdetails where AcNo=?",AcNo );
	boolean flag=false;
	if(rs.next()){
		if(rs.getDouble(1)>1000){
			flag=true;
		}
	}
	if(flag){
	db.executeSql("Insert into Bills (BillType,BillNo,BillDate,AcNo,EmailId,Amount) values(?,?,?,?,?,?)", type,billno,billdate,AcNo,emailid,amt);
	db.executeSql("Update AccountDetails set AcBalance=AcBalance-? where AcNo=?",amt,AcNo);
	msg="Transaction Done Successfully...";
	}else
	{
		msg="Transaction Failed because of insufficient balance...";
	}
}	
}

%>
<div class="col-6 offset-3">
<br/>
<h3>Bill Payment Form::</h3>
<form method="post" id="form1">
<div class="form-group">
Bill Type
<select id="txttype" name="txttype" class="form-select">
<option value="Electricity Bill">Electricity Bill</option>
<option value="Telephone Bill">Telephone Bill</option>
</select>
</div>
<div class="form-group">
Bill No
<input name="txtbill" class="form-control" placeholder="Bill No"/>
</div>
<div class="form-group">
Bill Date
<input name="txtbilldate" type="date" class="form-control" placeholder="Bill Date"/>
</div>
<div class="form-group">
Account Holder
<select name="txtacno" id="txtacno" class="form-select">
<option value="">-- Select Account --</option>
<%
ResultSet rs=db.getRows("select * from accountdetails");
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>" <%=emailid.equals(rs.getString(1))?"selected":"" %>><%=rs.getString(1)%> | <%=rs.getString(3)%> | <%=rs.getString(4)%></option>
<%
}
%>
</select>
</div>
<div class="form-group">
Email Id
<input name="txtemail" class="form-control" placeholder="emailid"/>
</div>
<div class="form-group">
Bill Amount
<input name="txtamt" class="form-control" placeholder="Trans Amount"/>
</div>
<br/>
<input type="submit" name="btnsave" value="Submit" class="btn btn-primary"/>
<a href="bill.jsp" class="btn btn-secondary">Clear</a>
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