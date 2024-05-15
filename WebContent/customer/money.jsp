<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String trno="",trdate="",sender="",sendadd="",contact1="",recv="",recvadd="",contact2="",amount="",paymode="",btntext="Save";

// Get the user's email ID from the session
String emailID = (String) session.getAttribute("user");

// Retrieve the sender's details from the Account Detail table
ResultSet rs = db.getRows("Select * from AccountDetails where EmailID=?", emailID);

if (rs.next()) {
    sender = rs.getString("Name");
    sendadd = rs.getString("Address");
    contact1=rs.getString("Mobile");
}

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Submit")){
	recv=request.getParameter("txtrecv");
	recvadd=request.getParameter("txtrecvadd");
	contact2=request.getParameter("txtcontact2");
	amount=request.getParameter("txtamount");
	paymode=request.getParameter("txtmode");
	
	// Update the MoneyOrder table with the sender's details
	db.executeSql("Insert into MoneyOrder (SenderName,SenderAdd,ContactNo1,ReceiverName,ReceiverAdd,ContactNo,Amount,Status,PayMode,EmailID) values(?,?,?,?,?,?,?,?,?,?)",sender,sendadd,contact1,recv,recvadd,contact2,amount,"Pending",paymode,emailID);
	
	// Deduct the amount from the sender's account balance
	db.executeSql("Update AccountDetails set AcBalance = AcBalance - ? where EmailID = ?", amount, emailID);
	
	msg="Money order Request Sent Successfully...";
}	
}

%>
<div class="col-6 offset-3">
<br/>
<h3>Money Order Request::</h3>
<form method="post" id="form1">
<div class="form-group">
Sender Name
<input name="txtsender" id="txtsender" class="form-control" value="<%=sender%>" placeholder="Sender Name" readonly/>
</div>
<div class="form-group">
Sender Address
<input name="txtsendadd" name="txtsendadd" class="form-control" value="<%=sendadd%>" placeholder="Sender Address" readonly/>
</div>
<div class="form-group">
Sender Contact No
<input name="txtcontact1" name="txtcontact1" class="form-control" value="<%=contact1%>" placeholder="Sender Contact No" readonly/>
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
Amount
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