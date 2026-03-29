<%@ include file="../header.jsp"%>
<%
String amount = request.getParameter("amount");
String receiver = request.getParameter("receiver");
String upiID = "receiver@upi";  // Replace with the actual UPI ID

// Create the UPI deep link
String deepLink = "upi://pay?pa=" + upiID + 
                 "&pn=" + java.net.URLEncoder.encode(receiver, "UTF-8") + 
                 "&am=" + amount + 
                 "&cu=INR" + 
                 "&tn=" + java.net.URLEncoder.encode("Money Order Payment", "UTF-8");
%>

<link rel="stylesheet" href="/postoffice/css/payment.css">
<section class="payment-section">
    <div class="payment-container">
        <h3 class="payment-title">UPI Payment</h3>
        <p>Amount to be Paid: ₹<%= amount %></p>
        
        <!-- Display the UPI link -->
        <p>UPI Payment Link:</p>
        <a href="<%= deepLink %>" target="_blank" class="payment-link">Click Here to Pay via UPI</a>

        <!-- QR Code for mobile scanning -->
        <p>Or scan the QR code below:</p>
        <img src="https://chart.googleapis.com/chart?chs=250x250&cht=qr&chl=<%= java.net.URLEncoder.encode(deepLink, "UTF-8") %>&choe=UTF-8" alt="UPI QR Code">

        <p>Use a UPI app to scan and make the payment.</p>
    </div>
</section>
<%@ include file="../footer.jsp"%>
