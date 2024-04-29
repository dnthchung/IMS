/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author Tuan
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class InterviewScheduleDTO {
    private String interviewScheduleID;
    private String scheduleTitle;
    private String candidateName;
    
    private LocalDateTime scheduleDateFrom;
    private LocalDateTime scheduleDateTo;
    private String jobName;
    private String location;
    private String interviewerUsername;
    private String notes;
    private String meetingId;
    private String result;
    private String statusName;
    
    //1. get date YY-mm-DD 
    public String getScheduleDateToCustom() {
        return scheduleDateTo.getYear()+ "-" + ((scheduleDateTo.getMonthValue()<10 )  ? "0"+scheduleDateTo.getMonthValue():scheduleDateTo.getMonthValue())
                +"-" + scheduleDateTo.getDayOfMonth();
    }
     //1. get date YY-mm-DD 
    public String getScheduleDateToCustom2() {
        return ((scheduleDateTo.getMonthValue()<10 )  ? "0"+scheduleDateTo.getMonthValue():scheduleDateTo.getMonthValue())
                +"-" + scheduleDateTo.getDayOfMonth()+"-"+scheduleDateTo.getYear();
    }
    
    //2. get start time 
    public String getTimeFrom(){
        return  (scheduleDateFrom.getHour()<10 ? "0"+ scheduleDateFrom.getHour():scheduleDateFrom.getHour())+
                ":"+ 
                (scheduleDateFrom.getMinute()<10 ? "0"+ scheduleDateFrom.getMinute():scheduleDateFrom.getMinute());
    }
     public String getTimeTo(){
        return scheduleDateTo.getHour()+":"+ (scheduleDateTo.getMinute()<10 ? "0"+ scheduleDateTo.getMinute():scheduleDateTo.getMinute());
    }
}
