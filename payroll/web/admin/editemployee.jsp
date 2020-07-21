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
                <button type="submit" class="btn btn-primary btn-block">Display Employee Details</button>
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
                boolean all_valid = true;
                Employee_Info_TO eit = null;
                if (Validations.isEmpty(employee_id)) {
                    all_valid = false;
                } else if (!Validations.isNumber(employee_id)) {
                    all_valid = false;
                } else {
                    eit = new Employee_Info_DAO().getRecord(Integer.parseInt(employee_id));
                }
                if (all_valid && eit != null) {
            %>
            <form method="post" action="update_employee.jsp">
                <div class="form-group">
                    <input type="hidden" name="employee_id" value="<%= eit.getEmployee_id() %>"/>
                    <label for="category_id">Choose Employee Category: </label>
                    <select name="category_id" class="form-control" id="category_id">
                        <option value="">Choose Employee Category</option>
                        <%
                            String status = "";
                            List<Employee_Category_TO> categories = new Employee_Category_DAO().getAllRecord();
                            if (categories != null && categories.size() > 0) {
                                for (Employee_Category_TO ect : categories) {
                                    status = "";
                                    if (ect.getCategory_id().equals(eit.getCategory_id())) {
                                        status = "selected";
                                    }
                                    out.println("<option value=\"" + ect.getCategory_id() + "\" " + status + ">" + ect.getCategory_name() + "</option>");
                                }
                            }
                        %>
                    </select>
                </div>
                <div class="form-group">
                    <label for="employee_name">Enter Employee Name : </label>
                    <input type="text" name="employee_name" value="<%= eit.getEmployee_name() %>" class="form-control" placeholder="Employee Name"
                           id="employee_name">
                </div>
                <div class="form-group">
                    <label for="father_name">Enter Father Name : </label>
                    <input type="text" name="father_name"  value="<%= eit.getFather_name() %>" class="form-control" placeholder="Father Name" 
                           id="father_name">
                </div>                           
                <div class="form-group">
                    <label for="date_of_birth">Enter Date of Birth : </label>
                    <input type="date" name="date_of_birth"  value="<%= eit.getDate_of_birth() %>" class="form-control" placeholder="Date of Birth" 
                           id="date_of_birth">
                </div>                           
                <div class="form-group">
                    <label for="address">Enter Address : </label>
                    <textarea name="address" class="form-control" placeholder="Address" 
                              id="address"><%= eit.getAddress() %></textarea>
                </div>
                <div class="form-group">
                    <label for="pan_no">Enter PAN No: </label>
                    <input type="text" name="pan_no"  value="<%= eit.getPan_no() %>" class="form-control" placeholder="PAN No" 
                           id="pan_no">
                </div>                     
                <div class="form-group">
                    <label for="aadhar_no">Enter Aadhar No: </label>
                    <input type="text" name="aadhar_no"  value="<%= eit.getAadhar_no() %>" class="form-control" placeholder="Aadhar No" 
                           id="aadhar_no">
                </div>                     
                <div class="form-group">
                    <label for="date_of_joining">Enter Date of Joining: </label>
                    <input type="date" name="date_of_joining"  value="<%= eit.getDate_of_joining() %>" class="form-control" 
                           id="date_of_joining">
                </div>                         

                <button type="submit" class="btn btn-primary btn-block">Update Employee Details</button>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>