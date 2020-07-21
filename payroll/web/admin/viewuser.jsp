<%@page import="utilities.DateFormatFunction"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>All User Details</h1>                
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
                        <th>User Name</th>
                        <th>Password</th>
                        <th>Email ID</th>
                        <th>User Role</th>
                        <th>Last Login Status</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        List<Login_Info_TO> users = new Login_Info_DAO().getAllRecord();
                        if(users!=null && users.size()>0){
                            for(Login_Info_TO lit : users){
                                out.println("<tr>");
                                out.println("<td>" + lit.getUser_name()+ "</td>");
                                out.println("<td>" + lit.getPassword()+ "</td>");
                                out.println("<td>" + lit.getEmail_id()+ "</td>");
                                out.println("<td>" + lit.getRole_name()+ "</td>");
                                if(lit.getLast_login()!=null){
                                    out.println("<td>" + DateFormatFunction.getDateTimeString(lit.getLast_login()) + "</td>");
                                }else{
                                    out.println("<td>Not Login Yet</td>");
                                }
                                out.println("</tr>");
                            }
                        }else{
                            out.println("<tr>");
                            out.println("<td align=\"center\" colspan=\"5\">There is no User Create yet</td>");
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