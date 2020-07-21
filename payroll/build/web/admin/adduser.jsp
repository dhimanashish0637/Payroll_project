<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>
<%
    String user_name = session.getAttribute("user_name") != null ? session.getAttribute("user_name").toString() : "";
    String password = session.getAttribute("password") != null ? session.getAttribute("password").toString() : "";
    String role_name = session.getAttribute("role_name") != null ? session.getAttribute("role_name").toString() : "";
    String email_id = session.getAttribute("email_id") != null ? session.getAttribute("email_id").toString() : "";
    session.removeAttribute("user_name");
    session.removeAttribute("password");
    session.removeAttribute("role_name");
    session.removeAttribute("email_id");
    String[] role_names = {"Admin", "HR"};
%>
<!-- Hero Section-->
<section class="bg-light">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <h1>Create New User</h1>                
            </div>            
        </div>
    </div>
</section>
<div class="container">
    <div class="row">        
        <div class="col-12">
            <form method="post" action="insert_user.jsp">
                <div class="form-group">
                    <label for="user_name">Enter User Name : </label>
                    <input type="text" name="user_name" value="<%= user_name%>" class="form-control" placeholder="User Name"
                           id="user_name">
                </div>
                <div class="form-group">
                    <label for="password">Enter Password : </label>
                    <input type="text" name="password"  value="<%= password%>" class="form-control" placeholder="Password" 
                           id="password">
                </div>                           
                <div class="form-group">
                    <label for="email_id">Enter Password : </label>
                    <input type="email" name="email_id"  value="<%= email_id%>" class="form-control" placeholder="Email ID" 
                           id="email_id">
                </div>    
                <div class="form-group">
                    <label for="role_name">Choose User Role : </label>
                    <select name="role_name" class="form-control" id="role_name">
                        <option value="">Choose Any User Role</option>
                        <%
                            String status = "";
                            for (String role : role_names) {
                                status = "";
                                if (role.equals(role_name)) {
                                    status = "selected";
                                }
                                out.println("<option value=\"" + role + "\" " + status + ">" + role + "</option>");
                            }
                        %>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary btn-block">Create New User</button>
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