<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String wage_name = session.getAttribute("wage_name") != null ? session.getAttribute("wage_name").toString() : "";
    String wage_percentage = session.getAttribute("wage_percentage") != null ? session.getAttribute("wage_percentage").toString() : "";
    String wage_type = session.getAttribute("wage_type") != null ? session.getAttribute("wage_type").toString() : "";
    session.removeAttribute("wage_name");
    session.removeAttribute("wage_percentage");
    session.removeAttribute("wage_type");
    String[] wage_types = {"additions", "deductions"};
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Add Salary Wage</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">        
        <div class="col-12">
            <form method="post" action="insert_salarywages.jsp">
                <div class="form-group">
                    <label for="wage_name">Salary Wage Name : </label>
                    <input type="text" name="wage_name" value="<%= wage_name%>" class="form-control" placeholder="Wage Name"
                           id="wage_name">
                </div>
                <div class="form-group">
                    <label for="wage_percentage">Wage Percentage : </label>
                    <input type="text" name="wage_percentage"  value="<%= wage_percentage%>" class="form-control" placeholder="Wage Percentage" 
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
                                if (type.equals(wage_type)) {
                                    status = "selected";
                                }
                                out.println("<option value=\"" + type + "\" " + status +">" + type + "</option>");
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Add Salary Wages</button>
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