<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String trno="",source="",recv="",recvadd="",contact2="",amount="",paymode="",btntext="Save";
String emailID = (String) session.getAttribute("user");

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Submit")){
	source=request.getParameter("txtsource");
	recv=request.getParameter("txtrecv");
	recvadd=request.getParameter("txtrecvadd");
	contact2=request.getParameter("txtcontact2");
	amount=request.getParameter("txtamount");
	paymode=request.getParameter("txtmode");
	
	db.executeSql("Insert into Parcel (EmailID,ParcelSource,ReceiverName,ReceiverAddress,MobileNo,Charges,PayMode,Status) values(?,?,?,?,?,?,?,?)", session.getAttribute("user"),source,recv,recvadd,contact2,amount,paymode,"Pending");
	
    db.executeSql("Update AccountDetails set AcBalance = AcBalance - ? where EmailID = ?", amount, emailID);
	
	msg="Parcel Request Received Successfully...";
}	
}

%>
<div class="col-6 offset-3">
<br/>
<h3>Parcel Delivery Request::</h3>
<form method="post" id="form1">
<div class="form-group">
Source
<input name="txtsource" id="txtsource" class="form-control" placeholder="Source Name"/>
</div>
<div class="form-group">
Receiver Name
<input name="txtrecv" id="txtrecv" class="form-control" placeholder="Receiver Name"/>
</div>
<div class="form-group">
Receiver Address
<input name="txtrecvadd" name="txtrecvadd" class="form-control" placeholder="Receiver Address"/>
</div>
<div class="form-group">
Receiver Contact No
<input name="txtcontact2" name="txtcontact2" class="form-control" placeholder="Receiver Contact No"/>
</div>
<div class="form-group">
Charges
<input name="txtamount" name="txtamount" class="form-control" placeholder="Amount"/>
</div>
<div class="form-group">
Pay Mode
<select id="txtmode" name="txtmode" class="form-select">
<option value="Cash">Cash</option>
<option value="UPI">UPI</option>
</select>
</div>
<br/>
<br/>
<br/>
<input type="submit" name="btnsave" value="Submit" class="btn btn-primary"/>
<a href="parcel.jsp" class="btn btn-secondary">Clear</a>
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