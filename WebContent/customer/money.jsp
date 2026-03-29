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
<link rel="stylesheet" href="/postoffice/css/money.css">
<section class="order-section">
    <div class="order-form-container">
      <h3 class="order-form-title">Money Order Request:</h3>
      <form method="post" id="orderForm">
        <div class="order-form-group">
          <label for="txtsender" class="order-form-label">Sender Name</label>
          <input type="text" name="txtsender" id="txtsender" value="<%=sender%>" placeholder="Sender Name" readonly class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtsendadd" class="order-form-label">Sender Address</label>
          <input type="text" name="txtsendadd" id="txtsendadd" value="<%=sendadd%>" placeholder="Sender Address" readonly class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtcontact1" class="order-form-label">Sender Contact No</label>
          <input type="text" name="txtcontact1" id="txtcontact1" value="<%=contact1%>" placeholder="Sender Contact No" readonly class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtrecv" class="order-form-label">Receiver Name</label>
          <input type="text" name="txtrecv" id="txtrecv" placeholder="Receiver Name" class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtrecvadd" class="order-form-label">Receiver Address</label>
          <textarea name="txtrecvadd" id="txtrecvadd" rows="4" placeholder="Receiver Address" class="order-form-control" required></textarea>
        </div>
        <div class="order-form-group">
          <label for="txtcontact2" class="order-form-label">Receiver Contact No</label>
          <input type="text" name="txtcontact2" id="txtcontact2" placeholder="Receiver Contact No" class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtamount" class="order-form-label">Amount</label>
          <input type="text" name="txtamount" id="txtamount" placeholder="Amount" class="order-form-control" required>
        </div>
        <div class="order-form-group">
          <label for="txtmode" class="order-form-label">Pay Mode</label>
          <select name="txtmode" id="txtmode" class="order-form-control" required>
            <option value="Cash">Cash</option>
            <option value="UPI">UPI</option>
          </select>
        </div>
        <div class="order-form-actions">
          <!-- Submit Button styled as a link with hover effect -->
          <button type="submit" name="btnsave" value="Submit" class="order-btn order-btn-primary">Submit</button>
          
          <!-- Clear Button styled as an anchor with hover effect -->
          <a href="money.jsp" class="order-btn order-btn-secondary">Clear</a>
        </div>
      </form>
      <div class="loading" id="loading">Submitting...</div>
    </div>
</section>
<%@ include file="../footer.jsp"%>