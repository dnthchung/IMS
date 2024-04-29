/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import dao.JobDAO;
import java.io.IOException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Job;

/**
 *
 * @author acer
 */
@WebServlet(name = "JobList", urlPatterns = {"/job-list"})
public class JobListController extends JobController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            JobDAO jobService = new JobDAO();
            ArrayList<Job> jobs = jobService.list();
            request.setAttribute("job", jobs);
            request.setAttribute("URL", "Job List");
            request.getRequestDispatcher("view/job/job-list.jsp").forward(request, response);
        } catch (Exception ex) {
            try {
                response.sendRedirect("/");
            } catch (IOException ex1) {
                Logger.getLogger(JobListController.class.getName()).log(Level.SEVERE, null, ex1);
            }
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    protected boolean authenticated() {
        return true;
    }

}
