package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Category_TO;
import model.to.Employee_Salary_TO;
import utilities.ErrorHandler;

public class Employee_Salary_DAO extends DAO {

    public boolean insertRecord(Employee_Salary_TO record) {
        try {
            String query = "insert into employee_salary ";
            query += "(employee_id,salary_month,salary_year,basic_salary,gross_salary,salary_date) ";
            query += "values(?,?,?,?,?,sysdate()) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, record.getEmployee_id());
            stmt.setString(2, record.getSalary_month());
            stmt.setInt(3, record.getSalary_year());
            stmt.setFloat(4, record.getBasic_salary());
            stmt.setFloat(5, record.getGross_salary());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }
    
    public boolean updateRecord(int salary_id , float gross_salary) {
        try {
            String query = "update employee_salary ";
            query += " set gross_salary = ? ";
            query += " where salary_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setFloat(1, gross_salary);
            stmt.setInt(2, salary_id);
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public List<Employee_Salary_TO> getAllRecord() {
        try {
            String query = "select salary_id,es.employee_id,salary_month,salary_year,es.basic_salary,gross_salary,salary_date,employee_name ";
            query += " from employee_salary es join employee_info ei ";
            query += " on es.employee_id = ei.employee_id ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Employee_Salary_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Employee_Salary_TO est = new Employee_Salary_TO();
                    est.setSalary_id(rs.getInt("salary_id"));
                    est.setEmployee_id(rs.getInt("employee_id"));
                    est.setSalary_month(rs.getString("salary_month"));
                    est.setSalary_year(rs.getInt("salary_year"));
                    est.setGross_salary(rs.getFloat("gross_salary"));
                    est.setBasic_salary(rs.getFloat("basic_salary"));
                    est.setSalary_date(rs.getTimestamp("salary_date"));
                    est.setEmployee_name(rs.getString("employee_name"));
                    result.add(est);
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

    public Employee_Salary_TO getRecord(int employee_id, String month, int year) {
        try {
            String query = "select salary_id,es.employee_id,salary_month,salary_year,es.basic_salary,gross_salary,salary_date,employee_name ";
            query += " from employee_salary es join employee_info ei ";
            query += " on es.employee_id = ei.employee_id ";
            query += "  where es.employee_id = ? and salary_month = ? and salary_year = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, employee_id);
            stmt.setString(2, month);
            stmt.setInt(3, year);
            Employee_Salary_TO est = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                est = new Employee_Salary_TO();
                est.setSalary_id(rs.getInt("salary_id"));
                est.setEmployee_id(rs.getInt("employee_id"));
                est.setSalary_month(rs.getString("salary_month"));
                est.setSalary_year(rs.getInt("salary_year"));
                est.setGross_salary(rs.getFloat("gross_salary"));
                est.setBasic_salary(rs.getFloat("basic_salary"));
                est.setSalary_date(rs.getTimestamp("salary_date"));
                est.setEmployee_name(rs.getString("employee_name"));
            }
            rs.close();
            stmt.close();
            return est;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return null;
        }
    }

}
