package model.to;

import java.io.Serializable;
import java.sql.Date;

public class Employee_Attendance_TO implements Serializable{

    private int attendance_id;
    private int employee_id;
    private Date attendance_date;
    private String is_leave;
    private String present_status;
    private String employee_name;

    public int getAttendance_id() {
        return attendance_id;
    }

    public void setAttendance_id(int attendance_id) {
        this.attendance_id = attendance_id;
    }

    public int getEmployee_id() {
        return employee_id;
    }

    public void setEmployee_id(int employee_id) {
        this.employee_id = employee_id;
    }

    public Date getAttendance_date() {
        return attendance_date;
    }

    public void setAttendance_date(Date attendance_date) {
        this.attendance_date = attendance_date;
    }

    public String getIs_leave() {
        return is_leave;
    }

    public void setIs_leave(String is_leave) {
        this.is_leave = is_leave;
    }

    public String getPresent_status() {
        return present_status;
    }

    public void setPresent_status(String present_status) {
        this.present_status = present_status;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }
}
