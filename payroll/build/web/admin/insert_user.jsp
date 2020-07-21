<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="utilities.Validations"%>
<%
    String message = "";
    boolean error_status = false;
    if (request.getParameter("user_name") != null && request.getParameter("password") != null
            && request.getParameter("role_name") != null && request.getParameter("email_id") != null) {
        String user_name = request.getParameter("user_name").trim();
        String password = request.getParameter("password").trim();
        String role_name = request.getParameter("role_name").trim();
        String email_id = request.getParameter("email_id").trim();
        session.setAttribute("user_name", user_name);
        session.setAttribute("password", password);
        session.setAttribute("role_name", role_name);
        session.setAttribute("email_id", email_id);
        if (Validations.isEmpty(user_name)) {
            error_status = true;
            message += "Please Enter Some Value in User Name Box<br>";
        }
        if (Validations.isEmpty(password)) {
            error_status = true;
            message += "Please Enter Some Value in Password Box<br>";
        } else if (!Validations.isComplexPassword(password)) {
            error_status = true;
            message += "Password is not complex. It must contains at least 1 Upper Case Letter, 1 Digit and 1 Special Symbol ( $ or @ or # or _ ) <br>";
        }
        if (Validations.isEmpty(role_name)) {
            error_status = true;
            message += "Please Choose Any User Role<br>";
        }
        if (Validations.isEmpty(email_id)) {
            error_status = true;
            message += "Please Enter Some Value in Email ID Box<br>";
        } else if (!Validations.isValidEmail(email_id)) {
            error_status = true;
            message += "Please Enter Valid Email ID<br>";
        }
        if (!error_status) {
            Login_Info_TO lit = new Login_Info_TO();
            lit.setUser_name(user_name);
            lit.setPassword(password);
            lit.setRole_name(role_name);
            lit.setEmail_id(email_id);
            Login_Info_DAO dao = new Login_Info_DAO();
            if (dao.insertRecord(lit)) {
                message = "New User Create in System";
            } else {
                error_status = true;
                message = "User Creation Failure due to " + dao.getError_message();
            }
        }
    } else {
        error_status = true;
        message = "Please provide all values";
    }
    if (error_status) {
        session.setAttribute("error", "yes");
    }
    session.setAttribute("message", message);
    response.sendRedirect("adduser.jsp");
%>