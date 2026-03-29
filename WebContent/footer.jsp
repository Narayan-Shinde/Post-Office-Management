<%@page import="java.time.LocalDate"%>
<br>
<br>
<nav class="navbar navbar-expand-lg bg-secondary fixed-bottom" style="margin-top:200px" data-bs-theme="dark">
  <div class="container-fluid">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
           <a class="nav-link active" href="#">
              <span class="footer">
               <marquee scrollamount="20"> &copy; <%=LocalDate.now().getYear() %> Karad Post Office |All Rights Reserved. Design by Narayan Shinde</marquee>
              </span>
           </a>
        </li>        
      </ul>
   </div>
</nav>
<!--
<style>
.scrolling-text {
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    animation: moveLeft 5s linear infinite;
    color: #fff; 
    font-size: 20px;
}

@keyframes moveLeft {
    from { transform: translateX(100%); }
    to { transform: translateX(-100%); }
}
</style>
-->
<style>
.footer {
      background-color: #f50057;
      color: #ffffff;
      text-align: center;
      padding: 10px;
      position: fixed;
      left: 0;
      bottom: 0;
      width: 100%;
      }
</style>
<script src="/postoffice/js/sweetalert.min.js"></script>
<script src="/postoffice/js/jquery-3.6.0.js"></script>
<script src="/postoffice/js/datatables.js"></script>
<script src="/postoffice/js/bootstrap.js"></script>
<script src="/postoffice/js/jquery.validate.js"></script>
<script src="/postoffice/js/additional-methods.js"></script>

<%
if (msg != null && !msg.equals("")) {
%>
<script>
swal("Post Office Management", "<%=msg%>", "<%=icon%>");
</script>
<%
}
%>

</body>
</html>