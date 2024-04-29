package controller.main;

import dao.AuthenticationDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;
import utils.CodeGenerator;
import utils.EmailSender;

/**
 *
 * @author tranh
 */
@WebServlet(name = "ForgotPasswordController", urlPatterns = {"/forgot-password"})
public class ForgotPasswordController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            response.sendRedirect("home");
        } else {
            request.getRequestDispatcher("view/main/password-forgot.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AuthenticationDAO authenticationDAO = new AuthenticationDAO();
        String email = request.getParameter("email");
        User user = authenticationDAO.getUserByEmail(email);
        if (user == null) {
            request.setAttribute("enteredEmail", email);
            request.setAttribute("notExistEmailError", "The email address doesn’t exist. Please try again.");
        } else if (user.getUserStatusId() == 2) {
            request.setAttribute("enteredEmail", email);
            request.setAttribute("notExistEmailError", "This user is bannned!");
        } else {
            authenticationDAO.disableAllValidTokenOfUser(user.getUserId());
            String token = CodeGenerator.generateToken();
            authenticationDAO.saveResetPasswordToken(user, token);
            EmailSender sender = new EmailSender();
            sender.setTo(user.getEmail());
            sender.setSubject("Password Reset");
            sender.setContent("<p>We have just received a password reset request for <strong>" + user.getEmail() + "</strong>.</p>\n"
                    + "<p>Please click <a href=\"http://localhost:9999/ISM/reset-password?token=" + token + "\">here</a> to reset your password.</p>\n"
                    + "<p>For your security, the link will expire in 24 hours or immediately after you reset your password.</p>\n"
                    + "<p>Thanks &amp; Regards!</p>\n"
                    + "<p>IMS Team.</p>");
            sender.start();
            request.setAttribute("enteredEmail", user.getEmail());
            request.setAttribute("sendLinkSuccess", "We've sent an email with the link to reset your password.");
        }
        request.getRequestDispatcher("view/main/password-forgot.jsp").forward(request, response);
    }

}
