package model.dao;

import java.sql.*;
import utilities.ErrorHandler;

public class DataConnection {

    private static Connection con = null;

    private DataConnection() {
    }

    public static Connection getConnection() throws Exception {
        if (con == null) {
            Class.forName("com.mysql.jdbc.Driver");
            String connectionurl = "jdbc:mysql://localhost:3306/payroll_system";
            String dbuser = "root";
            String dbpass = "";
            con = DriverManager.getConnection(connectionurl, dbuser, dbpass);
        }
        return con;
    }

    public static PreparedStatement getStatement(String query) throws Exception {
        PreparedStatement stmt = getConnection().prepareStatement(query);
        return stmt;
    }

    public static void closeConnection() throws Exception {
        if (con != null) {
            con.close();
        }
        con = null;
    }
}
