<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%    String employee_id = request.getParameter("employee_id") != null ? request.getParameter("employee_id").trim() : "";
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
                <button type="submit" name="action" class="btn btn-danger btn-block">Display Employee of Given Employee ID</button>
            </form>
        </div>
    </div>    
    <br>
    <%
        if (request.getParameter("action") != null) {
            boolean all_valid = true;
            String message = "";
            Employee_Info_TO eit = null;
            if (Validations.isEmpty(employee_id)) {
                all_valid = false;
                message = "Plese Enter Some Value in Employee ID Box";
            } else if (!Validations.isNumber(employee_id)) {
                all_valid = false;
                message = "Please Enter Number in Employee ID Box";
            } else {
                eit = new Employee_Info_DAO().getRecord(Integer.parseInt(employee_id));
                if (eit == null) {
                    all_valid = false;
                    message = "There is no Employee with given Employee ID";
                }
            }
            if (eit != null) {
                Employee_Info_DAO dao = new Employee_Info_DAO();
                if(dao.deleteRecord(eit.getEmployee_id())){
                    message = "Employee Details is Removed of Given Employee ID";
                }else{
                    all_valid = false;
                    message = "Employee is not Removed Due to " + dao.getError_message();
                }
            }
    %>
    <br>
    <%        
        String classname = "alert-danger";
        if (all_valid) {
            classname = "alert-success";
        }
    %>
    <div class="alert <%= classname%>">
        <%= message %>
    </div>
    <%
        }
    %>

</div>
<%@include file="footer.jsp" %>