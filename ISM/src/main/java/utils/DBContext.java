/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Vanhle
 */
public class DBContext {

    public static Connection makeConnection() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String username = "sqlserver";
            String password = "12345678";
            String url = "jdbc:sqlserver://34.143.186.49;databaseName=InterviewSystem;encrypt=true;trustServerCertificate=true";//3. Open Connection
            return DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | SQLException exception) {
            exception.printStackTrace();
        }
        return null;
    }
    public static void main(String[] args) {
        System.out.println(makeConnection());
    }
}
