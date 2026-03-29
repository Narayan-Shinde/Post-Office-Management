<%@page import="java.time.LocalDate"%>

<footer class="bg-dark text-light mt-5">
    <div class="container-fluid text-center p-3">
        <p class="mb-1">
            &copy; <%=LocalDate.now().getYear()%> ERP Accounting & GST Management System
        </p>
        <small>
            Designed & Developed by Narayan Shinde
        </small>
    </div>
</footer>

<!-- JS Files -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<%
if (msg != null && !msg.equals("")) {
%>
<script>
swal("ERP GST System", "<%=msg%>", "<%=icon%>");
</script>
<%
}
%>

</body>
</html>
