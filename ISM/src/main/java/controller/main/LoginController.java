package controller.main;

import dao.AuthenticationDAO;
import dao.UserDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author tranh
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            response.sendRedirect("home");
        } else {
            request.setAttribute("continueUrl", request.getParameter("continueUrl"));
            
            String isResetPasswordSuccess = request.getParameter("isResetPasswordSuccess");
            if (isResetPasswordSuccess != null) {
                request.setAttribute("isResetPasswordSuccess", "Reset password successfully!");
            }
            
            String isBanned = request.getParameter("isBanned");
            if (isBanned != null) {
                request.setAttribute("isLoginError", "Your account has been banned!");
            }
            request.getRequestDispatcher("view/main/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthenticationDAO authenticationDAO = new AuthenticationDAO();
        User user = authenticationDAO.login(request.getParameter("username"), request.getParameter("password"));
        if (user != null) {
            if (user.getUserStatusId() == 2) {
                request.setAttribute("username", request.getParameter("username"));
                request.setAttribute("isLoginError", "Your account has been banned!");
                request.getRequestDispatcher("view/main/login.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("loggedInUser", user);
                UserDAO userDAO = new UserDAO();
                session.setAttribute("userRoles", userDAO.getAllUserRole());

                String continueUrl = request.getParameter("continueUrl");
                if (!continueUrl.equals("")) {
                    response.sendRedirect(continueUrl);
                } else {
                    response.sendRedirect("home");
                }
            }
        } else {
            request.setAttribute("username", request.getParameter("username"));
            request.setAttribute("isLoginError", "Invalid username/password. Please try again");
            request.getRequestDispatcher("view/main/login.jsp").forward(request, response);
        }
    }

}
