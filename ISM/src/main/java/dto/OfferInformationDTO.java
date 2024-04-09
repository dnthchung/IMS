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
public class OfferInformationDTO {
    private Long offerId;
    private String candidateName;
    private String email;
    private String approverName;
    private String departmentName;
    private String note;
    private String statusName;
}
