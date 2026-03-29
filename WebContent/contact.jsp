<%@page import="java.net.URLEncoder"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@ include file="header.jsp"%>

<%
if(request.getParameter("btnsubmit")!=null) 
{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String mobile=request.getParameter("mobile");
	String message = request.getParameter("message");
	db.executeSql("Insert into contact (name,email,mobile,message) values(?,?,?,?)", name,email,mobile,message);
	msg="Thanks for your Contact us!";
}
%>
 <link rel="stylesheet" href="css/contactus.css">
<section>
    <div class="form-container">
        <div class="side-container">
            <span><b>Contact Us</b></span>
            <div class="body-title">
                Get In Touch With Us
            </div>
            <div class="body-desc">
                Send us your message and we will response to you very soon.
                <br>
                Office days/hours: Mon-Sat, 9am - 5pm PST.
            </div>
            <div class="home-cont">
                <img src="images/home.png" alt="Home Address">
                <span><b>Our Location:</b> AT Post :-karad, Tal:-Karad, Dist:-Satara. Pin:-415 110</span>
            </div>
            <div class="phone-cont">
                <img src="images/phone.png" alt="Contact Phone">
                <span><b>Phone Number:</b> (+91)7744872518</span>
                <span><b>Phone Number:</b> (+91)9373421623</span>
            </div>
            <div class="mail-cont">
                <img src="images/email.png" alt="Contact Email">
                <span><b>Email:</b>akashsinh789@gmail.com<br><b>Email:</b>shindenarayan572003@gmail.com</span>
            </div>
           
        </div>
        <div class="container">
            <form id="contact-form">
                <br>
                <input type="text" name="name" id="name" placeholder="Your Name" required>
                <input type="email" name="email" id="email" placeholder="Your Email" required>
                <input type="text" name="mobile" id="mobile" placeholder="Your Mobile Number" required>
                <textarea name="message" id="message" cols="30" rows="10" placeholder="Type your message here" required></textarea>
                <input type="submit" name="btnsubmit" value="Send Message" class="primary-btn">
            </form>
        </div>
    </div>
</section>
<%@ include file="footer.jsp" %>