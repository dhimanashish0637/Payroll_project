package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.to.Employee_Category_TO;
import model.to.Login_Info_TO;
import utilities.ErrorHandler;

public class Login_Info_DAO extends DAO {

    public boolean insertRecord(Login_Info_TO record) {
        try {
            String query = "insert into login_info ";
            query += "(user_name,password,email_id,role_name) ";
            query += "values(?,?,?,?) ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, record.getUser_name());
            stmt.setString(2, record.getPassword());
            stmt.setString(3, record.getEmail_id());
            stmt.setString(4, record.getRole_name());
            boolean result = stmt.executeUpdate() > 0;
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return false;
        }
    }

    public List<Login_Info_TO> getAllRecord() {
        try {
            String query = "select user_name,password,email_id,role_name,last_login ";
            query += " from login_info ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            List<Login_Info_TO> result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new ArrayList<>();
                do {
                    Login_Info_TO lit = new Login_Info_TO();
                    lit.setUser_name(rs.getString("user_name"));
                    lit.setPassword(rs.getString("password"));
                    lit.setEmail_id(rs.getString("email_id"));
                    lit.setRole_name(rs.getString("role_name"));
                    lit.setLast_login(rs.getTimestamp("last_login"));
                    result.add(lit);
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

    public Login_Info_TO getRecord(String username) {
        try {
            String query = "select user_name,password,email_id,role_name,last_login ";
            query += " from login_info ";
            query += " where user_name = ? ";
            PreparedStatement stmt = DataConnection.getStatement(query);
            stmt.setString(1, username);
            Login_Info_TO result = null;
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                result = new Login_Info_TO();
                System.out.println( " DONE ");
                result.setUser_name(rs.getString("user_name"));
                result.setPassword(rs.getString("password"));
                result.setEmail_id(rs.getString("email_id"));
                result.setRole_name(rs.getString("role_name"));
                result.setLast_login(rs.getTimestamp("last_login"));
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
