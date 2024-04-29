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
import model.Skill;
import utils.DBContext;

/**
 *
 * @author acer
 */
public class SkillDAO extends DBContext {

    public void update(ArrayList<Skill> skills, int jobId) {
        String sql = "DELETE FROM JobSkills WHERE jobId = ?";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.executeUpdate();
                for (Skill s : skills) {
                    add(s, jobId);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public void add(Skill skill, int jobId) {
        String sql = "INSERT INTO jobskills (jobId, skillId) VALUES (?, ?)";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.setLong(2, skill.getSkillId());
                state.executeUpdate();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Skill> list() {
        ArrayList<Skill> skillList = new ArrayList<>();
        String sql = "SELECT * FROM skill";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setSkillId(rs.getLong("skillId"));
                skill.setSkillName(rs.getString("skillName"));

                skillList.add(skill);
            }

            return skillList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Skill get(Long skillId) {
        String sql = "SELECT * FROM Skill WHERE skillId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, skillId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Skill.builder().skillId(rs.getLong("skillId")).skillName(rs.getString("skillName")).build();
            }
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Skill> getAllSkillsWithJob(int jobId) {
        ArrayList<Skill> skills = new ArrayList<>();
        String sql = "SELECT skillId FROM JobSkills WHERE JobId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                skills.add(get(rs.getLong("skillId")));
            }

            return skills;
        } catch (SQLException e) {

            e.printStackTrace();
        }
        return null;
    }

}
