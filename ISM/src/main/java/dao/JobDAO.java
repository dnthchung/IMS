/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;

import model.Benefit;
import model.Job;
import model.Level;

import model.Skill;
import utils.DBContext;
import java.util.List;

/**
 *
 * @author acer
 */
public class JobDAO extends DBContext {

    private Job getJobFromResultSet(ResultSet rs) {
        try {
            SkillDAO skillService = new SkillDAO();
            LevelDAO levelService = new LevelDAO();
            BenefitDAO benefitService = new BenefitDAO();
            int jobId = rs.getInt("JobId");
            Job job = Job.builder()
                    .jobId(jobId)
                    .jobTitle(rs.getString("JobTitle"))
                    .startDate(rs.getDate("StartDate").toLocalDate())
                    .endDate(rs.getDate("EndDate").toLocalDate())
                    .salaryFrom(rs.getDouble("SalarayFrom"))
                    .salaryTo(rs.getDouble("SalaryTo"))
                    .workAddress(rs.getString("WorkingAddress"))
                    .description(rs.getString("Description"))
                    .status(rs.getBoolean("Status"))
                    .skill(skillService.getAllSkillsWithJob(jobId))
                    .benefit(benefitService.getAllBenefitsWithJob(jobId))
                    .level(levelService.getAllLevelsWithJob(jobId))
                    .build();
            return job;
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public void delete(int id) {
        // Prepare delete queries
        String deleteBenefitsQuery = "DELETE FROM jobbenefits WHERE jobid = ?";
        String deleteSkillsQuery = "DELETE FROM jobskills WHERE jobid = ?";
        String deleteLevelQuery = "DELETE FROM joblevel WHERE jobid = ?";
        String deleteJobsQuery = "DELETE FROM job WHERE jobid = ?";

        try (Connection connection = DBContext.makeConnection()) {
            // Start transaction
            connection.setAutoCommit(false);

            // Create prepared statements
            try (PreparedStatement deleteBenefitsStmt = connection.prepareStatement(deleteBenefitsQuery); PreparedStatement deleteSkillsStmt = connection.prepareStatement(deleteSkillsQuery); PreparedStatement deleteLevelStmt = connection.prepareStatement(deleteLevelQuery); PreparedStatement deleteJobsStmt = connection.prepareStatement(deleteJobsQuery)) {

                // Bind parameters
                deleteBenefitsStmt.setInt(1, id);
                deleteSkillsStmt.setInt(1, id);
                deleteLevelStmt.setInt(1, id);
                deleteJobsStmt.setInt(1, id);

                // Execute delete queries
                deleteBenefitsStmt.executeUpdate();
                deleteSkillsStmt.executeUpdate();
                deleteLevelStmt.executeUpdate();
                deleteJobsStmt.executeUpdate();

                // Commit transaction
                connection.commit();
            } catch (SQLException e) {
                // Rollback transaction if any query fails
                connection.rollback();
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public ArrayList<Job> list() {
        ArrayList<Job> jobList = new ArrayList<>();
        String sql = "SELECT * FROM Job";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                jobList.add(getJobFromResultSet(rs));
            }

            return jobList;
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

    public void add(Job job, List<Skill> skills, List<Benefit> benefits, List<Level> levels) {
        String insertJobQuery = "INSERT INTO job (jobTitle, startDate, endDate, salarayFrom, salaryTo, workingAddress, description, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        String insertSkillQuery = "INSERT INTO jobskills (jobId, skillId) VALUES (?, ?)";
        String insertBenefitQuery = "INSERT INTO jobbenefits (jobId, benefitId) VALUES (?, ?)";
        String insertLevelQuery = "INSERT INTO joblevel (jobId, levelId) VALUES (?, ?)";

        try (Connection conn = DBContext.makeConnection()) {
            conn.setAutoCommit(false); // Bắt đầu transaction

            try (PreparedStatement jobStmt = conn.prepareStatement(insertJobQuery, Statement.RETURN_GENERATED_KEYS)) {
                // Thêm thông tin công việc vào bảng jobs
                jobStmt.setString(1, job.getJobTitle());
                jobStmt.setDate(2, java.sql.Date.valueOf(job.getStartDate()));
                jobStmt.setDate(3, java.sql.Date.valueOf(job.getEndDate()));
                jobStmt.setDouble(4, job.getSalaryFrom());
                jobStmt.setDouble(5, job.getSalaryTo());
                jobStmt.setString(6, job.getWorkAddress());
                jobStmt.setString(7, job.getDescription());
                jobStmt.setBoolean(8, job.getStatus());
                jobStmt.executeUpdate();

                // Lấy ID của công việc vừa được thêm vào
                ResultSet generatedKeys = jobStmt.getGeneratedKeys();
                long jobId;
                if (generatedKeys.next()) {
                    jobId = generatedKeys.getLong(1);

                    // Thêm kỹ năng vào bảng job_skills
                    try (PreparedStatement skillStmt = conn.prepareStatement(insertSkillQuery)) {
                        for (Skill skill : skills) {
                            skillStmt.setLong(1, jobId);
                            skillStmt.setLong(2, skill.getSkillId());
                            skillStmt.addBatch();
                        }
                        skillStmt.executeBatch();
                    }

                    // Thêm lợi ích vào bảng job_benefits
                    try (PreparedStatement benefitStmt = conn.prepareStatement(insertBenefitQuery)) {
                        for (Benefit benefit : benefits) {
                            benefitStmt.setLong(1, jobId);
                            benefitStmt.setLong(2, benefit.getBenefitId());
                            benefitStmt.addBatch();
                        }
                        benefitStmt.executeBatch();
                    }

                    // Thêm cấp độ vào bảng job_levels
                    try (PreparedStatement levelStmt = conn.prepareStatement(insertLevelQuery)) {
                        for (Level level : levels) {
                            levelStmt.setLong(1, jobId);
                            levelStmt.setLong(2, level.getLevelId());
                            levelStmt.addBatch();
                        }
                        levelStmt.executeBatch();
                    }

                    conn.commit(); // Commit transaction
                } else {
                    conn.rollback(); // Rollback transaction nếu không có ID được tạo ra
                }
            } catch (SQLException e) {
                conn.rollback(); // Rollback transaction nếu có lỗi xảy ra
                e.printStackTrace();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // edit
    public Job get(int jobId) {
        Job job = null;
        String sql = "SELECT * FROM Job WHERE JobID = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return getJobFromResultSet(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return job;
    }

    // Cập nhật thông tin công việc
    public boolean update(Job job) {
        String sql = "UPDATE Job SET JobTitle = ?, StartDate = ?, EndDate = ?, SalarayFrom = ?, SalaryTo = ?, "
                + "WorkingAddress = ?, Description = ?, Status = ? WHERE JobID = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, job.getJobTitle());
            preparedStatement.setDate(2, java.sql.Date.valueOf(job.getStartDate()));
            preparedStatement.setDate(3, java.sql.Date.valueOf(job.getEndDate()));
            preparedStatement.setDouble(4, job.getSalaryFrom());
            preparedStatement.setDouble(5, job.getSalaryTo());
            preparedStatement.setString(6, job.getWorkAddress());
            preparedStatement.setString(7, job.getDescription());
            preparedStatement.setBoolean(8, job.getStatus());
            preparedStatement.setInt(9, job.getJobId());

            int rowsAffected = preparedStatement.executeUpdate();
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Your existing methods for retrieving skills, benefits, and levels remain unchanged
    public static void main(String[] args) {
        // Tạo danh sách kỹ năng
        List<Skill> skills = new ArrayList<>();
        Skill skill1 = Skill.builder().skillId(1L).skillName("Programming").build();
        Skill skill2 = Skill.builder().skillId(2L).skillName("Problem Solving").build();
        skills.add(skill1);
        skills.add(skill2);

        // Tạo danh sách lợi ích
        List<Benefit> benefits = new ArrayList<>();
        Benefit benefit1 = Benefit.builder().benefitId(1L).benefitName("Health Insurance").build();
        Benefit benefit2 = Benefit.builder().benefitId(2L).benefitName("Paid Time Off").build();
        benefits.add(benefit1);
        benefits.add(benefit2);

        // Tạo danh sách cấp độ
        List<Level> levels = new ArrayList<>();
        Level level1 = Level.builder().levelId(1L).levelName("Entry Level").build();
        Level level2 = Level.builder().levelId(2L).levelName("Intermediate Level").build();
        levels.add(level1);
        levels.add(level2);

        // Tạo công việc
        Job job = Job.builder()
                .jobId(50)
                .jobTitle("test17-04-lần3")
                .startDate(LocalDate.of(2024, 4, 15))
                .endDate(LocalDate.of(2024, 6, 30))
                .salaryFrom(50000)
                .salaryTo(70000)
                .workAddress("123 Main St, City")
                .description("Develop software applications test")
                .status(false)
                .build();

        // Thêm công việc vào cơ sở dữ liệu
        JobDAO jobService = new JobDAO();
        try {
            jobService.update(job);
            System.out.println("Success");
        } catch (Exception e) {
            System.out.println("Fail");
        }
    }
}
