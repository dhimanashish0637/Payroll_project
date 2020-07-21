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
                <h1>All Employee Category</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <br>
    <div class="row">        
        <div class="col-12 table-responsive">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>Employee Category ID</th>
                        <th>Employee Category Name</th>
                        <th>Basic Salary</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Employee_Category_TO> categories = new Employee_Category_DAO().getAllRecord();
                        if(categories!=null && categories.size()>0){
                            for(Employee_Category_TO ect : categories){
                                out.println("<tr>");
                                out.println("<td>" + ect.getCategory_id()+ "</td>");
                                out.println("<td>" + ect.getCategory_name()+ "</td>");
                                out.println("<td>" + ect.getBasic_salary()+ "</td>");
                                out.println("</tr>");
                            }
                        }else{
                            out.println("<tr>");
                            out.println("<td align=\"center\" colspan=\"3\">There is no Employee Category</td>");
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