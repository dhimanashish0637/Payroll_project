<%@page import="model.dao.Salary_Wages_DAO"%>
<%@page import="model.to.Salary_Wages_TO"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="utilities.Validations"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%    String wage_id = request.getParameter("wage_id") != null ? request.getParameter("wage_id").trim() : "";
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Edit Salary Wages</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">
        <div class="col-12">
            <form method="get">
                <div class="form-group">
                    <label for="wage_id">Choose Any Salary Wage : </label>
                    <select name="wage_id"class="form-control" id="wage_id">
                        <option value="">Choose Wage</option>
                        <%
                            List<Salary_Wages_TO> wages = new Salary_Wages_DAO().getAllRecord();
                            if (wages != null && wages.size() > 0) {
                                for (Salary_Wages_TO wage : wages) {
                                    String status = "";
                                    if (wage_id.equals(String.valueOf(wage.getWage_id()))) {
                                        status = "selected";
                                    }
                                    out.println("<option " + status + " value=\"" + wage.getWage_id() + "\">" + wage.getWage_name() + "</option>");
                                }
                            }
                        %>
                    </select>
                </div>
                <button name="action" type="submit" class="btn btn-primary btn-block">Display Salary Wages</button>
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
                Salary_Wages_TO swt = null;
                String[] wage_types = {"additions", "deductions"};
                if (Validations.isEmpty(wage_id)) {
                    all_valid = false;
                } else if (!Validations.isNumber(wage_id)) {
                    all_valid = false;
                } else {
                    swt = new Salary_Wages_DAO().getRecord(Integer.parseInt(wage_id));
                }
                if (all_valid && swt != null) {
            %>
            <form method="post" action="update_salarywages.jsp">
                <div class="form-group">
                    <input type="hidden" name="wage_id" value="<%= swt.getWage_id() %>"/>
                    <label for="wage_name">Salary Wage Name : </label>
                    <input type="text" name="wage_name" value="<%= swt.getWage_name() %>" class="form-control" placeholder="Wage Name"
                           id="wage_name">
                </div>
                <div class="form-group">
                    <label for="wage_percentage">Wage Percentage : </label>
                    <input type="text" name="wage_percentage"  value="<%= swt.getWage_percentage() %>" class="form-control" placeholder="Wage Percentage" 
                           id="wage_percentage">
                </div>                           
                <div class="form-group">
                    <label for="wage_type">Choose Wage Category : </label>
                    <select name="wage_type" class="form-control" id="wage_type">
                        <option value="">Choose Any Wage Category</option>
                        <%
                            String status = "";
                            for (String type : wage_types) {
                                status = "";
                                if (type.equals(swt.getWage_type())) {
                                    status = "selected";
                                }
                                out.println("<option value=\"" + type + "\" " + status + ">" + type + "</option>");
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Update Salary Wages</button>
            </form>
            <%
                }
            %>
        </div>
    </div>
    <br>
</div>
<%@include file="footer.jsp" %>