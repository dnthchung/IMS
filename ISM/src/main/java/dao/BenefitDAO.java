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
import model.Benefit;
import utils.DBContext;

/**
 *
 * @author acer
 */
public class BenefitDAO extends DBContext {

    public void update(ArrayList<Benefit> benefits, int jobId) {
        String sql = "DELETE FROM JobBenefits WHERE jobId = ?";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.executeUpdate();
                for (Benefit l : benefits) {
                    add(l, jobId);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void add(Benefit benefit, int jobId) {
        String sql = "INSERT INTO jobbenefits (jobId, benefitId) VALUES (?, ?)";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.setLong(2, benefit.getBenefitId());
                state.executeUpdate();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Benefit> list() {
        ArrayList<Benefit> benefitList = new ArrayList<>();
        String sql = "SELECT * FROM Benefit";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Benefit benefit = new Benefit();
                benefit.setBenefitId(rs.getLong("benefitId"));
                benefit.setBenefitName(rs.getString("benefitName"));
                // Set other attributes if available in the Benefit entity

                benefitList.add(benefit);
            }

            return benefitList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Benefit get(Long benefitId) {
        String sql = "SELECT * FROM Benefit WHERE benefitId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, benefitId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Benefit.builder().benefitId(rs.getLong("benefitId")).benefitName(rs.getString("benefitName")).build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Benefit> getAllBenefitsWithJob(int jobId) {
        ArrayList<Benefit> benefits = new ArrayList<>();
        String sql = "SELECT benefitId FROM JobBenefits WHERE JobId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                benefits.add(get(rs.getLong("benefitId")));
            }

            return benefits;
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

}
