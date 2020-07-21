<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String category_id = session.getAttribute("category_id") != null ? session.getAttribute("category_id").toString() : "";
    String category_name = session.getAttribute("category_name") != null ? session.getAttribute("category_name").toString() : "";
    String basic_salary = session.getAttribute("basic_salary") != null ? session.getAttribute("basic_salary").toString() : "";
    String leave_per_month = session.getAttribute("leave_per_month") != null ? session.getAttribute("leave_per_month").toString() : "";
    session.removeAttribute("category_id");
    session.removeAttribute("category_name");
    session.removeAttribute("basic_salary");
    session.removeAttribute("leave_per_month");
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Add Employee Category</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">        
        <div class="col-12">
            <form method="post" action="insert_employeecategory.jsp">
                <div class="form-group">
                    <label for="category_id">Enter Employee Category ID:</label>
                    <input type="text" name="category_id" value="<%= category_id%>" class="form-control" placeholder="Employee Category ID"
                           id="category_id">
                </div>
                <div class="form-group">
                    <label for="category_name">Enter Employee Category Name: </label>
                    <input type="text" name="category_name"  value="<%= category_name%>" class="form-control" placeholder="Employee Category Name" 
                           id="category_name">
                </div>                           
                <div class="form-group">
                    <label for="basic_salary">Enter Basic Salary: </label>
                    <input type="text" name="basic_salary"  value="<%= basic_salary%>" class="form-control" placeholder="Basic Salary" 
                           id="basic_salary">
                </div>                                           
                <div class="form-group">
                    <label for="leave_per_month">Enter Leave Per Month: </label>
                    <input type="text" name="leave_per_month"  value="<%= leave_per_month%>" class="form-control" placeholder="Leave Per Month" 
                           id="leave_per_month">
                </div>                                           
                <button type="submit" class="btn btn-primary btn-block">Add Employee Category Details</button>
            </form>
        </div>
    </div>
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
<%@include file="footer.jsp" %>