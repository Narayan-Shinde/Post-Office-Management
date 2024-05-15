<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String type="",name="",emailid="",actype="",acbalance="",status="",mobile="",address="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Submit")){
	name=request.getParameter("txtname");
	emailid=request.getParameter("txtemailid");
	actype=request.getParameter("txttype");
	acbalance=request.getParameter("txtacbalance");
	status=request.getParameter("txtstatus");
	mobile=request.getParameter("txtmobile");
	address=request.getParameter("txtaddress");
	
	db.executeSql("Insert into accountdetails (Name,EmailID,AcType,AcBalance,Status,Mobile,Address) values(?,?,?,?,?,?,?)",name,emailid,actype,acbalance,status,mobile,address);
	msg="Account Opening Request Sent Successfully...";
}	
}

%>
<div class="col-6 offset-3">
<br/>
<h3>Account Opening Form::</h3>
<form method="post" id="form1">
<div class="form-group">
Name
<input type="text" name="txtname" id="txtname" class="form-control" placeholder="Enter Name"/>
</div>
<div class="form-group">
Email Id
<input type="text" name="txtemailid" id="txtemailid" class="form-control" placeholder="Enter Username"/>
</div>
<div class="form-group">
Account Type
<select id="txttype" name="txttype" class="form-select">
<option value="Saving">Saving</option>
<option value="Fixed">Fixed</option>
</select>
</div>
<br/>
<br/>
<div class="form-group">
Account Balance
<input type="text" name="txtacbalance" id="txtacbalance" class="form-control" placeholder="Account Balance"/>
</div>
<div class="form-group">
Status
<input type="text" name="txtstatus" id="txtstatus" class="form-control" placeholder="Enter Status"/>
</div>
<div class="form-group">
Mobile No
<input type="text" name="txtmobile" id="txtmobile" class="form-control" placeholder="Enter Mobile No"/>
</div>
<div class="form-group">
Address
<textarea name="txtaddress" id="txtaddress" class="form-control" placeholder="Enter Address"></textarea>
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