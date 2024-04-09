/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Job;
import utils.DBContext;

/**
 *
 * @author acer
 */
public class JobDAO extends DBContext{

    public ArrayList<Job> getAllJob()  {
        ArrayList<Job> jobList = new ArrayList<>();
        String sql = "SELECT * FROM [Job]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Job job = Job.builder()
                        .jobId(rs.getInt("JobID"))
                        .jobTitle(rs.getString("jobTitle"))
                        .startDate(rs.getDate("StartDate").toLocalDate())
                        .endDate(rs.getDate("EndDate").toLocalDate())
                        .salaryFrom(rs.getInt("SalarayFrom"))
                        .salaryTo(rs.getInt("SalaryTo"))
                        .workAddress(rs.getString("WorkingAddress"))
                        .description(rs.getString("Description"))
                        .build();
                jobList.add(job);
            }
            return jobList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    public static void main(String[] args) {
        JobDAO dao = new JobDAO();
        ArrayList<Job> j = dao.getAllJob();
        System.out.println(j);
    }
}
