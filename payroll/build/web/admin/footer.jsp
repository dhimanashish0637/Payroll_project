<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<!-- Footer-->
<div class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h5>Employee Operations</h5>
                <ul class="contact-info list-unstyled">
                    <li> <a href="editemployee.jsp" class="text-muted">Edit Employee</a></li>
                    <li> <a href="deleteemployee.jsp" class="text-muted">Delete Employee</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5>User Operations</h5>
                <ul class="links list-unstyled">
                    <li> <a href="adduser.jsp" class="text-muted">Add New User</a></li>
                    <li> <a href="viewuser.jsp" class="text-muted">View Users</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5>Edit Operation</h5>
                <ul class="links list-unstyled">                    
                    <li> <a href="editattendance.jsp" class="text-muted">Edit Employee Attendance</a></li>                    
                    <li> <a href="editwages.jsp" class="text-muted">Edit Salary Wages</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<%
    Calendar cal = Calendar.getInstance();
    int current_year = cal.get(Calendar.YEAR);
%>
<div class="py-3 bg-dark text-white">
    <div class="container">
        <div class="row">
            <div class="col-md-7 text-center text-md-left">
                <p class="mb-md-0">&copy; <%= current_year%> Payroll System. All rights reserved. </p>
            </div>
            <div class="col-md-5 text-center text-md-right">
                <p class="mb-0">Template By Me </p>
            </div>
        </div>
    </div>
</div>
<!-- JavaScript files-->
<script src="js/jquery.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/svgembedder.min.js"></script>
</body>

</html>