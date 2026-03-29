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
<link rel="stylesheet" href="/postoffice/css/account.css">
<section class="account-opening-section">
    <div class="form-container">
        <h1>Account Opening Form</h1>
        <form method="post" id="form1">
            <div class="row">
                <div class="column">
                    <p>Name</p>
                    <input type="text" name="txtname" id="txtname" class="form-contro" placeholder="Enter Name" required/>
                </div>
                <div class="column">
                    <p>Email Id</p>
                    <input type="text" name="txtemailid" id="txtemailid" class="form-contro" placeholder="Enter Email Id" required/>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <p>Account Type</p>
                    <select id="txttype" name="txttype" class="form-select" required>
                        <option value="Saving">Saving</option>
                        <option value="Fixed">Fixed</option>
                    </select>
                </div>
                <div class="column">
                    <p>Account Balance</p>
                    <input type="text" name="txtacbalance" id="txtacbalance" class="form-contro" placeholder="Account Balance" required/>
                </div>
            </div>
            <div class="row">
                <div class="column">
                    <p>Status</p>
                    <input type="text" name="txtstatus" id="txtstatus" class="form-contro" placeholder="Enter Status" required/>
                </div>
                <div class="column">
                    <p>Mobile No</p>
                    <input type="text" name="txtmobile" id="txtmobile" class="form-contro" placeholder="Enter Mobile No" required/>
                </div>
            </div>
            <div class="row">
                <p>Address</p>
                <textarea name="txtaddress" id="txtaddress" class="form-contro" placeholder="Enter Address" required></textarea>
            </div>
            <div class="row buttons">
                <button type="submit" name="btnsave" value="Submit">Submit</button>
                <a href="account.jsp" class="clear-btn">Clear</a>
            </div>
        </form>
    </div>
</section>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>