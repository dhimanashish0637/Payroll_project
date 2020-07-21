package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Salary_Details_TO;
import utilities.ErrorHandler;

public class Employee_Salary_Details_DAO extends DAO {

    public boolean insertRecord(Employee_Salary_Details_TO record) {
        try {
            String query = "insert into employee_salary_details ";
            query += "(salary_id,wage_id,wage_amount,wage_percentage) ";
            query += "values(?,?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, record.getSalary_id());
            stmt.setInt(2, record.getWage_id());
            stmt.setFloat(3, record.getWage_amount());
            stmt.setFloat(4, record.getWage_percentage());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public List<Employee_Salary_Details_TO> getAllRecord() {
        try {
            String query = "select salary_details_id,esd.salary_id,wage_id,wage_amount,wage_percentage,esd.wage_name ";
            query += " from employee_salary_details esd join salary_wages sw ";
            query += " on esd.wage_id = sw.wage_id ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Employee_Salary_Details_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Salary_Details_TO esdt = new Employee_Salary_Details_TO();
                    esdt.setSalary_details_id(rs.getInt("salary_details_id"));
                    esdt.setSalary_id(rs.getInt("salary_id"));
                    esdt.setWage_id(rs.getInt("wage_id"));
                    esdt.setWage_amount(rs.getFloat("wage_amount"));
                    esdt.setWage_percentage(rs.getFloat("wage_percentage"));
                    esdt.setWage_name(rs.getString("wage_name"));
                    result.add(esdt);
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

    public List<Employee_Salary_Details_TO> getAllRecord(int salary_id) {
        try {
            String query = "select salary_details_id,esd.salary_id,esd.wage_id,esd.wage_amount,esd.wage_percentage,sw.wage_name,sw.wage_type ";
            query += " from employee_salary_details esd join salary_wages sw ";
            query += " on esd.wage_id = sw.wage_id ";
            query += " where salary_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1,salary_id);
            List<Employee_Salary_Details_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Salary_Details_TO esdt = new Employee_Salary_Details_TO();
                    esdt.setSalary_details_id(rs.getInt("salary_details_id"));
                    esdt.setSalary_id(rs.getInt("salary_id"));
                    esdt.setWage_id(rs.getInt("wage_id"));
                    esdt.setWage_amount(rs.getFloat("wage_amount"));
                    esdt.setWage_percentage(rs.getFloat("wage_percentage"));
                    esdt.setWage_name(rs.getString("wage_name"));
                    esdt.setWage_type(rs.getString("wage_type"));
                    result.add(esdt);
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

}
