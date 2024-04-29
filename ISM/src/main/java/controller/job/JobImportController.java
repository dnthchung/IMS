/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import dao.JobDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.OutputStream;
import org.apache.poi.ss.usermodel.Workbook;
import utils.JobExcelWriter;

/**
 *
 * @author acer
 */
@WebServlet(name = "JobImportController", urlPatterns = {"/job-import"})
public class JobImportController extends JobController {

    @Override
    protected boolean authenticated() {
        return true;
    }

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            response.sendRedirect("home");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            // Set content type and headers for file download
            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment; filename=\"data.xlsx\"");

            // Write data to output stream
            OutputStream outputStream = response.getOutputStream();
            JobDAO jobService = new JobDAO();
            var jobs = jobService.list();
            Workbook workbook = JobExcelWriter.write(jobs);
            workbook.write(outputStream);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
