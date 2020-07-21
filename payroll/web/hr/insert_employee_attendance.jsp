<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Attendance_TO"%>
<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="utilities.Validations"%>
<%
    String message = "";
    boolean error_status = false;
    if (request.getParameter("attendance_date") != null) {
        String attendance_date = request.getParameter("attendance_date").trim();
        Date date = null;
        List<Employee_Info_TO> employees = null;
        if (Validations.isEmpty(attendance_date)) {
            error_status = true;
            message += "Please Select Any Attendance Date<br>";
        } else if (Validations.isValidDate(attendance_date)) {
            date = Date.valueOf(attendance_date);
            Calendar c1 = Calendar.getInstance();
            c1.setTime(date);
            int dw = c1.get(Calendar.DAY_OF_WEEK);
            if (dw == Calendar.SATURDAY || dw == Calendar.SUNDAY) {
                message = "This is Official Weekend. So There is no Attendance for Employees";
                error_status = true;
            } else {
                employees = new Employee_Info_DAO().getAllRecord(date);
            }
        } else {
            message = "Please Provide a Valid Date";
            error_status = true;
        }

        if (!error_status) {
            if (employees != null && employees.size() > 0) {
                String[] ids = request.getParameterValues("ids");
                Employee_Attendance_DAO dao = new Employee_Attendance_DAO();
                Employee_Attendance_TO eat = new Employee_Attendance_TO();
                eat.setAttendance_date(date);
                int count = 0;
                for(Employee_Info_TO eit : employees){
                    eat.setPresent_status("no");
                    eat.setIs_leave("no");
                    eat.setEmployee_id(eit.getEmployee_id());
                    if(ids!=null){
                        for(String id : ids){
                            if(eit.getEmployee_id() == Integer.parseInt(id.trim())){
                                eat.setPresent_status("yes");
                                break;
                            }
                        }
                    }
                    if(eat.getPresent_status().equals("no")){
                        int allowed_leave = new Employee_Category_DAO().getAllowedLeaveForMonthOfEmployee(eit.getEmployee_id());
                        int leave_of_this_month = dao.getTotalLeaveTakenByEmployee(eit.getEmployee_id(), date);
                        if( allowed_leave > leave_of_this_month){
                            eat.setIs_leave("yes");
                        }
                    }
                    if(dao.insertRecord(eat)){
                        count++;
                    }
                }
                if(count!=0){
                    message += "Attendance of All Employee of Date : " + attendance_date + " are marked successfully";
                }else{
                    message = "There are Some Error in Attendance Marking";
                    error_status = true;
                }
            } else {
                message = "There is No Employee For Attendance";
                error_status = true;
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
    response.sendRedirect("markattendance.jsp");
%>