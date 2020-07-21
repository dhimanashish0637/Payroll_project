<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String attendance_date = request.getParameter("attendance_date") != null ? request.getParameter("attendance_date").trim() : "";
%>
<!-- Hero Section-->
<section class="bg-light">    
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Mark Employee Attendance Details</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form method="get">
                <div class="form-group">
                    <label for="attendance_date">Enter Attendance Date: </label>
                    <input type="date" name="attendance_date"  value="<%= attendance_date%>" class="form-control" 
                           id="attendance_date">
                </div>                         
                <button name="action" type="submit" class="btn btn-primary btn-block">Display Employee For Attendance</button>
            </form>
        </div>
    </div>

    <div class="row mt-4">        
        <div class="col-12 table-responsive">
            <%
                String message = "There is No Employee For Attendance";
                boolean message_display = true;
                List<Employee_Info_TO> employees = null;
                if (request.getParameter("action") != null) {
                    if (Validations.isEmpty(attendance_date)) {
                        message = "You have not Selected Any Date, So No Employee Attendance Data will shown";
                    } else if (Validations.isValidDate(attendance_date)) {
                        java.sql.Date date = java.sql.Date.valueOf(attendance_date);
                        Calendar c1 = Calendar.getInstance();
                        c1.setTime(date);
                        int dw = c1.get(Calendar.DAY_OF_WEEK);
                        if (dw == Calendar.SATURDAY || dw == Calendar.SUNDAY) {
                            message = "This is Official Weekend. So There is no Attendance for Employees";
                        } else {
                            employees = new Employee_Info_DAO().getAllRecord(date);
                            if (employees != null && employees.size() > 0) {
                                message_display = false;
                            }
                        }
                    } else {
                        message = "Please Provide a Valid Date";
                    }
                }
            %>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th> Employee ID </th>
                        <th> Employee Name </th>
                        <th> Employee Category </th>
                        <th> Attendance Status </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (message_display) {
                    %>
                    <tr>
                        <td colspan="4" class="text-center"><%= message%></td>
                    </tr>
                    <%
                    } else {
                    %>
                <form method="post" action="insert_employee_attendance.jsp">
                    <%
                        int i = 1;
                        String id = "";
                        for (Employee_Info_TO eit : employees) {
                            id = "dd" + i;
                            i++;
                            out.println("<tr>");
                            out.println("<td>" + eit.getEmployee_id() + "</td>");
                            out.println("<td>" + eit.getEmployee_name() + "</td>");
                            out.println("<td>" + eit.getCategory_name() + "</td>");
                            out.println("<td>");
                            out.println("<div class=\"custom-control custom-checkbox\">");
                            out.println("<input class=\"custom-control-input\" type=\"checkbox\" checked name=\"ids\" value=\"" + eit.getEmployee_id());
                            out.println("\" id=\"" + id + "\"><label class=\"custom-control-label\" for=\"" + id + "\">Present</label>");
                            out.println("</div>");

                            out.println("</td>");
                            out.println("</tr>");
                        }
                    %>
                    <tr><td colspan="4">
                            <input type="hidden" name="attendance_date" value="<%= attendance_date%>"/>
                            <button type="submit" class="btn btn-primary btn-block">Mark Attendance</button>
                        </td></tr>
                </form>
                <%
                    }
                %>
                </tbody>
            </table>
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
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>