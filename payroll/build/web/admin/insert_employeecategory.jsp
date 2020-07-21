<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="utilities.Validations"%>
<%
    String message = "";
    boolean error_status = false;
    if (request.getParameter("category_id") != null && request.getParameter("category_name") != null
            && request.getParameter("basic_salary") != null && request.getParameter("leave_per_month") != null) {
        String category_id = request.getParameter("category_id").trim();
        String category_name = request.getParameter("category_name").trim();
        String basic_salary = request.getParameter("basic_salary").trim();
        String leave_per_month = request.getParameter("leave_per_month").trim();
        session.setAttribute("category_id", category_id);
        session.setAttribute("category_name", category_name);
        session.setAttribute("basic_salary", basic_salary);
        session.setAttribute("leave_per_month", leave_per_month);
        if (Validations.isEmpty(category_id) || Validations.isEmpty(category_name) || Validations.isEmpty(basic_salary)
                || Validations.isEmpty(leave_per_month)) {
            message = "Please Provide all value in Form";
            error_status = true;
        } else if (Validations.isFloat(basic_salary) && Validations.isNumber(leave_per_month)) {
            int lpm = Integer.parseInt(leave_per_month);
            float bs = Float.parseFloat(basic_salary);
            if (bs <= 0) {
                message = " Basic Salary cannot be Zero or negative";
                error_status = true;
            } else if (lpm >= 0 && lpm <= 5) {
                Employee_Category_TO ect = new Employee_Category_TO();
                ect.setCategory_id(category_id);
                ect.setCategory_name(category_name);
                ect.setBasic_salary(Float.parseFloat(basic_salary));
                Employee_Category_DAO dao = new Employee_Category_DAO();
                if (dao.insertRecord(ect)) {
                    message = "New Employee Category is Added Successfully in System Database";
                } else {
                    message = " There is some error due to " + dao.getError_message();
                    error_status = true;
                }
            } else {
                message = "Leave per month for Employee must be between 0 and 5";
                error_status = true;
            }
        } else {
            message = "Please Enter Number in Basic Salary Box and Leave Per Month Box";
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
    response.sendRedirect("addemployeecategory.jsp");
%>