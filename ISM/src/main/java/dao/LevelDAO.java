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
import model.Level;
import utils.DBContext;

/**
 *
 * @author acer
 */
public class LevelDAO extends DBContext {
    
    public void update(ArrayList<Level> levels, int jobId) {
        String sql = "DELETE FROM JobLevel WHERE jobId = ?";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.executeUpdate();
                for (Level l : levels) {
                    add(l, jobId);
                }
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    public void add(Level level, int jobId) {
        String sql = "INSERT INTO joblevel (jobId, levelId) VALUES (?, ?)";
        try (Connection conn = DBContext.makeConnection()) {
            try (PreparedStatement state = conn.prepareStatement(sql)) {
                state.setInt(1, jobId);
                state.setLong(2, level.getLevelId());
                state.executeUpdate();
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public ArrayList<Level> list() {
        ArrayList<Level> levelList = new ArrayList<>();
        String sql = "SELECT * FROM Level";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Level level = new Level();
                level.setLevelId(rs.getLong("levelId"));
                level.setLevelName(rs.getString("levelName"));
                // Set other attributes if available in the Level entity

                levelList.add(level);
            }

            return levelList;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public Level get(Long levelId) {
        String sql = "SELECT * FROM Level WHERE levelId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, levelId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return Level.builder().levelId(rs.getLong("levelId")).levelName(rs.getString("levelName")).build();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<Level> getAllLevelsWithJob(int jobId) {
        ArrayList<Level> levels = new ArrayList<>();
        String sql = "SELECT levelId FROM JobLevel WHERE JobId = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, jobId);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                levels.add(get(rs.getLong("levelId")));
            }

            return levels;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

}
