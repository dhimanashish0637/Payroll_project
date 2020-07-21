<%@page import="java.util.Date" %>
<%@page import="java.util.Calendar" %>
<!-- Footer-->
<div class="py-5 bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 mb-4 mb-lg-0">
                <h5>Contact Us</h5>
                <ul class="contact-info list-unstyled">
                    <li><a href="mailto:admin@payroll.com" class="text-dark">Mail to Admin</a></li>
                    <li><a href="tel:123456789" class="text-dark">+00 123 456 789</a></li>
                </ul>
                <p class="text-muted">You can contact to administrator for further services</p>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5>Salary Report</h5>
                <ul class="links list-unstyled">
                    <li> <a href="generatesalary.jsp" class="text-muted">Generate Employee Salary</a></li>
                    <li> <a href="viewuser.jsp" class="text-muted">View Users</a></li>
                </ul>
            </div>
            <div class="col-lg-4 col-md-6">
                <h5>Attendance Operation</h5>
                <ul class="links list-unstyled">
                    <li> <a href="markattendance.jsp" class="text-muted">Mark Attendance</a></li>
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