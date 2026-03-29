<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String name="", acno="", amt="", type="", btntext="Save";
String emailID = (String) session.getAttribute("user");

if (request.getParameter("btnsave") != null) {
    if (request.getParameter("btnsave").equals("Submit")) {
        name = request.getParameter("txtname");
        acno = request.getParameter("txtacno");
        type = request.getParameter("txttype");
        amt = request.getParameter("txtamt");

        db.executeSql("Insert into Transaction (Name,EmailId,AcNo,TrType,Amount,Status) values(?,?,?,?,?,?)", name, emailID, acno, type, amt, "Pending");
        
        if (type.equals("Deposit")) {
            db.executeSql("Update AccountDetails set AcBalance = AcBalance + ? where AcNo = ?", amt, acno);
            msg = "Deposit Successful...";
        } else if (type.equals("Withdraw")) {
            ResultSet rs = db.getRows("select AcBalance from AccountDetails where AcNo = ? AND EmailID = ?", acno, emailID);
            if (rs.next()) {
                if (rs.getInt(1) >= Integer.parseInt(amt)) {
                    db.executeSql("Update AccountDetails set AcBalance = AcBalance - ? where AcNo = ?", amt, acno);
                    msg = "Withdrawal Successful...";
                } else {
                    icon = "error";
                    msg = "Insufficient Balance...";
                }
            }
        }
    }
}
%>
<link rel="stylesheet" href="/postoffice/css/trans.css">
<section class="order-section">
    <div class="order-form-container">
        <h3 class="order-form-title">Transaction Form:</h3>
        <form method="post" id="orderForm">
            <div class="order-form-group">
                <label for="txtname" class="order-form-label">Name</label>
                <input type="text" name="txtname" id="txtname" placeholder="Enter Name" class="order-form-control" required>
            </div>
            <div class="order-form-group">
                <label for="txtemail" class="order-form-label">Email ID</label>
                <input type="text" name="txtemail" id="txtemail" value="<%= emailID %>" class="order-form-control" readonly>
            </div>
            <div class="order-form-group">
                <label for="txtacno" class="order-form-label">Account Holder</label>
                <select name="txtacno" id="txtacno" class="order-form-control" required>
                    <option value="">-- Select Account --</option>
                    <%
                    ResultSet rs = db.getRows("select AcNo, Name from AccountDetails where EmailID = ?", emailID);
                    while (rs.next()) {
                    %>
                    <option value="<%=rs.getString(1)%>" <%=acno.equals(rs.getString(1)) ? "selected" : ""%>>
                        <%=rs.getString(1)%> | <%=rs.getString(2)%>
                    </option>
                    <%
                    }
                    %>
                </select>
            </div>
            <div class="order-form-group">
                <label for="txttype" class="order-form-label">Transaction Type</label>
                <select name="txttype" id="txttype" class="order-form-control" required>
                    <option value="Deposit">Deposit</option>
                    <option value="Withdraw">Withdraw</option>
                </select>
            </div>
            <div class="order-form-group">
                <label for="txtamt" class="order-form-label">Transaction Amount</label>
                <input type="text" name="txtamt" id="txtamt" placeholder="Enter Amount" class="order-form-control" required>
            </div>
            <div class="order-form-actions">
                <button type="submit" name="btnsave" value="Submit" class="order-btn order-btn-primary">Submit</button>
                <a href="trans.jsp" class="order-btn order-btn-secondary">Clear</a>
            </div>
        </form>
        <div class="loading" id="loading">Submitting...</div>
    </div>
</section>
<%@ include file="../footer.jsp"%>
