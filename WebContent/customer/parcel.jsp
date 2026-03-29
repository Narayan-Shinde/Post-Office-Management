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
<link rel="stylesheet" href="/postoffice/css/parcelorder.css">
<section class="order-section">
<div class="order-form-container">
<h3 class="order-form-title">Parcel Delivery Request:</h3>
<form method="post" id="orderForm">
<div class="order-form-group">
<label for="txtrecv" class="order-form-label">Source Name</label>
<input type="text" name="txtsource" id="txtsource" placeholder="Enter Source Name" class="order-form-control" required>
</div>
<div class="order-form-group">
<label for="txtrecv" class="order-form-label">Receiver Name</label>
<input type="text" name="txtrecv" id="txtrecv" placeholder="Enter Receiver Name" class="order-form-control" required>
</div>
<div class="order-form-group">
<label for="txtrecvadd" class="order-form-label">Receiver Address</label>
<textarea name="txtrecvadd" id="txtrecvadd" rows="4" placeholder="Enter Receiver Address" class="order-form-control" required></textarea>
</div>
<div class="order-form-group">
<label for="txtcontact2" class="order-form-label">Receiver Contact No</label>
<input type="text" name="txtcontact2" id="txtcontact2" placeholder="Receiver Contact No" class="order-form-control" required>
</div>
<div class="order-form-group">
<label for="txtamount" class="order-form-label">Charges</label>
<input type="text" name="txtamount" id="txtamount" placeholder="Enter Charges" class="order-form-control" required>
</div>
<div class="order-form-group">
<label for="txtmode" class="order-form-label">Pay Mode</label>
<select name="txtmode" id="txtmode" class="order-form-control" required>
<option value="Cash">Cash</option>
<option value="UPI">UPI</option>
</select>
</div>
<div class="order-form-actions">
<button type="submit" name="btnsave" value="Submit" class="order-btn order-btn-primary">Submit</button>
<a href="parcel.jsp" class="order-btn order-btn-secondary">Clear</a>
</div>
</form>
<div class="loading" id="loading">Submitting...</div>
</div>
</section>
<%@ include file="../footer.jsp"%>