/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import java.time.LocalDate;
import lombok.*;
/**
 *
 * @author chun
 */
@Builder
@Data
@NoArgsConstructor
@AllArgsConstructor
public class ResetPasswordLink {
    private Long resetPasswordId;
    private Long userId;
    private LocalDate linkGeneratedTime;
    private boolean isUsed;
}
