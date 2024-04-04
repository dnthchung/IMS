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
import model.User;
import utils.DBContext;

/**
 *
 * @author Vanhle
 */
public class UserDAO {

    public ArrayList<User> getAll() {
        ArrayList<User> l = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [User]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User u = User.builder()
                        .userId(rs.getLong("user_id"))
                        .userName(rs.getString("user_name")).build();
                l.add(u);
            }
            return l;
        } catch (SQLException e) {
            e.printStackTrace();
        }
//        return Collections.emptyList();
        return null;
    }

    public static void main(String[] args) {
        UserDAO dao = new UserDAO();
        for (User u : dao.getAll()) {
            System.out.println(u);
        }
    }
}
