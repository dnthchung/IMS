/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.User;
import model.UserRole;
import model.UserStatus;
import utils.DBContext;

/**
 *
 * @author Vanhle
 */
public class UserDAO {

    //  =========================
    /**
     * USER MANAGEMENT FOR ADMIN
     * I. User
     * II. User Role
     * III. User Status
     */

    //I. User
    //get list all user
    public ArrayList<User> getAllUser() {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = User.builder()
                        .userId(rs.getInt("UserID"))
                        .useName(rs.getString("Usename"))
                        .fullName(rs.getString("FullName"))
                        .password(rs.getString("Password"))
                        .dob(rs.getDate("DOB").toLocalDate())
                        .phoneNumber(rs.getString("PhoneNumber"))
                        .userRoleId(rs.getInt("UserRoleID"))
                        .userStatusID(rs.getInt("UserStatusID"))
                        .email(rs.getString("Email"))
                        .address(rs.getString("Address"))
                        .gender(rs.getInt("Gender"))
                        .departmentID(rs.getInt("DepartmentID"))
                        .note(rs.getString("Note"))
                        .build();
                userList.add(user);
            }
            return userList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    //search by role + FullName + Usename, return list users
    
    //add/create new user
    public boolean addUser(User newUser) {
        String sql = "INSERT INTO [User] (UserName, FullName, Password, DOB, PhoneNumber, UserRoleID, UserStatusID, Email, Address, Gender, DepartmentID, Note) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, newUser.getFullName());
            preparedStatement.setString(2, newUser.getUseName()); 
            preparedStatement.setString(3, newUser.getPassword());
            preparedStatement.setDate(4, Date.valueOf(newUser.getDob()));
            preparedStatement.setString(5, newUser.getPhoneNumber());
            preparedStatement.setInt(6, newUser.getUserRoleId());
            preparedStatement.setInt(7, newUser.getUserStatusID());
            preparedStatement.setString(8, newUser.getEmail());
            preparedStatement.setString(9, newUser.getAddress());
            preparedStatement.setInt(10, newUser.getGender());
            preparedStatement.setInt(11, newUser.getDepartmentID());
            preparedStatement.setString(12, newUser.getNote());

            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return false;
    }
    
    //get 1 user's detail by userID
    public User getUserDetails(int userID) {
        String sql = "SELECT * FROM [User] WHERE UserID = ?";
        try (
            Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setInt(1, userID);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                return User.builder()
                        .userId(rs.getInt("UserID"))
                        .useName(rs.getString("Usename"))
                        .fullName(rs.getString("FullName"))
                        .password(rs.getString("Password"))
                        .dob(rs.getDate("DOB").toLocalDate())
                        .phoneNumber(rs.getString("PhoneNumber"))
                        .userRoleId(rs.getInt("UserRoleID"))
                        .userStatusID(rs.getInt("UserStatusID"))
                        .email(rs.getString("Email"))
                        .address(rs.getString("Address"))
                        .gender(rs.getInt("Gender"))
                        .departmentID(rs.getInt("DepartmentID"))
                        .note(rs.getString("Note"))
                        .build();
            }
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    // Update user details by userID
    public boolean updateUser(User user) {
        String sql = "UPDATE [User] SET FullName = ?, UseName = ?, Password = ?, DOB = ?, "
                + "PhoneNumber = ?, UserRoleID = ?, UserStatusID = ?, Email = ?, "
                + "Address = ?, Gender = ?, DepartmentID = ?, Note = ? WHERE UserID = ?";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, user.getFullName());
            preparedStatement.setString(2, user.getUseName());
            preparedStatement.setString(3, user.getPassword());
            preparedStatement.setDate(4, Date.valueOf(user.getDob()));
            preparedStatement.setString(5, user.getPhoneNumber());
            preparedStatement.setInt(6, user.getUserRoleId());
            preparedStatement.setInt(7, user.getUserStatusID());
            preparedStatement.setString(8, user.getEmail());
            preparedStatement.setString(9, user.getAddress());
            preparedStatement.setInt(10, user.getGender());
            preparedStatement.setInt(11, user.getDepartmentID());
            preparedStatement.setString(12, user.getNote());
            preparedStatement.setLong(13, user.getUserId());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return false;
    }
    
    //II. User Role
    //get all role
    public ArrayList<UserRole> getAllUserRole(){
        ArrayList<UserRole> roleList = new ArrayList<>();
        String sql = "SELECT * FROM [UserRole]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                UserRole role = UserRole.builder()
                        .userRoleId(rs.getInt("UserRoleID"))
                        . roleName(rs.getString("RoleName"))
                        .build();
                roleList.add(role);
            }
            return roleList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }
    
    //III. User status
    //get all status
    public ArrayList<UserStatus> getAllUserStatus() {
        ArrayList<UserStatus> userStatus = new ArrayList<>();
        String sql = "SELECT * FROM [UserStatus]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                UserStatus status = UserStatus.builder()
                        .userStatus(rs.getInt("UserRoleID"))
                        .statusName(rs.getString("RoleName"))
                        .build();
                userStatus.add(status);
            }
            return userStatus;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }
    

    public static void main(String[] args) {
        System.out.println("===Run Main Here===");
//        UserDAO dao = new UserDAO();
//        
//        for (User u : dao.getAll()) {
//            System.out.println(u);
//        }
//        System.out.println("hihi");
//        System.out.println("=====");
//        User uu = dao.getUserDetails(1);
//        System.out.println(uu);
        // Creating an instance of UserDAO
        UserDAO userDAO = new UserDAO();

        User userToUpdate = User.builder()
                .userId(1) // ID of the user to update
                .fullName("NewUserName")
                .useName("NewUseName")
                .password("NewPassword")
                .dob(LocalDate.of(1990, 1, 1))
                .phoneNumber("NewPhoneNumber")
                .userRoleId(2)
                .userStatusID(1)
                .email("new@example.com")
                .address("New Address")
                .gender(1)
                .departmentID(3)
                .note("New note")
                .build();

        // Updating the user
        boolean updated = userDAO.updateUser(userToUpdate);

        if (updated) {
            System.out.println("User details updated successfully.");
        } else {
            System.out.println("Failed to update user details.");
        }
    }

    
}
