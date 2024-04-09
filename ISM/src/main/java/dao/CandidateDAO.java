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
import java.util.Collections;
import java.util.List;
import model.Candidate;
import model.CandidateStatus;
import model.Level;
import model.Position;
import model.Skill;
import utils.DBContext;

/**
 *
 * @author Vanhle
 */
public class CandidateDAO {
    //Mapping funtion
    private Position resultPosition(ResultSet rs) throws SQLException {
        Position p = Position.builder()
                .positionId(rs.getLong("PositionID"))
                .positionName(rs.getString("PositionName")).build();
        return p;
    }

    private CandidateStatus resultCandidateStatus(ResultSet rs) throws SQLException {
        CandidateStatus cs = CandidateStatus.builder()
                .candidateStatusId(rs.getLong("CandidateStatusID"))
                .statusName(rs.getString("StatusName")).build();
        return cs;
    }

    private Skill resultSkill(ResultSet rs) throws SQLException {
        Skill s = Skill.builder()
                .skillId(rs.getLong("SkillID"))
                .skillName(rs.getString("SkillName")).build();
        return s;
    }

    private Level resultLevel(ResultSet rs) throws SQLException {
        Level l = Level.builder()
                        .levelId(rs.getLong("LevelID"))
                        .levelName(rs.getString("LevelName")).build();
        return l;
    }
    // End mapping
    
    // 1.Create candidate
    // 1.1 Get all Position
    public List<Position> getAllPositon() {
        List<Position> l = new ArrayList<>();
        String sql = "SELECT * FROM [Position]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Position p = resultPosition(rs);
                l.add(p);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    // 1.2 Get all Candidate Status
    public List<CandidateStatus> getAllStatus() {
        List<CandidateStatus> l = new ArrayList<>();
        String sql = "SELECT * FROM [CandidateStatus]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                CandidateStatus p = resultCandidateStatus(rs);
                l.add(p);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    // 1.3 Get all Skill
    public List<Skill> getAllSkill() {
        List<Skill> l = new ArrayList<>();
        String sql = "SELECT * FROM [Skill]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Skill p = resultSkill(rs);
                l.add(p);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    // 1.4 Get all Level
    public List<Level> getAllLevel() {
        List<Level> l = new ArrayList<>();
        String sql = "SELECT * FROM [Level]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Level p = resultLevel(rs);
                l.add(p);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    // 2 View candidate detail
    // 2.1 
    public List<Skill> getAllSkillByCandidateId(String candidateId) {
        List<Skill> l = new ArrayList<>();
        String sql = "SELECT * FROM Skill s\n"
                + "JOIN CandidateSkills cs\n"
                + "ON s.SkillID = cs.Skills_SkillID\n"
                + "WHERE cs.Candidate_CandidateID = ?";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, candidateId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Skill p = resultSkill(rs);
                l.add(p);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return Collections.emptyList();
    }

    //2.2 Get Position
    public Position getPositionById(Long positionId) {
        String sql = "SELECT * FROM [Position] WHERE PositionID = ?";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, positionId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Position p = resultPosition(rs);
                return p;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    

    //2.2
//    public List<Candidate> getCandidateDetail(String candidateId) {
//        List<Candidate> l = new ArrayList<>();
//        String sql = "";
//        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
//            preparedStatement.setString(1, candidateId);
//            ResultSet rs = preparedStatement.executeQuery();
//            while (rs.next()) {
//                Skill p = Skill.builder()
//                        .skillId(rs.getLong("SkillID"))
//                        .skillName(rs.getString("SkillName")).build();
//                l.add(p);
//            }
//            return l;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return Collections.emptyList();
//    }
    //Ending
    //Test code
    public static void main(String[] args) {
        CandidateDAO dao = new CandidateDAO();
        for (Skill p : dao.getAllSkillByCandidateId("4")) {
            System.out.println(p);
        }
    }
}
