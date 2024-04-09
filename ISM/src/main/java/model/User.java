/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import lombok.*;

@Builder
@Data
@lombok.NoArgsConstructor
@lombok.AllArgsConstructor
public class User {
    private int userId;
    private String fullName;
    private String useName;
    private String password;
    private LocalDate dob;
    private String phoneNumber;
    private int userRoleId;
    private int userStatusID;
    private String email;
    private String address;
    private int gender;
    private int departmentID;
    private String note;
    
}
