<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="model.to.Employee_Attendance_TO"%>
<%@page import="java.sql.Date"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp" />
<%
    String employee_id = request.getParameter("employee_id") != null ? request.getParameter("employee_id").trim() : "";
    String attendance_date = request.getParameter("attendance_date") != null ? request.getParameter("attendance_date").trim() : "";
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Edit Employee Details</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form method="get">
                <div class="form-group">
                    <label for="employee_id">Enter Employee ID: </label>
                    <input type="text" name="employee_id" value="<%= employee_id%>" class="form-control" placeholder="Employee ID"
                           id="employee_id">
                </div>
                <div class="form-group">
                    <label for="attendance_date">Enter Attendance Date: </label>
                    <input type="date" name="attendance_date"  value="<%= attendance_date%>" class="form-control" 
                           id="attendance_date">
                </div> 
                <button name="action" type="submit" class="btn btn-primary btn-block">Display Employee Attendance</button>
            </form>
        </div>
    </div>
    <div class="row">        
        <div class="col-12">
            <br>
            <%        if (session.getAttribute("message") != null) {
                    String classname = "alert-success";
                    if (session.getAttribute("error") != null) {
                        session.removeAttribute("error");
                        classname = "alert-danger";
                    }
            %>
            <div class="alert <%= classname%>">
                <%= session.getAttribute("message").toString()%>
            </div>
            <%
                    session.removeAttribute("message");
                }
            %>
            <br>
            <%
                if (request.getParameter("action") != null) {
                    boolean all_valid = true;
                    String message = "";
                    Employee_Info_TO eit = null;
                    if (Validations.isEmpty(employee_id)) {
                        all_valid = false;
                        message += "Please Enter Some Value in Employee ID Box<br>";
                    } else if (!Validations.isNumber(employee_id)) {
                        all_valid = false;
                        message += "Please Enter Number in Employee ID Box<br>";
                    }
                    if (Validations.isEmpty(attendance_date)) {
                        all_valid = false;
                        message += "Please Choose Any Attendance Date<br>";
                    } else if (!Validations.isValidDate(attendance_date)) {
                        all_valid = false;
                        message += "Please Provide Valid Attendance Date<br>";
                    }
                    if (all_valid) {
                        int emp_id = Integer.parseInt(employee_id);
                        Date att_date = Date.valueOf(attendance_date);
                        Employee_Attendance_TO eat = new Employee_Attendance_DAO().getRecord(emp_id, att_date);
                        if (eat != null) {

            %>
            <form method="post" action="update_attendance.jsp">
                <div class="form-group">
                    <input type="hidden" name="attendance_id" value="<%= eat.getAttendance_id()%>"/>
                    Choose Present Status :
                    <%
                        String yes_status,no_status;
                        yes_status = eat.getPresent_status().equalsIgnoreCase("yes") ? "checked" : "";
                        no_status = eat.getPresent_status().equalsIgnoreCase("no") ? "checked" : "";
                    %>
                    <input type="radio" <%= yes_status %> name="present_status" value="yes" id="r1">
                    <label for="r1">Present</label>
                    <input type="radio" <%= no_status %> name="present_status" value="no" id="r2">
                    <label for="r2">Absent</label>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Update Employee Attendance</button>
            </form>
            <%                    } else {
                        all_valid = false;
                        message = "There is No Attendance of Given Employee on this Date. Please Confirm Employee ID or Attendance Date";
                    }
                }
            %>
            <%        if (!all_valid) {
                    String classname = "alert-danger";

            %>
            <div class="alert <%= classname%>">
                <%= message%>
            </div>
            <%

                    }
                }
            %>
        </div>
    </div>
    <br>
</div>
<jsp:include page="footer.jsp"/>