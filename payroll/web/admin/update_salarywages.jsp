<%@page import="model.dao.Salary_Wages_DAO"%>
<%@page import="model.to.Salary_Wages_TO"%>
<%@page import="utilities.Validations"%>
<%
    String url = "editwages.jsp";
    String message = "";
    boolean error_status = false;
    if (request.getParameter("wage_name") != null && request.getParameter("wage_percentage") != null
            && request.getParameter("wage_type") != null && request.getParameter("wage_id") != null) {
        String wage_name = request.getParameter("wage_name").trim();
        String wage_percentage = request.getParameter("wage_percentage").trim();
        String wage_type = request.getParameter("wage_type").trim();
        String wage_id = request.getParameter("wage_id").trim();
        url += "?wage_id=" + wage_id;
        if (Validations.isEmpty(wage_name) || Validations.isEmpty(wage_percentage) || Validations.isEmpty(wage_type)
                || Validations.isEmpty(wage_id)) {
            message = "Please Provide all value in Form";
            error_status = true;
        } else if (Validations.isFloat(wage_percentage) && Validations.isNumber(wage_id)) {
            Salary_Wages_TO swt = new Salary_Wages_TO();
            swt.setWage_name(wage_name);
            swt.setWage_percentage(Float.parseFloat(wage_percentage));
            swt.setWage_type(wage_type);
            swt.setWage_id(Integer.parseInt(wage_id));
            Salary_Wages_DAO dao = new Salary_Wages_DAO();
            if (dao.updateRecord(swt)) {
                message = "Salary Wages is Updated Successfully in System Database";
            } else {
                message = " There is some error due to " + dao.getError_message();
                error_status = true;
            }
        } else {
            message = "Please Enter Number in Wage Percentage Box";
            error_status = true;
        }
    } else {
        message = "Please provide all values of form";
        error_status = true;
    }
    if (error_status) {
        session.setAttribute("error", "yes");
    }
    session.setAttribute("message", message);
    response.sendRedirect(url);
%>