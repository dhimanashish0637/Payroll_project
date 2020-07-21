package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Salary_Wages_TO;
import utilities.ErrorHandler;

public class Salary_Wages_DAO extends DAO {

    public boolean insertRecord(Salary_Wages_TO record) {
        try {
            String query = "insert into salary_wages ";
            query += "(wage_name,wage_percentage,wage_type) ";
            query += "values(?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getWage_name());
            stmt.setFloat(2, record.getWage_percentage());
            stmt.setString(3, record.getWage_type());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public boolean updateRecord(Salary_Wages_TO record) {
        try {
            String query = "update salary_wages ";
            query += " set wage_name=?,wage_percentage=?,wage_type=? ";
            query += " where wage_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getWage_name());
            stmt.setFloat(2, record.getWage_percentage());
            stmt.setString(3, record.getWage_type());
            stmt.setInt(4, record.getWage_id());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public boolean deleteRecord(int wage_id) {
        try {
            String query = "delete from salary_wages ";
            query += " where wage_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, wage_id);
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public Salary_Wages_TO getRecord(int wage_id) {
        try {
            String query = "select wage_id,wage_name,wage_percentage,wage_type ";
            query += " from salary_wages ";
            query += " where wage_id = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setInt(1, wage_id);
            Salary_Wages_TO result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new Salary_Wages_TO();
                result.setWage_id(rs.getInt("wage_id"));
                result.setWage_name(rs.getString("wage_name"));
                result.setWage_percentage(rs.getFloat("wage_percentage"));
                result.setWage_type(rs.getString("wage_type"));
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

    public List<Salary_Wages_TO> getAllRecord() {
        try {
            String query = "select wage_id,wage_name,wage_percentage,wage_type ";
            query += " from salary_wages ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Salary_Wages_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Salary_Wages_TO swt = new Salary_Wages_TO();
                    swt.setWage_id(rs.getInt("wage_id"));
                    swt.setWage_name(rs.getString("wage_name"));
                    swt.setWage_percentage(rs.getFloat("wage_percentage"));
                    swt.setWage_type(rs.getString("wage_type"));
                    result.add(swt);
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
