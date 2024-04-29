package controller.main;

import dao.AuthenticationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import model.ResetPasswordLink;
import model.User;
import utils.RegexValidator;

/**
 *
 * @author tranh
 */
@WebServlet(name = "ResetPasswordController", urlPatterns = {"/reset-password"})
public class ResetPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            response.sendRedirect("home");
        } else {
            String token = request.getParameter("token");
            if (token == null) {
                response.sendRedirect("forgot-password");
            } else {
                AuthenticationDAO authenticationDAO = new AuthenticationDAO();
                ResetPasswordLink resetPasswordLink = authenticationDAO.getResetPasswordLinkByToken(token);
                if (resetPasswordLink == null || resetPasswordLink.getLinkGeneratedTime().plusHours(24).isBefore(LocalDateTime.now()) || resetPasswordLink.isUsed()) {
                    request.setAttribute("tokenExpired", "This link has expired. Please go back to Homepage and try again.");
                } else {
                    request.setAttribute("token", token);
                }
                request.getRequestDispatcher("view/main/password-reset.jsp").forward(request, response);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String password = request.getParameter("password");
        if (RegexValidator.isMatches("(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}", password)) {
            if (password.equals(request.getParameter("re-password"))) {
                String token = request.getParameter("token");
                AuthenticationDAO authenticationDAO = new AuthenticationDAO();
                ResetPasswordLink resetPasswordLink = authenticationDAO.getResetPasswordLinkByToken(token);
                if (resetPasswordLink == null || resetPasswordLink.getLinkGeneratedTime().plusHours(24).isBefore(LocalDateTime.now()) || resetPasswordLink.isUsed()) {
                    request.setAttribute("tokenExpired", "This link has expired. Please go back to Homepage and try again.");
                    request.getRequestDispatcher("view/main/password-reset.jsp").forward(request, response);
                } else {
                    boolean isSaveNewPassSuccess = authenticationDAO.saveNewPassword(resetPasswordLink.getUserId(), password);
                    boolean isSaveStatusSuccess = authenticationDAO.saveTokenUsedStatus(token, isSaveNewPassSuccess);
                    response.sendRedirect("login?isResetPasswordSuccess=true");
                }
            } else {
                request.setAttribute("rePasswordErr", "Password and Confirm password don’t match. Please try again.");
                request.getRequestDispatcher("view/main/password-reset.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("passwordErr", "Password must contain at least one number, one numeral, and seven characters.");
            request.getRequestDispatcher("view/main/password-reset.jsp").forward(request, response);
        }
    }

}
