<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String employee_name = session.getAttribute("employee_name") != null ? session.getAttribute("employee_name").toString() : "";
    String father_name = session.getAttribute("father_name") != null ? session.getAttribute("father_name").toString() : "";
    String address = session.getAttribute("address") != null ? session.getAttribute("address").toString() : "";
    String category_id = session.getAttribute("category_id") != null ? session.getAttribute("category_id").toString() : "";
    String date_of_birth = session.getAttribute("date_of_birth") != null ? session.getAttribute("date_of_birth").toString() : "";
    String date_of_joining = session.getAttribute("date_of_joining") != null ? session.getAttribute("date_of_joining").toString() : "";
    String pan_no = session.getAttribute("pan_no") != null ? session.getAttribute("pan_no").toString() : "";
    String aadhar_no = session.getAttribute("aadhar_no") != null ? session.getAttribute("aadhar_no").toString() : "";
    session.removeAttribute("employee_name");
    session.removeAttribute("father_name");
    session.removeAttribute("address");
    session.removeAttribute("category_id");
    session.removeAttribute("date_of_birth");
    session.removeAttribute("date_of_joining");
    session.removeAttribute("pan_no");
    session.removeAttribute("aadhar_no");
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Add New Employee</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
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
            <form method="post" action="insert_employee.jsp">
                <div class="form-group">
                    <label for="category_id">Choose Employee Category: </label>
                    <select name="category_id" class="form-control" id="category_id">
                        <option value="">Choose Employee Category</option>
                        <%
                            String status = "";
                            List<Employee_Category_TO> categories = new Employee_Category_DAO().getAllRecord();
                            if (categories != null && categories.size() > 0) {
                                for (Employee_Category_TO ect : categories) {
                                    status = "";
                                    if (ect.getCategory_id().equals(category_id)) {
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
                    <input type="text" name="employee_name" value="<%= employee_name%>" class="form-control" placeholder="Employee Name"
                           id="employee_name">
                </div>
                <div class="form-group">
                    <label for="father_name">Enter Father Name : </label>
                    <input type="text" name="father_name"  value="<%= father_name%>" class="form-control" placeholder="Father Name" 
                           id="father_name">
                </div>                           
                <div class="form-group">
                    <label for="date_of_birth">Enter Date of Birth : </label>
                    <input type="date" name="date_of_birth"  value="<%= date_of_birth%>" class="form-control" placeholder="Date of Birth" 
                           id="date_of_birth">
                </div>                           
                <div class="form-group">
                    <label for="address">Enter Address : </label>
                    <textarea name="address" class="form-control" placeholder="Address" 
                              id="address"><%= address%></textarea>
                </div>
                <div class="form-group">
                    <label for="pan_no">Enter PAN No: </label>
                    <input type="text" name="pan_no"  value="<%= pan_no%>" class="form-control" placeholder="PAN No" 
                           id="pan_no">
                </div>                     
                <div class="form-group">
                    <label for="aadhar_no">Enter Aadhar No: </label>
                    <input type="text" name="aadhar_no"  value="<%= aadhar_no%>" class="form-control" placeholder="Aadhar No" 
                           id="aadhar_no">
                </div>                     
                <div class="form-group">
                    <label for="date_of_joining">Enter Date of Joining: </label>
                    <input type="date" name="date_of_joining"  value="<%= date_of_joining%>" class="form-control" 
                           id="date_of_joining">
                </div>                         

                <button type="submit" class="btn btn-primary btn-block">Save Employee Details</button>
            </form>
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>