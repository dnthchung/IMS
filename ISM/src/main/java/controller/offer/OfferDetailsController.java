package controller.offer;

import dao.AuthenticationDAO;
import dao.OfferDAO;
import dto.OfferInformationDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.InterviewSchedule;
import model.User;

/**
 *
 * @author tranh
 */
@WebServlet(name = "OfferDetailsController", urlPatterns = {"/offer-details"})
public class OfferDetailsController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            AuthenticationDAO authenticationDAO = new AuthenticationDAO();
            loggedInUser = authenticationDAO.getUserByID(loggedInUser.getUserId());
            session.setAttribute("loggedInUser", loggedInUser);
            if (loggedInUser.getUserRoleId() != 3 && loggedInUser.getUserStatusId() != 2) {
                try {
                    Long offerId = Long.parseLong(request.getParameter("offerId"));
                    OfferDAO offerDAO = new OfferDAO();
                    OfferInformationDTO offerInformation = offerDAO.getOfferDetailsById(offerId);
                    if (offerInformation == null) {
                        response.sendRedirect("offer-list");
                    } else {
                        request.setAttribute("offerInf", offerInformation);
                        InterviewSchedule interviewSchedule = offerDAO.getInterviewScheduleInfByOfferId(offerId);
                        request.setAttribute("interviewSchedule", interviewSchedule);
                        String interviewers = offerDAO.getInterviewersByScheduleId(interviewSchedule.getInterviewScheduleId());
                        request.setAttribute("interviewers", interviewers);
                        request.setAttribute("URL", "Offer");
                        request.getRequestDispatcher("view/offer/offer-details.jsp").forward(request, response);
                    }
                } catch (NumberFormatException e) {
                    response.sendRedirect("offer-list");
                }
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath() + "?" + request.getQueryString();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }

    }
    
}
