package model.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import utilities.ErrorHandler;

public class CommonDAO extends DAO {

    public int getLastInsertID() {
        try {
            String query = "select last_insert_id()";
            PreparedStatement stmt = DataConnection.getStatement(query);
            ResultSet rs = stmt.executeQuery();
            int result = 0;
            if (rs.next()) {
                result = rs.getInt(1);
            }
            rs.close();
            stmt.close();
            return result;
        } catch (Exception ex) {
            error_message = ex.getMessage();
            ErrorHandler.handleError(ex);
            return 0;
        }
    }
}
