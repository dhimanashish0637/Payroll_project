package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import model.dao.DataConnection;
import utilities.ErrorHandler;

public class DataConnectionClosingListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        try {
            DataConnection.closeConnection();
        } catch (Exception ex) {
            ErrorHandler.handleError(ex);
        }
    }
    
}
