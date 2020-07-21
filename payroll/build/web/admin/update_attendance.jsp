<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="model.to.Employee_Attendance_TO"%>
<%@page import="java.sql.Date"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="utilities.Validations"%>
<%
    String message = "";
    if (request.getParameter("attendance_id") != null && request.getParameter("present_status") != null) {
        String attendance_id = request.getParameter("attendance_id").trim();
        String present_status = request.getParameter("present_status").trim();
        boolean all_valid = true;
        if(Validations.isEmpty(attendance_id)){
            message += "Please Provide Some Value of Attendance ID<br>";
            all_valid = false;
        }else if(!Validations.isNumber(attendance_id) ){            
            message += "Please Provide Number in Attendance ID<br>";
            all_valid = false;
        }
        if (Validations.isEmpty(present_status)) {
            message += "Please Choose Any Present Status<br>";
            all_valid = false;
        }
        if (all_valid) {
            int att_id = Integer.parseInt(attendance_id);
            Employee_Attendance_DAO dao = new Employee_Attendance_DAO();
            Employee_Attendance_TO eat = dao.getRecord(att_id);
            if(eat!=null){
                if(eat.getPresent_status().equalsIgnoreCase(present_status)){
                    message = "There is No Change in Attendance because you have not change the present status";
                }else{
                    eat.setPresent_status(present_status);                
                    eat.setIs_leave("no");
                    if(present_status.equals("no")){
                        int allowed_leave = new Employee_Category_DAO().getAllowedLeaveForMonthOfEmployee(eat.getEmployee_id());
                        int leave_of_this_month = dao.getTotalLeaveTakenByEmployee(eat.getEmployee_id(), eat.getAttendance_date());
                        if( allowed_leave > leave_of_this_month){
                            eat.setIs_leave("yes");
                        }
                    }
                    if(dao.updateRecord(eat)){
                        message = "Employee Attendance is Updated";
                    }else{
                        message = "Employee Attendance is not updated due to " + dao.getError_message();
                    }
                }
            }else{
                message = "There is no attendance";
            }
        }
    } else {
        message = "Please provide all values";
    }
    session.setAttribute("message", message);
    response.sendRedirect("editattendance.jsp");
%>