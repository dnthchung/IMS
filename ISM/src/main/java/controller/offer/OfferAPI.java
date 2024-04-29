package controller.offer;

import com.g3.ism.resources.LocalDateTimeAdapter;
import dao.OfferDAO;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import model.InterviewSchedule;

/**
 *
 * @author tranh
 */
@WebServlet(name = "OfferAPI", urlPatterns = {"/offer-api"})
public class OfferAPI extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        OfferDAO offerDAO = new OfferDAO();
        InterviewSchedule interviewSchedule = offerDAO.getInterviewScheduleByCandidateId(Long.parseLong(request.getParameter("candidateId")));
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(LocalDateTime.class, new LocalDateTimeAdapter())
                .create();
        String interviewScheduleJSON = gson.toJson(interviewSchedule);
        response.getWriter().write(interviewScheduleJSON);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
