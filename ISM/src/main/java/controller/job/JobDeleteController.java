/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import dao.JobDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "JobDeleteController", urlPatterns = {"/job-delete"})
public class JobDeleteController extends JobController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String idParam = request.getParameter("id");
            JobDAO jobService = new JobDAO();
            jobService.delete(Integer.parseInt(idParam));
            response.sendRedirect("job-list");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) {
    }

    @Override
    protected boolean authenticated() {
        return isAdmin() || isManager() || isRecuiter();
    }

}
