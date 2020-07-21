package model.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Attendance_TO;
import utilities.ErrorHandler;

public class Employee_Attendance_DAO extends DAO {

    public boolean insertRecord(Employee_Attendance_TO record) {
        try {
            String query = "insert into employee_attendance ";
            query += "(employee_id,attendance_date,is_leave,present_status) ";
            query += "values(?,?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, record.getEmployee_id());
            stmt.setDate(2, record.getAttendance_date());
            stmt.setString(3, record.getIs_leave());
            stmt.setString(4, record.getPresent_status());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public boolean updateRecord(Employee_Attendance_TO record) {
        try {
            String query = "update employee_attendance ";
            query += " set is_leave=?,present_status=? ";
            query += " where attendance_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getIs_leave());
            stmt.setString(2, record.getPresent_status());
            stmt.setInt(3,record.getAttendance_id());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }
    
    public List<Employee_Attendance_TO> getAllRecord() {
        try {
            String query = "select attendance_id,ea.employee_id,attendance_date,is_leave,present_status,ei.employee_name ";
            query += " from employee_attendance ea join employee_info ei ";
            query += " on ea.employee_id = ei.employee_id ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Employee_Attendance_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Attendance_TO eat = new Employee_Attendance_TO();
                    eat.setAttendance_id(rs.getInt("attendance_id"));
                    eat.setEmployee_id(rs.getInt("employee_id"));
                    eat.setAttendance_date(rs.getDate("attendance_date"));
                    eat.setIs_leave(rs.getString("is_leave"));
                    eat.setPresent_status(rs.getString("present_status"));
                    eat.setEmployee_name(rs.getString("employee_name"));
                    result.add(eat);
                } while (rs.next());
            }
            rs.close();
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }

    public Employee_Attendance_TO getRecord(int employee_id, Date attendance_date) {
        try {
            String query = "select attendance_id,ea.employee_id,attendance_date,is_leave,present_status,ei.employee_name ";
            query += " from employee_attendance ea join employee_info ei ";
            query += " on ea.employee_id = ei.employee_id ";
            query += " where ea.employee_id = ? and attendance_date = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setDate(2, attendance_date);
            Employee_Attendance_TO eat = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                eat = new Employee_Attendance_TO();
                eat.setAttendance_id(rs.getInt("attendance_id"));
                eat.setEmployee_id(rs.getInt("employee_id"));
                eat.setAttendance_date(rs.getDate("attendance_date"));
                eat.setIs_leave(rs.getString("is_leave"));
                eat.setPresent_status(rs.getString("present_status"));
                eat.setEmployee_name(rs.getString("employee_name"));
            }
            rs.close();
            stmt.close();
            return eat;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }

    public Employee_Attendance_TO getRecord(int attendance_id) {
        try {
            String query = "select attendance_id,ea.employee_id,attendance_date,is_leave,present_status,ei.employee_name ";
            query += " from employee_attendance ea join employee_info ei ";
            query += " on ea.employee_id = ei.employee_id ";
            query += " where attendance_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, attendance_id);
            Employee_Attendance_TO eat = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                eat = new Employee_Attendance_TO();
                eat.setAttendance_id(rs.getInt("attendance_id"));
                eat.setEmployee_id(rs.getInt("employee_id"));
                eat.setAttendance_date(rs.getDate("attendance_date"));
                eat.setIs_leave(rs.getString("is_leave"));
                eat.setPresent_status(rs.getString("present_status"));
                eat.setEmployee_name(rs.getString("employee_name"));
            }
            rs.close();
            stmt.close();
            return eat;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }
    
    public boolean isAttendanceMarked(Date attendance_date) {
        try {
            String query = "select * from employee_attendance ";
            query += " where attendance_date = ?";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setDate(1, attendance_date);
            boolean result = false;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = true;
            }
            rs.close();
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public int getTotalLeaveTakenByEmployee(int employee_id, Date attendance_date) {
        try {
            String query = "select count(*) from employee_attendance ";
            query += " where employee_id = ? and  year(attendance_date) = year(?) and month(attendance_date) = month(?) ";
            query += " and is_leave = 'yes' ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setDate(2, attendance_date);
            stmt.setDate(3, attendance_date);
            int total_leave = 0;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total_leave = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return total_leave;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }

    public int getTotalPresentDay(int employee_id, String month_name, int year) {
        try {
            String query = "select count(*) from employee_attendance ";
            query += " where employee_id = ? and monthname(attendance_date) = ? and  year(attendance_date) = ?  ";
            query += " and ( present_status = 'yes' or ( present_status ='no' and is_leave = 'yes' ))";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setString(2, month_name);
            stmt.setInt(3, year);
            int total_leave = 0;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total_leave = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return total_leave;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }

    public int getTotalAbsentDay(int employee_id, String month_name, int year) {
        try {
            String query = "select count(*) from employee_attendance ";
            query += " where employee_id = ? and monthname(attendance_date) = ? and  year(attendance_date) = ?  ";
            query += " and present_status = 'no' and is_leave = 'no' ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setString(2, month_name);
            stmt.setInt(3, year);
            int total_leave = 0;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total_leave = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return total_leave;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }

    public int getTotalLeaves(int employee_id, String month_name, int year) {
        try {
            String query = "select count(*) from employee_attendance ";
            query += " where employee_id = ? and monthname(attendance_date) = ? and  year(attendance_date) = ?  ";
            query += " and is_leave = 'yes' ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setString(2, month_name);
            stmt.setInt(3, year);
            int total_leave = 0;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                total_leave = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return total_leave;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }

    public boolean validAttendancePeriod(String month_name, int year) {
        try {
            String query = "select * from employee_attendance ";
            query += " where monthname(attendance_date) = ? and  year(attendance_date) = ?  ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, month_name);
            stmt.setInt(2, year);
            boolean result = false;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = true;
                System.out.println(" YES YES ");
            }
            rs.close();
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }
}
