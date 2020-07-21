<%@page import="model.to.Employee_Salary_TO"%>
<%@page import="model.dao.Employee_Salary_DAO"%>
<%@page import="utilities.Operation"%>
<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="utilities.MonthNames"%>
<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Calendar"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:include page="header.jsp"/>
<%
    String month_name = request.getParameter("month_name") != null ? request.getParameter("month_name").trim() : "";
    String year = request.getParameter("year") != null ? request.getParameter("year").trim() : "";
%>
<!-- Hero Section-->
<section class="bg-light">    
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Generate Employee Salary</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form method="get">
                <div class="form-group">
                    <label for="month_name">Choose Month Name: </label>
                    <select name="month_name" class="form-control" id="month_name">
                        <option value="">Choose Any Month</option>
                        <%
                            MonthNames[] months = MonthNames.values();
                            for (MonthNames month : months) {
                                String name = month.toString();
                                String status = "";
                                if (name.equals(month_name)) {
                                    status = "selected";
                                }
                                out.println("<option " + status + " value=\"" + name + "\">");
                                out.println(name + "</option>");
                            }
                        %>
                    </select>
                </div> 
                <div class="form-group">
                    <label for="year">Choose Year: </label>
                    <select name="year" class="form-control" id="year">
                        <option value="">Choose Any Year</option>
                        <%
                            Calendar cals = Calendar.getInstance();
                            int current_year = cals.get(Calendar.YEAR);
                            for (int yr = current_year; yr >= 2019; yr--) {
                                String status = "";
                                if (year.equals(String.valueOf(yr))) {
                                    status = "selected";
                                }
                                out.println("<option " + status + " value=\"" + yr + "\">");
                                out.println(yr + "</option>");
                            }
                        %>
                    </select>
                </div> 
                <button type="submit" class="btn btn-primary btn-block">Display Employee Attendance</button>
            </form>
        </div>
    </div>
    <%
        if (request.getParameter("month_name") != null
                && request.getParameter("year") != null) {
            String message = "";
            boolean error_status = false;
            if (Validations.isEmpty(month_name)) {
                error_status = true;
                message += " * Please Choose Any Month Name<br>";
            }
            if (Validations.isEmpty(year)) {
                error_status = true;
                message += " * Please Choose Any Year<br>";
            } else if (!Validations.isNumber(year)) {
                error_status = true;
                message += " * Please Provide Number in Year<br>";
            }
            if (!error_status) {
                Employee_Attendance_DAO dao = new Employee_Attendance_DAO();
                int selected_year = Integer.parseInt(year);
                if (dao.validAttendancePeriod(month_name, selected_year)) {
                    MonthNames selected_month = MonthNames.valueOf(month_name);
                    int month_number = selected_month.getMonth_number();
                    List<Employee_Info_TO> employees = new Employee_Info_DAO().getAllRecord(month_number, selected_year);
    %>
    <div class="row mt-4">        
        <div class="col-12 table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Employee Name</th>
                        <th>Employee Category</th>
                        <th>Total Working Days</th>
                        <th>Total Present</th>
                        <th>Total Absent</th>
                        <th>Total Leave</th>
                        <th> Gross Salary </th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        int total_working_days = Operation.calculateWorkingDays(selected_month, selected_year);
                        int total_present , total_absent, total_leave;
                        Employee_Salary_DAO edao = new Employee_Salary_DAO();
                        for(Employee_Info_TO eit : employees){
                            total_present = dao.getTotalPresentDay(eit.getEmployee_id(), month_name, selected_year);
                            total_absent = dao.getTotalAbsentDay(eit.getEmployee_id(), month_name, selected_year);
                            total_leave = dao.getTotalLeaves(eit.getEmployee_id(), month_name, selected_year);
                            out.println("<tr>");
                            out.println("<td>" + eit.getEmployee_name() + "</td>");
                            out.println("<td>" + eit.getCategory_name() + "</td>");
                            out.println("<td>" + total_working_days + "</td>");
                            out.println("<td>" + total_present + "</td>");
                            out.println("<td>" + total_absent + "</td>");
                            out.println("<td>" + total_leave + "</td>");
                            out.println("<td>");
                            Employee_Salary_TO est = edao.getRecord(eit.getEmployee_id(), month_name, selected_year);
                            if(est!=null){
                                out.println("<form method=\"post\" action=\"generate_slip.jsp\">");
                                out.println("<input type=\"hidden\" name=\"employee_id\" value=\"" + eit.getEmployee_id() + "\"/>");
                                out.println("<input type=\"hidden\" name=\"month_name\" value=\"" + month_name + "\"/>");
                                out.println("<input type=\"hidden\" name=\"year\" value=\"" + year + "\"/>");                                
                                out.println("<input type=\"hidden\" name=\"total_working_days\" value=\"" + total_working_days + "\"/>");
                                out.println("<button type=\"submit\" class=\"btn btn-primary\">View Details");
                                out.println("<span class=\"badge badge-light\">Rs. " + est.getGross_salary() + "</span>");
                                out.println("</button>");
                                out.println("</form>");
                            }else{
                                out.println("<form method=\"post\" action=\"calculate_employee_salary.jsp\">");
                                out.println("<input type=\"hidden\" name=\"employee_id\" value=\"" + eit.getEmployee_id() + "\"/>");
                                out.println("<input type=\"hidden\" name=\"month_name\" value=\"" + month_name + "\"/>");
                                out.println("<input type=\"hidden\" name=\"year\" value=\"" + year + "\"/>");
                                out.println("<input type=\"hidden\" name=\"total_working_days\" value=\"" + total_working_days + "\"/>");
                                out.println("<button type=\"submit\" class=\"btn btn-primary\">Calculate Salary</button>");
                                out.println("</form>");
                            }
                                
                            out.println("</td>");
                            out.println("</tr>");
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
    <%            } else {
                error_status = true;
                message += " * There is No Attendance of Employees for this Month<br>";
            }
        }

    %>
    <br>
    <%        if (error_status) {
            String classname = "alert-danger";

    %>
    <div class="alert <%= classname%>">
        <%= message%>
    </div>
    <%
        }
    %>
    <%
            session.removeAttribute("message");
        }
    %>
    <br>
</div>
<jsp:include page="footer.jsp" />