/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.interview;

import dao.InterviewDAO;
import dao.OfferDAO;
import dto.InterviewScheduleDTO;
import dto.OfferInformationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import model.InterviewSchedule;
import model.InterviewStatus;
import model.Job;
import model.User;

/**
 *
 * @author Tuan
 */
@WebServlet(name = "InterviewScheduleCreateController", urlPatterns = {"/interview-create"})
public class InterviewScheduleCreateController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet InterviewScheduleCreateController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InterviewScheduleCreateController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            if (loggedInUser.getUserRoleId() != 3) {
               request.setAttribute("URL", "Create Interview Schedule");
        request.setAttribute("recruiter", InterviewDAO.getAllRecruiterInformation());
        request.setAttribute("interviewer", InterviewDAO.getAllInterviewersInformation());
        request.setAttribute("candidateList", InterviewDAO.getAllCandidatesInformations());
        request.setAttribute("job",  InterviewDAO.getAllJobsInformation());
      
        request.getRequestDispatcher("view/interview/interview-create.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }
      
        

    }

  
    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //format datetime parameter
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
        
        String scheduleTitle = request.getParameter("scheduleTitle");
        String  jobid = request.getParameter("jobName");
        String candidateid = request.getParameter("candidate-name");
        String date = request.getParameter("dateSchedule");
        String timeStart = date + " "+request.getParameter("timeStart");
        String timeEnd = date + " "+request.getParameter("timeEnd");
        String interviewName = request.getParameter("interviewName");
        String userId = request.getParameter("interviewName");
        String location = request.getParameter("location");
        String notes = request.getParameter("notes");
        String meetingID = request.getParameter("meetingID");
        String statusId = request.getParameter("");
        
//        System.out.println("------");
//        System.out.println(scheduleTitle);
//        System.out.println(jobid);
//        System.out.println(candidateid);
//        System.out.println(timeEnd);
//        System.out.println(interviewName);
//        System.out.println(location);
//        System.out.println(notes);
//        System.out.println(statusId);
//        System.out.println(meetingID);
        InterviewSchedule interviewSchedule = InterviewSchedule.builder()
                .scheduleTitle(scheduleTitle)
                .jobId(Long.parseLong(jobid))
                .candidateId(Long.parseLong(candidateid))
                .scheduleDateFrom(LocalDateTime.parse(timeStart, formatter))
                .scheduleDateTo(LocalDateTime.parse(timeEnd, formatter))
                .location(location)
                .userId(Long.parseLong(userId))
                .notes(notes)
                .meetingId(meetingID)
                .result(" ")
                .interviewStatusId(Long.parseLong("1")).build(); 
        
        InterviewDAO.saveInterview(interviewSchedule);
        response.sendRedirect("interview-list");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
