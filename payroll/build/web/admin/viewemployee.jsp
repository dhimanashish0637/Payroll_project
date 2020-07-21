<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String category_id = request.getParameter("category_id") != null ? request.getParameter("category_id").trim() : "";
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Employee Details</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form method="get">
                <div class="form-group">
                    <label for="category_id">Choose Employee Category: </label>
                    <select name="category_id" class="form-control" id="category_id">
                        <option value="">Choose Employee Category</option>
                        <%                            String status = "";
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
                <button type="submit" class="btn btn-primary btn-block">Display Employee According to Selected Employee Category</button>
            </form>
        </div>
    </div>
    <div class="row">        
        <div class="col-12 table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Father Name</th>
                        <th>Date of Birth</th>
                        <th>Address</th>
                        <th>PAN No</th>
                        <th>Aadhar No</th>
                        <th>Date of Joining</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Employee_Info_TO> employees = null;
                        if(category_id.equals("")){
                            employees = new Employee_Info_DAO().getAllRecord();
                        }else{
                            employees = new Employee_Info_DAO().getAllRecord(category_id);
                        }
                        if (employees != null && employees.size() > 0) {
                            for (Employee_Info_TO eit : employees) {
                                out.println("<tr>");
                                out.println("<td>" + eit.getEmployee_id()+ "</td>");
                                out.println("<td>" + eit.getEmployee_name()+ "</td>");
                                out.println("<td>" + eit.getFather_name()+ "</td>");
                                out.println("<td>" + eit.getDate_of_birth()+ "</td>");
                                out.println("<td>" + eit.getAddress()+ "</td>");
                                out.println("<td>" + eit.getPan_no()+ "</td>");
                                out.println("<td>" + eit.getAadhar_no()+ "</td>");
                                out.println("<td>" + eit.getDate_of_joining()+ "</td>");
                                out.println("</tr>");
                            }
                        } else {
                            out.println("<tr>");
                            out.println("<td align=\"center\" colspan=\"8\">There is no User Create yet</td>");
                            out.println("</tr>");
                        }

                    %>
                </tbody>
            </table>
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>