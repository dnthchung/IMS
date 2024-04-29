/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 *
 * @author tranh
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class OfferExportDTO {
    private String offerId;
    private String candidateId;
    private String candidateName;
    private String candidateEmail;
    private String candidateCV;
    private String contractType;
    private String position;
    private String level;
    private String department;
    private String approverAccount;
    private String recruiterAccount;
    private String contractFrom;
    private String contractTo;
    private String offerDueDate;
    private String basicSalary;
    private String offerStatus;
    private String note;
    private String createdOn;
    private String lastModified;
    private String modifiedBy;
}
