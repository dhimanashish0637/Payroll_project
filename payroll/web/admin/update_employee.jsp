<%@page import="java.sql.Date"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="utilities.Validations"%>
<%
    String url = "editemployee.jsp";
    String message = "";
    boolean error_status = false;
    if (request.getParameter("employee_name") != null && request.getParameter("father_name") != null
            && request.getParameter("address") != null && request.getParameter("pan_no") != null
            && request.getParameter("date_of_birth") != null && request.getParameter("aadhar_no") != null
            && request.getParameter("date_of_joining") != null && request.getParameter("category_id") != null
            && request.getParameter("employee_id") != null) {
        String employee_id = request.getParameter("employee_id").trim();
        String employee_name = request.getParameter("employee_name").trim();
        String father_name = request.getParameter("father_name").trim();
        String address = request.getParameter("address").trim();
        String pan_no = request.getParameter("pan_no").trim();
        String date_of_birth = request.getParameter("date_of_birth").trim();
        String aadhar_no = request.getParameter("aadhar_no").trim();
        String date_of_joining = request.getParameter("date_of_joining").trim();
        String category_id = request.getParameter("category_id").trim();
        url += "?employee_id=" + employee_id;
        if(Validations.isEmpty(employee_id)){
            error_status = true;
            message += "Please Provide Employee ID<br>";
        }else if(!Validations.isNumber(employee_id)){
            error_status = true;
            message += "Please Provide Number in Employee ID<br>";
        }
        if (Validations.isEmpty(category_id)) {
            error_status = true;
            message += "Please Choose Any Category<br>";
        }
        if (Validations.isEmpty(employee_name)) {
            error_status = true;
            message += "Please Enter Some Value in Employee Name Box<br>";
        }
        if (Validations.isEmpty(father_name)) {
            error_status = true;
            message += "Please Enter Some Value in Father Name Box<br>";
        } 
        if (Validations.isEmpty(address)) {
            error_status = true;
            message += "Please Enter Some Value in Address Box<br>";
        }
        if (Validations.isEmpty(pan_no)) {
            error_status = true;
            message += "Please Enter Some Value in PAN No Box<br>";
        } 
        if (Validations.isEmpty(aadhar_no)) {
            error_status = true;
            message += "Please Enter Some Value in Aadhar No Box<br>";
        }
        if (Validations.isEmpty(pan_no)) {
            error_status = true;
            message += "Please Enter Some Value in PAN No Box<br>";
        }
        if (Validations.isEmpty(date_of_birth)) {
            error_status = true;
            message += "Please Choose Employee Date of Birth<br>";
        }
        if (Validations.isEmpty(date_of_joining)) {
            error_status = true;
            message += "Please Choose Employee Date of Joining<br>";
        }
        if (!error_status) {
            Employee_Info_TO eit = new Employee_Info_TO();
            eit.setEmployee_id(Integer.parseInt(employee_id));
            eit.setEmployee_name(employee_name);
            eit.setFather_name(father_name);
            eit.setAddress(address);
            eit.setPan_no(pan_no);
            eit.setAadhar_no(aadhar_no);
            eit.setCategory_id(category_id);
            eit.setDate_of_birth(Date.valueOf(date_of_birth));
            eit.setDate_of_joining(Date.valueOf(date_of_joining));
            Employee_Info_DAO dao = new Employee_Info_DAO();
            if(dao.updateRecord(eit)){
                message = "Employee Record is Updated in Database";
            }else{
                error_status = true;
                message = "Employee Record is not updated due to " + dao.getError_message();
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
    response.sendRedirect(url);
%>