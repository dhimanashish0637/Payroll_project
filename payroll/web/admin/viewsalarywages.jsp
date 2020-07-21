<%@page import="model.dao.Salary_Wages_DAO"%>
<%@page import="model.to.Salary_Wages_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>All Salary Wages</h1>                
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
                        <th>Wage ID</th>
                        <th>Wage Name</th>
                        <th>Wage Percentage</th>
                        <th>Wage Type</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Salary_Wages_TO> categories = new Salary_Wages_DAO().getAllRecord();
                        if(categories!=null && categories.size()>0){
                            for(Salary_Wages_TO swt : categories){
                                out.println("<tr>");
                                out.println("<td>" + swt.getWage_id() + "</td>");
                                out.println("<td>" + swt.getWage_name()+ "</td>");
                                out.println("<td>" + swt.getWage_percentage() + "%</td>");
                                out.println("<td>" + swt.getWage_type()+ "</td>");                                
                                out.println("</tr>");
                            }
                        }else{
                            out.println("<tr>");
                            out.println("<td align=\"center\" colspan=\"4\">There is no Salary Wages</td>");
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