package model.dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Info_TO;
import utilities.ErrorHandler;

public class Employee_Info_DAO extends DAO {

    public boolean insertRecord(Employee_Info_TO record) {
        try {
            String query = "insert into employee_info ";
            query += "(employee_name,father_name,address,pan_no,aadhar_no,category_id,date_of_birth,date_of_joining) ";
            query += "values(?,?,?,?,?,?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getEmployee_name());
            stmt.setString(2, record.getFather_name());
            stmt.setString(3, record.getAddress());
            stmt.setString(4, record.getPan_no());
            stmt.setString(5, record.getAadhar_no());
            stmt.setString(6, record.getCategory_id());
            stmt.setDate(7, record.getDate_of_birth());
            stmt.setDate(8, record.getDate_of_joining());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }
    
    public boolean deleteRecord(int employee_id) {
        try {
            String query = "delete from employee_info ";            
            query += " where employee_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1,employee_id);
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }
    
    public boolean updateRecord(Employee_Info_TO record) {
        try {
            String query = "update employee_info ";
            query += " set employee_name=?,father_name=?,address=?,pan_no=?,aadhar_no=?,category_id=?,date_of_birth=?,date_of_joining=? ";
            query += " where employee_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getEmployee_name());
            stmt.setString(2, record.getFather_name());
            stmt.setString(3, record.getAddress());
            stmt.setString(4, record.getPan_no());
            stmt.setString(5, record.getAadhar_no());
            stmt.setString(6, record.getCategory_id());
            stmt.setDate(7, record.getDate_of_birth());
            stmt.setDate(8, record.getDate_of_joining());
            stmt.setInt(9,record.getEmployee_id());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public List<Employee_Info_TO> getAllRecord() {
        try {
            String query = "select employee_id,employee_name,father_name,address,pan_no,aadhar_no,category_id,date_of_birth,date_of_joining ";
            query += " from employee_info ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Employee_Info_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Info_TO eit = new Employee_Info_TO();
                    eit.setEmployee_id(rs.getInt("employee_id"));
                    eit.setEmployee_name(rs.getString("employee_name"));
                    eit.setFather_name(rs.getString("father_name"));
                    eit.setAddress(rs.getString("address"));
                    eit.setPan_no(rs.getString("pan_no"));
                    eit.setAadhar_no(rs.getString("aadhar_no"));
                    eit.setCategory_id(rs.getString("category_id"));
                    eit.setDate_of_birth(rs.getDate("date_of_birth"));
                    eit.setDate_of_joining(rs.getDate("date_of_joining"));
                    result.add(eit);
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

    public List<Employee_Info_TO> getAllRecord(Date attendance_date) {
        try {
            String query = "select employee_id,employee_name,father_name,address,pan_no,aadhar_no,ei.category_id,date_of_birth,date_of_joining,category_name ";
            query += " from employee_info ei join employee_category ec ";
            query += " on ei.category_id = ec.category_id ";
            query += " where ei.date_of_joining <= ?";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setDate(1, attendance_date);
            List<Employee_Info_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Info_TO eit = new Employee_Info_TO();
                    eit.setEmployee_id(rs.getInt("employee_id"));
                    eit.setEmployee_name(rs.getString("employee_name"));
                    eit.setFather_name(rs.getString("father_name"));
                    eit.setAddress(rs.getString("address"));
                    eit.setPan_no(rs.getString("pan_no"));
                    eit.setAadhar_no(rs.getString("aadhar_no"));
                    eit.setCategory_id(rs.getString("category_id"));
                    eit.setDate_of_birth(rs.getDate("date_of_birth"));
                    eit.setDate_of_joining(rs.getDate("date_of_joining"));
                    eit.setCategory_name(rs.getString("category_name"));
                    result.add(eit);
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

    public List<Employee_Info_TO> getAllRecord(String category_id) {
        try {
            String query = "select employee_id,employee_name,father_name,address,pan_no,aadhar_no,category_id,date_of_birth,date_of_joining ";
            query += " from employee_info ";
            query += " where category_id = ?";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, category_id);
            List<Employee_Info_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Info_TO eit = new Employee_Info_TO();
                    eit.setEmployee_id(rs.getInt("employee_id"));
                    eit.setEmployee_name(rs.getString("employee_name"));
                    eit.setFather_name(rs.getString("father_name"));
                    eit.setAddress(rs.getString("address"));
                    eit.setPan_no(rs.getString("pan_no"));
                    eit.setAadhar_no(rs.getString("aadhar_no"));
                    eit.setCategory_id(rs.getString("category_id"));
                    eit.setDate_of_birth(rs.getDate("date_of_birth"));
                    eit.setDate_of_joining(rs.getDate("date_of_joining"));
                    result.add(eit);
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

    public List<Employee_Info_TO> getAllRecord(int month, int year) {
        try {
            String query = "select employee_id,employee_name,father_name,address,pan_no,aadhar_no,ei.category_id,date_of_birth,date_of_joining,category_name ";
            query += " from employee_info ei join employee_category ec ";
            query += " on ei.category_id = ec.category_id ";
            query += " where ( month(ei.date_of_joining) <= ? and year(ei.date_of_joining) = ? ) ";
            query += " or year(ei.date_of_joining) <= ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, month);
            stmt.setInt(2, year);
            stmt.setInt(3, year);
            List<Employee_Info_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Info_TO eit = new Employee_Info_TO();
                    eit.setEmployee_id(rs.getInt("employee_id"));
                    eit.setEmployee_name(rs.getString("employee_name"));
                    eit.setFather_name(rs.getString("father_name"));
                    eit.setAddress(rs.getString("address"));
                    eit.setPan_no(rs.getString("pan_no"));
                    eit.setAadhar_no(rs.getString("aadhar_no"));
                    eit.setCategory_id(rs.getString("category_id"));
                    eit.setDate_of_birth(rs.getDate("date_of_birth"));
                    eit.setDate_of_joining(rs.getDate("date_of_joining"));
                    eit.setCategory_name(rs.getString("category_name"));
                    result.add(eit);
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

    public Employee_Info_TO getRecord(int employee_id) {
        try {
            String query = "select employee_id,employee_name,father_name,address,pan_no,aadhar_no,category_id,date_of_birth,date_of_joining ";
            query += " from employee_info ";
            query += " where employee_id = ?";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1,employee_id);
            Employee_Info_TO eit = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                eit = new Employee_Info_TO();
                eit.setEmployee_id(rs.getInt("employee_id"));
                eit.setEmployee_name(rs.getString("employee_name"));
                eit.setFather_name(rs.getString("father_name"));
                eit.setAddress(rs.getString("address"));
                eit.setPan_no(rs.getString("pan_no"));
                eit.setAadhar_no(rs.getString("aadhar_no"));
                eit.setCategory_id(rs.getString("category_id"));
                eit.setDate_of_birth(rs.getDate("date_of_birth"));
                eit.setDate_of_joining(rs.getDate("date_of_joining"));
            }
            rs.close();
            stmt.close();
            return eit;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }
}
