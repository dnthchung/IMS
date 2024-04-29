/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import dao.BenefitDAO;
import dao.JobDAO;
import dao.LevelDAO;
import dao.SkillDAO;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Benefit;
import model.Job;
import model.Level;
import model.Skill;

/**
 *
 * @author acer
 */
@WebServlet(name = "JobEditController", urlPatterns = {"/job-edit"})
public class JobEditController extends JobController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            JobDAO jobService = new JobDAO();
            Job job = jobService.get(Integer.parseInt((String) request.getParameter("id")));
            request.setAttribute("job", job);

            SkillDAO skillService = new SkillDAO();
            BenefitDAO benefitService = new BenefitDAO();
            LevelDAO levelService = new LevelDAO();
            ArrayList<Skill> skills = skillService.list();
            ArrayList<Benefit> benefits = benefitService.list();
            ArrayList<Level> levels = levelService.list();
            request.setAttribute("skills", skills);
            request.setAttribute("benefits", benefits);
            request.setAttribute("levels", levels);
            request.getRequestDispatcher("view/job/job-edit.jsp").forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            int jobId = Integer.parseInt(request.getParameter("id"));
            String jobTitle = request.getParameter("jobTitle");
            LocalDate startDate = LocalDate.parse(request.getParameter("startDate"));
            LocalDate endDate = LocalDate.parse(request.getParameter("endDate"));
            double salaryFrom = Double.parseDouble(request.getParameter("salaryFrom"));
            double salaryTo = Double.parseDouble(request.getParameter("salaryTo"));
            String workAddress = request.getParameter("workAddress");
            String description = request.getParameter("description");
            boolean status = Boolean.parseBoolean(request.getParameter("status"));
            String[] skillParams = request.getParameterValues("skills");
            SkillDAO skillService = new SkillDAO();
            ArrayList<Skill> skills = new ArrayList<>();
            for (String id : skillParams) {
                skills.add(skillService.get(Long.valueOf(id)));
            }
            String[] benefitParams = request.getParameterValues("benefits");
            BenefitDAO benefitService = new BenefitDAO();
            ArrayList<Benefit> benefits = new ArrayList<>();
            for (String id : benefitParams) {
                benefits.add(benefitService.get(Long.valueOf(id)));
            }
            String[] levelParams = request.getParameterValues("levels");
            LevelDAO levelService = new LevelDAO();
            ArrayList<Level> levels = new ArrayList<>();
            for (String id : levelParams) {
                levels.add(levelService.get(Long.valueOf(id)));
            }
            Job job = Job.builder()
                    .jobId(jobId)
                    .jobTitle(jobTitle)
                    .startDate(startDate)
                    .endDate(endDate)
                    .salaryFrom(salaryFrom)
                    .salaryTo(salaryTo)
                    .workAddress(workAddress)
                    .description(description)
                    .status(status)
                    .build();

            benefitService.update(benefits, jobId);
            levelService.update(levels, jobId);
            skillService.update(skills, jobId);
            JobDAO jobService = new JobDAO();
            jobService.update(job);
            response.sendRedirect("job-details?id=" + jobId);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected boolean authenticated() {
        return isAdmin() || isManager() || isRecuiter();
    }

}
