<%@page import="model.to.Employee_Salary_Details_TO"%>
<%@page import="model.dao.Employee_Salary_Details_DAO"%>
<%@page import="model.dao.CommonDAO"%>
<%@page import="model.dao.Employee_Salary_DAO"%>
<%@page import="model.dao.Employee_Attendance_DAO"%>
<%@page import="model.to.Employee_Salary_TO"%>
<%@page import="model.dao.Salary_Wages_DAO"%>
<%@page import="model.to.Salary_Wages_TO"%>
<%@page import="java.util.List"%>
<%@page import="model.dao.Employee_Category_DAO"%>
<%@page import="model.to.Employee_Category_TO"%>
<%@page import="utilities.MonthNames"%>
<%@page import="java.sql.Date"%>
<%@page import="model.dao.Employee_Info_DAO"%>
<%@page import="model.to.Employee_Info_TO"%>
<%@page import="model.dao.Login_Info_DAO"%>
<%@page import="model.to.Login_Info_TO"%>
<%@page import="utilities.Validations"%>
<%
    String url = "generatesalary.jsp";
    if (request.getParameter("employee_id") != null && request.getParameter("month_name") != null
            && request.getParameter("year") != null && request.getParameter("total_working_days") != null) {
        String employee_id = request.getParameter("employee_id").trim();
        String month_name = request.getParameter("month_name").trim();
        String year = request.getParameter("year").trim();
        String total_working_days = request.getParameter("total_working_days").trim();
        url += "?month_name=" + month_name + "&year=" + year;
        boolean all_valid = true;
        if (Validations.isEmpty(employee_id)) {
            all_valid = false;
        } else if (!Validations.isNumber(employee_id)) {
            all_valid = false;
        }
        if (Validations.isEmpty(month_name)) {
            all_valid = false;
        } else {
            try {
                MonthNames.valueOf(month_name);
            } catch (Exception ex) {
                all_valid = false;
            }
        }
        if (Validations.isEmpty(year)) {
            all_valid = false;
        } else if (!Validations.isNumber(year)) {
            all_valid = false;
        }
        if (Validations.isEmpty(total_working_days)) {
            all_valid = false;
        } else if (!Validations.isNumber(total_working_days)) {
            all_valid = false;
        }
        if (all_valid) {
            int emp_id = Integer.parseInt(employee_id);
            int working_days = Integer.parseInt(total_working_days);
            int salary_year = Integer.parseInt(year);
            Employee_Category_TO ect = new Employee_Category_DAO().getRecord(emp_id);
            if (ect != null) {
                float gross_salary = 0;
                int total_present = new Employee_Attendance_DAO().getTotalPresentDay(emp_id, month_name, salary_year);
                Employee_Salary_TO est = new Employee_Salary_TO();
                est.setEmployee_id(emp_id);
                est.setSalary_month(month_name);
                est.setSalary_year(salary_year);
                est.setBasic_salary(ect.getBasic_salary());
                gross_salary = (ect.getBasic_salary() / working_days) * total_present;
                est.setGross_salary(gross_salary);
                Employee_Salary_DAO esdao = new Employee_Salary_DAO();
                if (esdao.insertRecord(est)) {
                    int salary_id = new CommonDAO().getLastInsertID();
                    if (salary_id != 0) {
                        List<Salary_Wages_TO> wages = new Salary_Wages_DAO().getAllRecord();
                        if (wages != null && wages.size() > 0) {
                            Employee_Salary_Details_DAO dao1 = new Employee_Salary_Details_DAO();
                            for (Salary_Wages_TO wage : wages) {
                                Employee_Salary_Details_TO record = new Employee_Salary_Details_TO();
                                record.setSalary_id(salary_id);
                                record.setWage_id(wage.getWage_id());
                                record.setWage_percentage(wage.getWage_percentage());
                                float wage_amount = ect.getBasic_salary() / 100 * wage.getWage_percentage();                                
                                if (wage.getWage_type().equalsIgnoreCase("additions")) {
                                    gross_salary += wage_amount;
                                    record.setWage_amount(wage_amount);
                                } else {
                                    gross_salary -= wage_amount;
                                    record.setWage_amount(-wage_amount);
                                }
                                dao1.insertRecord(record);
                            }
                        }
                        esdao.updateRecord(salary_id, gross_salary);
                    }
                }
            }
        }
    }
    response.sendRedirect(url);
%>