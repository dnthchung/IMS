/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.interview;

import dao.InterviewDAO;
import static dao.InterviewDAO.getAllInterviewStatus;
import static dao.InterviewDAO.getAllInterviewersInformation;
import dto.InterviewDTO;
import dto.InterviewScheduleDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.InterviewSchedule;

/**
 *
 * @author Tuan
 */
@WebServlet(name = "InterviewScheduleEditController", urlPatterns = {"/interview-edit"})
public class InterviewScheduleEditController extends HttpServlet {

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
            out.println("<title>Servlet InterviewScheduleEditController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet InterviewScheduleEditController at " + request.getContextPath() + "</h1>");
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
        String idSchedule = request.getParameter("id");
        
        InterviewScheduleDTO interviewScheduleDTO = InterviewDAO.getInterviewSheduleById(idSchedule);
        request.setAttribute("id", idSchedule);
        request.setAttribute("interviewTitle",interviewScheduleDTO.getScheduleTitle());

        request.setAttribute("jobNameList", InterviewDAO.getAllJobsInformation());
        request.setAttribute("jobName", InterviewDAO.getInterviewSheduleById(idSchedule).getJobName());

        request.setAttribute("candidateList", InterviewDAO.getAllCandidatesInformations());
        request.setAttribute("candidateName", interviewScheduleDTO.getCandidateName());

        request.setAttribute("dateSchedule", interviewScheduleDTO.getScheduleDateToCustom());

        request.setAttribute("timeFrom", interviewScheduleDTO.getTimeFrom());
        request.setAttribute("timeTo", interviewScheduleDTO.getTimeTo());

        request.setAttribute("notes", interviewScheduleDTO.getNotes());

        request.setAttribute("isl", InterviewDAO.getAllInterviewersInformation());
        request.setAttribute("interviewer", InterviewDAO.getInterviewerListById(idSchedule));

        request.setAttribute("locations", interviewScheduleDTO.getLocation());

        request.setAttribute("statusList", interviewScheduleListConvert(InterviewDAO.getAllInterviewScheduleInformations()));
        request.setAttribute("result", interviewScheduleDTO.getResult());
        request.setAttribute("meetingID", interviewScheduleDTO.getMeetingId());

        request.getRequestDispatcher("view/interview/interview-edit.jsp").forward(request, response);
    }

    public static List<String> interviewScheduleListConvert(List<InterviewScheduleDTO> listInterview) {
        List<String> listString = new ArrayList<>();
        for (InterviewScheduleDTO o : listInterview) {
            listString.add(o.getResult());
        }
        Set<String> set = new HashSet<>(listString);
        List<String> list = new ArrayList<>(set);
        return list;
    }

    public static void main(String[] args) {

        for (String o : interviewScheduleListConvert(InterviewDAO.getAllInterviewScheduleInformations())) {
            System.out.println(o);
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
        String id = request.getParameter("id");
        String scheduleTitle = request.getParameter("scheduleTitle");
        String jobid = request.getParameter("jobName");
        String candidateid = request.getParameter("candidate-name");
        String date = request.getParameter("dateSchedule");
        String timeStart = date + " " + request.getParameter("timeStart");
        String timeEnd = date + " " + request.getParameter("timeEnd");
        String interviewName = request.getParameter("interviewName");
        String userId = request.getParameter("interviewName");
        String location = request.getParameter("location");
        String notes = request.getParameter("notes");
        String meetingID = request.getParameter("meetingID");
        String result = request.getParameter("result");
   
        System.out.println("------");
        System.out.println(scheduleTitle);
        System.out.println(jobid);
        System.out.println(candidateid);
        System.out.println(timeEnd);
        System.out.println(interviewName);
        System.out.println(location);
        System.out.println(notes);
        System.out.println(result);
        System.out.println(meetingID);
        InterviewSchedule interviewSchedule = InterviewSchedule.builder()
                .interviewScheduleId(Long.parseLong(id))
                .scheduleTitle(scheduleTitle)
                .jobId(Long.parseLong(jobid))
                .candidateId(Long.parseLong(candidateid))
                .scheduleDateFrom(LocalDateTime.now())
                .scheduleDateTo(LocalDateTime.now())
                .location("Da Nang")
                .userId(Long.parseLong(userId))
                .notes(notes)
                .meetingId(meetingID)
                .result(result)
                .interviewStatusId(1L)
                .build(); 
        
        InterviewDAO.updateInterviewSchedule(interviewSchedule);
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
