/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.util.List;
import lombok.*;

/**
 *
 * @author Vanhle
 */
@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Candidate {
    private Long candidateId;
    private String fullName;
    private LocalDate dob;
    private String phoneNumber;
    private String email;
    private String address;
    private int gender;
    private String cvAttachment;
    private Position position;
    private String note;
    private Long candidateStatusId;
    private int yearOfExperience;
    private Level highestLevel;
    private List<Skill> skills;
    private User createBy;
    private LocalDate lastUpdateAt;
}
