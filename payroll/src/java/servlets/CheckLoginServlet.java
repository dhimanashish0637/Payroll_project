package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.dao.Login_Info_DAO;
import model.to.Login_Info_TO;
import utilities.Validations;

public class CheckLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        String message = "";
        boolean error_status = true;
        if (username != null && password != null) {
            username = username.trim();
            if (Validations.isEmpty(username) || Validations.isEmpty(password)) {
                message = "Please Fill All Boxes";
            } else {
                Login_Info_TO lit = new Login_Info_DAO().getRecord(username);
                if(lit!=null){
                    System.out.println(lit.getPassword() + "\t" + password);
                    if(lit.getPassword().equals(password)){
                        
                        if(lit.getRole_name()!=null){
                            if(lit.getRole_name().equalsIgnoreCase("admin")){
                                error_status = false;
                                session.setAttribute("admin", username);
                                response.sendRedirect("admin/admin_home.jsp");
                            }else if(lit.getRole_name().equalsIgnoreCase("hr")){
                                error_status = false;
                                session.setAttribute("hr", username);
                                response.sendRedirect("hr/hr_home.jsp");
                            }else{
                                message = "Unauthorized Access";
                            }
                        }else{
                            message = "Unauthorized Access";
                        }
                    }else{
                        message ="Invalid User Name/Password Given";
                    }
                }else{
                    message ="Invalid User Name/Password Given";
                }
            }
        }
        if (error_status) {
            session.setAttribute("message", message);
            response.sendRedirect("index.jsp");
        }
    }
}
