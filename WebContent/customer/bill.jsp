<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String AcNo="", amt="", type="", btntext="Save";
String emailID = (String) session.getAttribute("user");

if (request.getParameter("btnsave") != null) {
    if (request.getParameter("btnsave").equals("Submit")) {
        type = request.getParameter("txttype");
        AcNo = request.getParameter("txtacno");
        amt = request.getParameter("txtamt");
        
        ResultSet rs = db.getRows("select AcBalance from AccountDetails where AcNo = ? AND EmailID = ?", AcNo, emailID);
        boolean flag = false;
        if (rs.next()) {
            if (rs.getDouble(1) > 1000) {
                flag = true;
            }
        }
        
        if (flag) {
            db.executeSql("Insert into Bills (BillType, EmailId, AcNo, Amount, Status) values(?,?,?,?,?)", type, emailID, AcNo, amt, "Pending");
            db.executeSql("Update AccountDetails set AcBalance = AcBalance - ? where AcNo = ?", amt, AcNo);
            msg = "Bill Payment Successful...";
        } else {
            icon = "error";
            msg = "Transaction Failed due to insufficient balance...";
        }
    }
}
%>
<link rel="stylesheet" href="/postoffice/css/billpayment.css">
<section class="order-section">
    <div class="order-form-container">
        <h3 class="order-form-title">Bill Payment Form:</h3>
        <form method="post" id="orderForm">
            <div class="order-form-group">
                <label for="txttype" class="order-form-label">Pay Mode</label>
                <select name="txttype" id="txttype" class="order-form-control" required>
                    <option value="Electricity Bill">Electricity Bill</option>
                    <option value="Telephone Bill">Telephone Bill</option>
                </select>
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
                    <option value="<%=rs.getString(1)%>" <%=AcNo.equals(rs.getString(1)) ? "selected" : ""%>>
                        <%=rs.getString(1)%> | <%=rs.getString(2)%>
                    </option>
                    <%
                    }
                    %>
                </select>
            </div>
            <div class="order-form-group">
                <label for="txtamt" class="order-form-label">Bill Amount</label>
                <input type="text" name="txtamt" id="txtamt" placeholder="Enter Amount" class="order-form-control" required>
            </div>
            <div class="order-form-actions">
                <button type="submit" name="btnsave" value="Submit" class="order-btn order-btn-primary">Submit</button>
                <a href="bill.jsp" class="order-btn order-btn-secondary">Clear</a>
            </div>
        </form>
        <div class="loading" id="loading">Submitting...</div>
    </div>
</section>
<%@ include file="../footer.jsp"%>
