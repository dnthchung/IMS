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
     * IV. Department
     */

    //I. User
    //get list all user
    public ArrayList<User> getAllUser()  {
        ArrayList<User> userList = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User user = User.builder()
                        .userId(rs.getLong("UserID"))
                        .useName(rs.getString("Usename"))
                        .fullName(rs.getString("FullName"))
                        .password(rs.getString("Password"))
                        .dob(rs.getDate("DOB").toLocalDate())
                        .phoneNumber(rs.getString("PhoneNumber"))
                        .userRoleId(rs.getInt("UserRoleID"))
                        .userStatusId(rs.getInt("UserStatusID"))
                        .email(rs.getString("Email"))
                        .address(rs.getString("Address"))
                        .gender(rs.getInt("Gender"))
                        .departmentId(rs.getLong("DepartmentID"))
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
            preparedStatement.setInt(7, newUser.getUserStatusId());
            preparedStatement.setString(8, newUser.getEmail());
            preparedStatement.setString(9, newUser.getAddress());
            preparedStatement.setInt(10, newUser.getGender());
            preparedStatement.setLong(11, newUser.getDepartmentId());
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
                        .userId(rs.getLong("UserID"))
                        .useName(rs.getString("Usename"))
                        .fullName(rs.getString("FullName"))
                        .password(rs.getString("Password"))
                        .dob(rs.getDate("DOB").toLocalDate())
                        .phoneNumber(rs.getString("PhoneNumber"))
                        .userRoleId(rs.getInt("UserRoleID"))
                        .userStatusId(rs.getInt("UserStatusID"))
                        .email(rs.getString("Email"))
                        .address(rs.getString("Address"))
                        .gender(rs.getInt("Gender"))
                        .departmentId(rs.getLong("DepartmentID"))
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
            preparedStatement.setInt(7, user.getUserStatusId());
            preparedStatement.setString(8, user.getEmail());
            preparedStatement.setString(9, user.getAddress());
            preparedStatement.setInt(10, user.getGender());
            preparedStatement.setLong(11, user.getDepartmentId());
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
                        .userRoleId(rs.getLong("UserRoleID"))
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
                        .userStatusId(rs.getLong("UserStatusID"))
                        .statusName(rs.getString("StatusName"))
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
    
    //IV. Department
    public static void main(String[] args) {
        System.out.println("===Run Main Here===");
        UserDAO udao = new UserDAO();
        // Test getAllUserRole method
        ArrayList<UserRole> roleList = udao.getAllUserRole();
        if (roleList != null) {
            System.out.println("User Role List:");
            for (UserRole role : roleList) {
                System.out.println(role);
            }
        } else {
            System.out.println("Failed to retrieve user role list.");
        }

        // Test getAllUserStatus method
        ArrayList<UserStatus> statusList = udao.getAllUserStatus();
        if (statusList != null) {
            System.out.println("User Status List:");
            for (UserStatus status : statusList) {
                System.out.println(status);
            }
        } else {
            System.out.println("Failed to retrieve user status list.");
        }

    }
   
}
