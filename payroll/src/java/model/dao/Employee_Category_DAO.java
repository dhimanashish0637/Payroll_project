package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Category_TO;
import model.to.Salary_Wages_TO;
import utilities.ErrorHandler;

public class Employee_Category_DAO extends DAO {

    public boolean insertRecord(Employee_Category_TO record) {
        try {
            String query = "insert into employee_category ";
            query += "(category_id,category_name,basic_salary,leave_per_month) ";
            query += "values(?,?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getCategory_id());
            stmt.setString(2, record.getCategory_name());
            stmt.setFloat(3, record.getBasic_salary());
            stmt.setInt(4, record.getLeave_per_month());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public List<Employee_Category_TO> getAllRecord() {
        try {
            String query = "select category_id,category_name,basic_salary,leave_per_month ";
            query += " from employee_category ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Employee_Category_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Category_TO ect = new Employee_Category_TO();
                    ect.setCategory_id(rs.getString("category_id"));
                    ect.setCategory_name(rs.getString("category_name"));
                    ect.setBasic_salary(rs.getFloat("basic_salary"));
                    ect.setLeave_per_month(rs.getInt("leave_per_month"));
                    result.add(ect);
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

    public Employee_Category_TO getRecord(int emp_id) {
        try {
            String query = "select category_id,category_name,basic_salary,leave_per_month ";
            query += " from employee_category ";
            query += " where category_id = ( select category_id from employee_info where employee_id = ? ) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1,emp_id);
            Employee_Category_TO ect = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                ect = new Employee_Category_TO();
                ect.setCategory_id(rs.getString("category_id"));
                ect.setCategory_name(rs.getString("category_name"));
                ect.setBasic_salary(rs.getFloat("basic_salary"));
                ect.setLeave_per_month(rs.getInt("leave_per_month"));

            }
            rs.close();
            stmt.close();
            return ect;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }

    public int getAllowedLeaveForMonthOfEmployee(int employee_id) {
        try {
            String query = "select leave_per_month ";
            query += " from employee_category ";
            query += " where category_id = ( select category_id from employee_info ";
            query += " where employee_id = ? ) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            int leave = 0;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                leave = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return leave;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }
}
