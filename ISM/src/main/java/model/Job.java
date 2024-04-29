/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import lombok.*;

@Builder
@Data
@lombok.NoArgsConstructor
@lombok.AllArgsConstructor
public class Job {

    private int jobId;
    private String jobTitle;
    private LocalDate startDate;
    private LocalDate endDate;
    private double salaryFrom;
    private double salaryTo;
    private String workAddress;
    private String description;
    private Boolean status;
    private ArrayList<Benefit> benefit;
    private ArrayList<Skill> skill;
    private ArrayList<Level> level;

    public String getFormatedSalary(double salary) {
        String val = String.format("%.0f", salary);
        String amount = val.replace(".", "");
        StringBuilder formattedAmount = new StringBuilder();
        int endPoint = amount.indexOf(".");
        if (endPoint < 0) {
            endPoint = amount.length();
        }
        int count = 0;
        for (int i = endPoint - 1; i >= 0; i--) {
            formattedAmount.insert(0, amount.charAt(i));
            count++;

            if (count % 3 == 0 && i > 0) {
                formattedAmount.insert(0, ",");
            }
        }
        return formattedAmount.toString() + " VND";
    }
    
    public String getFormatedDate(LocalDate date) {
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
        return date.format(formatter);
    }
}
