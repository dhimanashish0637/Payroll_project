<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="model.dao.Employee_Salary_Details_DAO"%>
<%@page import="model.to.Employee_Salary_Details_TO"%>
<%@page import="model.dao.Employee_Salary_DAO"%>
<%@page import="model.to.Employee_Salary_TO"%>
<%@page import="utilities.MonthNames"%>
<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Employee Salary Slip</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">    
    <div class="row">        
        <div class="col-12 table-responsive">
            <%
                String employee_id = request.getParameter("employee_id") != null ? request.getParameter("employee_id").trim() : "";
                String month_name = request.getParameter("month_name") != null ? request.getParameter("month_name").trim() : "";
                String year = request.getParameter("year") != null ? request.getParameter("year").trim() : "";
                String total_working_days = request.getParameter("total_working_days") != null ? request.getParameter("total_working_days").trim() : "";
                boolean all_valid = true;
                if (Validations.isEmpty(employee_id)) {
                    all_valid = false;
                } else if (!Validations.isNumber(employee_id)) {
                    all_valid = false;
                }
                if (Validations.isEmpty(month_name)) {
                    all_valid = false;
                } else {
                    try {
                        MonthNames.valueOf(month_name);
                    } catch (Exception ex) {
                        all_valid = false;
                    }
                }
                if (Validations.isEmpty(year)) {
                    all_valid = false;
                } else if (!Validations.isNumber(year)) {
                    all_valid = false;
                }
                if (Validations.isEmpty(total_working_days)) {
                    all_valid = false;
                } else if (!Validations.isNumber(total_working_days)) {
                    all_valid = false;
                }
                if (all_valid) {
                    int emp_id = Integer.parseInt(employee_id);
                    int salary_year = Integer.parseInt(year);
                    int working_days = Integer.parseInt(total_working_days);
                    Employee_Salary_TO est = new Employee_Salary_DAO().getRecord(emp_id, month_name, salary_year);
                    if (est != null) {
                        

            %>

            <table class="table table-bordered">
                <thead>
                <th colspan="2">
                    <h3 class="text-center"><%= est.getEmployee_name()%> Pay Slip of <%= month_name%> <%= year%> </h3>
                </th>
                </thead>
                <tbody>
                    <%
                        out.println("<tr>");
                        out.println("<th>Basic Salary</th>");
                        out.println("<td>Rs. " + est.getBasic_salary() + "</td>");
                        out.println("<tr>");
                        int total_present = new Employee_Attendance_DAO().getTotalPresentDay(emp_id, month_name, salary_year);
                        float working_day_salary = ( est.getBasic_salary() / working_days) * total_present;
                        out.println("<tr>");
                        out.println("<th>" + total_present + " Working Day Salary</th>");
                        out.println("<td>Rs. " + working_day_salary + "</td>");
                        out.println("<tr>");
                        List<Employee_Salary_Details_TO> details = new Employee_Salary_Details_DAO().getAllRecord(est.getSalary_id());
                        if (details != null && details.size() > 0) {
                            for (Employee_Salary_Details_TO detail : details) {
                                out.println("<tr>");
                                out.println("<th>" + detail.getWage_name() + "</th>");
                                out.println("<td>Rs. " + detail.getWage_amount() + "</td>");
                                out.println("<tr>");
                            }
                        }
                        out.println("<tr>");
                        out.println("<th>Gross Salary</th>");
                        out.println("<td>Rs. " + est.getGross_salary() + "</td>");
                        out.println("<tr>");
                    %>
                </tbody>
            </table>
            <%                    }
                }
            %>
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>