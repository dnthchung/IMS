/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.OfferInformationDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.ContractType;
import model.Offer;
import model.OfferStatus;
import utils.DBContext;

/**
 *
 * @author tranh
 */
public class OfferDAO {

    public static void main(String[] args) {
        OfferDAO offerDAO = new OfferDAO();
        for (OfferStatus o : offerDAO.getAllOfferStatuses()) {
            System.out.println(o);
        }
    }

    public List<OfferInformationDTO> getAllOfferInformations() {
        List<OfferInformationDTO> offerInformationDTOs = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT o.OfferID\n"
                        + "      ,c.FullName AS [CandidateName]\n"
                        + "	  ,c.Email\n"
                        + "      ,u.FullName AS [ApproverName]\n"
                        + "      ,d.DepartmentName\n"
                        + "      ,o.Note\n"
                        + "      ,os.StatusName\n"
                        + "  FROM [Offer] o\n"
                        + "  JOIN [Candidate] c on o.CandidateID = c.CandidateID\n"
                        + "  JOIN [User] u ON o.Approver = u.UserID\n"
                        + "  JOIN [Department] d ON o.DepartmentID = d.DepartmentID\n"
                        + "  JOIN [OfferStatus] os ON o.OfferStatusID = os.OfferStatusID")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                OfferInformationDTO offer = OfferInformationDTO.builder()
                        .offerId(rs.getLong("OfferID"))
                        .candidateName(rs.getString("CandidateName"))
                        .email(rs.getString("Email"))
                        .approverName(rs.getString("ApproverName"))
                        .departmentName(rs.getString("DepartmentName"))
                        .note(rs.getString("Note"))
                        .statusName(rs.getString("StatusName"))
                        .build();
                offerInformationDTOs.add(offer);
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offerInformationDTOs;
    }
    
    public List<OfferStatus> getAllOfferStatuses() {
        List<OfferStatus> offerStatuses = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [OfferStatus]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                OfferStatus offerStatus = OfferStatus.builder()
                        .offerStatusId(rs.getLong("OfferStatusID"))
                        .statusName(rs.getString("StatusName"))
                        .build();
                offerStatuses.add(offerStatus);
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offerStatuses;
    }

    public List<Offer> getAllOffers() {
        List<Offer> offers = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [Offer]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Offer offer = Offer.builder()
                        .offerId(rs.getLong("OfferID"))
                        .candidateId(rs.getLong("CandidateID"))
                        .contractTypeId(rs.getLong("ContractTypeID"))
                        .positionId(rs.getLong("PositionID"))
                        .levelId(rs.getLong("LevelID"))
                        .appover(rs.getLong("Approver"))
                        .departmentId(rs.getLong("DepartmentID"))
                        .interviewScheduleId(rs.getLong("InterviewScheduleID"))
                        .recuiterOwner(rs.getLong("RecuiterOwner"))
                        .contractFrom(rs.getDate("ContractFrom"))
                        .contractTo(rs.getDate("ContractTo"))
                        .dueDate(rs.getDate("DueDate"))
                        .basicSalary(rs.getDouble("BasicSalary"))
                        .note(rs.getString("Note"))
                        .offerStatusId(rs.getLong("OfferStatusID"))
                        .build();
                offers.add(offer);
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return offers;
    }

    public List<ContractType> getAllContractTypes() {
        List<ContractType> contractTypes = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [ContractType]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ContractType contractType = ContractType.builder()
                        .contractTypeID(rs.getLong(1))
                        .typeName(rs.getString(2))
                        .build();
                contractTypes.add(contractType);
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractTypes;
    }

    public List<ContractType> getAllPositions() {
        List<ContractType> contractTypes = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [Position]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                ContractType contractType = ContractType.builder()
                        .contractTypeID(rs.getLong(1))
                        .typeName(rs.getString(2))
                        .build();
                contractTypes.add(contractType);
            }
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractTypes;
    }

}
