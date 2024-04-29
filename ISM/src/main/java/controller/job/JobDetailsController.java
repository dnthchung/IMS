/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import dao.JobDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Job;

/**
 *
 * @author acer
 */
@WebServlet(name = "JobDetailController", urlPatterns = {"/job-details"})
public class JobDetailsController extends JobController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String jobIdParam = request.getParameter("id");
            JobDAO jobService = new JobDAO();
            Job job = jobService.get(Integer.parseInt(jobIdParam));
            request.setAttribute("job", job);
            request.getRequestDispatcher("view/job/job-details.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
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
