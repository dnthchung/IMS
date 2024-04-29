/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import dto.InterviewDTO;
import dto.InterviewScheduleDTO;
import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Candidate;
import model.InterviewSchedule;
import model.InterviewStatus;
import model.Interviewer;
import model.Job;

import model.User;
import model.UserRole;
import model.UserStatus;
import utils.DBContext;

/**
 *
 * @author Tuan
 */
public class InterviewDAO {

    private static InterviewStatus resultStatus(ResultSet rs) throws SQLException {
        InterviewStatus p = InterviewStatus.builder()
                .interviewStatusId(rs.getLong("InterviewstatusID"))
                .statusName(rs.getString("statusName")).build();
        return p;
    }

    //1.get interviewStatus
    public static ArrayList<InterviewStatus> getAllInterviewStatus() {
        ArrayList<InterviewStatus> interviewStatusList = new ArrayList<>();
        String sql = "SELECT InterviewStatusID, StatusName FROM [interviewStatus]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                InterviewStatus p = InterviewStatus.builder()
                        .interviewStatusId(rs.getLong("InterviewStatusID"))
                        .statusName(rs.getString("StatusName")).build();
                interviewStatusList.add(p);
            }
            return interviewStatusList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    public static InterviewScheduleDTO getInterviewSheduleById(String id) {
        String sql = "SELECT * FROM dbo.InterviewSchedule Il\n"
                + "             JOIN dbo.Candidate c ON c.CandidateID = Il.CandidateID\n"
                + "             JOIN dbo.InterviewStatus ON InterviewStatus.InterviewStatusID = Il.InterviewStatusID\n"
                + "		JOIN dbo.[User] ON [User].UserID = Il.UserID\n"
                + "             JOIN dbo.Job ON Job.JobID = Il.JobID\n"
                + "             WHERE Il.InterviewScheduleID = ?";

        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, id);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                InterviewScheduleDTO interviewSchedule = InterviewScheduleDTO.builder()
                        .interviewScheduleID(rs.getString("InterviewScheduleID"))
                        .scheduleTitle(rs.getString("ScheduleTitle"))
                        .candidateName(rs.getString("Fullname"))
                        .scheduleDateFrom(rs.getTimestamp("ScheduleDateFrom").toLocalDateTime())
                        .scheduleDateTo(rs.getTimestamp("ScheduleDateTo").toLocalDateTime())
                        .notes(rs.getString("Notes"))
                        .jobName(rs.getString("jobTitle"))
                        .interviewerUsername(rs.getString("usename"))
                        .location(rs.getString("location"))
                        .meetingId(rs.getString("meetingid"))
                        .result(rs.getString("result"))
                        .statusName(rs.getString("statusName"))
                        .build();
                return interviewSchedule;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public InterviewStatus getStatusById(Long statusID) {
        String sql = "SELECT * FROM [InterviewStatus] WHERE StatusID = ?";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            preparedStatement.setLong(1, statusID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                InterviewStatus interviewStatus = resultStatus(rs);
                return interviewStatus;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //get interviewer by ID
    public static List<String> getInterviewerListById(String ID) {
        List<String> listInterview = new ArrayList<>();
        String sql = "SELECT Usename FROM dbo.Interviewer\n"
                + "JOIN dbo.[User] ON [User].UserID = Interviewer.UserID\n"
                + "WHERE InterviewScheduleID = ?";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, ID);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                String username = rs.getString(1);
                listInterview.add(username);

            }
            return listInterview;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
//2. Get interviewers

    public static ArrayList<UserDTO> getAllInterviewersInformation() {
        ArrayList<UserDTO> interviewerList = new ArrayList<>();
        String sql = "Select *from [user] where USERROLEID = 3";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                UserDTO interviewr = UserDTO.builder()
                        .userId(rs.getLong("UserID"))
                        .username(rs.getString("usename"))
                        .build();
                interviewerList.add(interviewr);
            }
            return interviewerList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }
//2. Get recruiter

    public static ArrayList<UserDTO> getAllRecruiterInformation() {
        ArrayList<UserDTO> interviewerList = new ArrayList<>();
        String sql = "SELECT *From [User] where UserRoleID = 2";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                UserDTO interviewr = UserDTO.builder()
                        .userId(rs.getLong("UserID"))
                        .username(rs.getString("usename"))
                        .build();
                interviewerList.add(interviewr);
            }
            return interviewerList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    //2. Get job
    public static ArrayList<Job> getAllJobsInformation() {
        ArrayList<Job> jobList = new ArrayList<>();
        String sql = "SELECT * FROM [Job]";
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Job status = Job.builder()
                        .jobId(rs.getInt("jobId"))
                        .jobTitle(rs.getString("jobTitle"))
                        .build();
                jobList.add(status);
            }
            return jobList;
        } catch (SQLException e) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, e);
            e.printStackTrace();
        }
        return null;
    }

    public static List<User> getAllUsersInformations() {
        List<User> userList = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [User]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                User interviewSchedule = User.builder()
                        .useName(rs.getString("FullName"))
                        .userId(rs.getLong("UserId"))
                        .build();
                userList.add(interviewSchedule);
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
        return userList;
    }

//3.get candidate information
    public static List<Candidate> getAllCandidatesInformations() {
        List<Candidate> candidateList = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM [Candidate]")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                Candidate candidate = Candidate.builder()
                        .candidateId(rs.getLong("candidateID"))
                        .fullName(rs.getString("FullName"))
                        .build();
                candidateList.add(candidate);
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
        return candidateList;
    }

    public static boolean saveInterview(InterviewSchedule interviewSchedule) {
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("INSERT INTO dbo.InterviewSchedule"
                        + "("
                        + "    ScheduleTitle,"
                        + "    JobID,"
                        + "    CandidateID,"
                        + "    ScheduleDateFrom,"
                        + "    ScheduleDateTo,"
                        + "    Location,"
                        + "    UserID,"
                        + "    Notes,"
                        + "    MeetingID,"
                        + "    Result,"
                        + "    InterviewStatusID"
                        + ")"
                        + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, interviewSchedule.getScheduleTitle());
            preparedStatement.setLong(2, interviewSchedule.getJobId());
            preparedStatement.setLong(3, interviewSchedule.getCandidateId());
            preparedStatement.setTimestamp(4, Timestamp.valueOf(interviewSchedule.getScheduleDateFrom()));
            preparedStatement.setTimestamp(5, Timestamp.valueOf(interviewSchedule.getScheduleDateTo()));
            preparedStatement.setString(6, interviewSchedule.getLocation());
            preparedStatement.setLong(7, interviewSchedule.getUserId());
            preparedStatement.setString(8, interviewSchedule.getNotes());
            preparedStatement.setString(9, interviewSchedule.getMeetingId());
            preparedStatement.setString(10, interviewSchedule.getResult());
            preparedStatement.setLong(11, interviewSchedule.getInterviewStatusId());
            int result = preparedStatement.executeUpdate();
            if (result > 0) {
                return true;
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
        return false;
    }

    public static int getToltalPage(String txtSearch, int status) {
       String query = "";
        if (status == 1 || status == 0 )
         query = "SELECT * FROM dbo.InterviewSchedule Il\n" +
"           JOIN dbo.Candidate c ON c.CandidateID = Il.CandidateID          \n" +
"		   JOIN dbo.InterviewStatus ON InterviewStatus.InterviewStatusID = Il.InterviewStatusID\n" +
"			JOIN dbo.[User] ON [User].UserID = Il.UserID\n" +
"             JOIN dbo.Job ON Job.JobID = Il.JobID\n" +
"			 WHERE \n" +
"			 Il.ScheduleTitle LIKE ? OR \n" +
"			 Il.UserID LIKE ? AND Il.UserID = 2 OR \n" +
"			 c.FullName LIKE ? OR \n" +
"			 Il.Result LIKE ? OR \n" +
"			 JobTitle LIKE ? \n" +
"			 AND Status = " + status;
          
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement(query)) {
            preparedStatement.setString(1,  "%"+txtSearch+ "%");
            preparedStatement.setString(2, "%"+txtSearch+ "%");
            preparedStatement.setString(3,  "%"+txtSearch+ "%");
            preparedStatement.setString(4,  "%"+txtSearch+ "%");
            preparedStatement.setString(5,  "%"+txtSearch+ "%");
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);

            }
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public static List<InterviewScheduleDTO> getAllInterviewScheduleInformations() {
        List<InterviewScheduleDTO> interviewScheduleList = new ArrayList<>();
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("SELECT * FROM dbo.InterviewSchedule Il\n"
                        + "               JOIN dbo.Candidate c ON c.CandidateID = Il.CandidateID\n"
                        + "                JOIN dbo.InterviewStatus ON InterviewStatus.InterviewStatusID = Il.InterviewStatusID\n"
                        + "				JOIN dbo.[User] ON [User].UserID = Il.UserID\n"
                        + "               JOIN dbo.Job ON Job.JobID = Il.JobID\n"
                        + "             ")) {
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                InterviewScheduleDTO interviewSchedule = InterviewScheduleDTO.builder()
                        .interviewScheduleID(rs.getString("InterviewScheduleID"))
                        .scheduleTitle(rs.getString("ScheduleTitle"))
                        .candidateName(rs.getString("Fullname"))
                        .scheduleDateFrom(rs.getTimestamp("ScheduleDateFrom").toLocalDateTime())
                        .scheduleDateTo(rs.getTimestamp("ScheduleDateTo").toLocalDateTime())
                        .notes(rs.getString("Notes"))
                        .jobName(rs.getString("jobTitle"))
                        .interviewerUsername(rs.getString("usename"))
                        .location(rs.getString("location"))
                        .meetingId(rs.getString("meetingid"))
                        .result(rs.getString("result"))
                        .statusName(rs.getString("statusName"))
                        .build();
                interviewScheduleList.add(interviewSchedule);
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
        return interviewScheduleList;
    }

    public static boolean updateInterviewSchedule(InterviewSchedule interviewSchedule) {
        try (Connection connection = DBContext.makeConnection(); PreparedStatement preparedStatement
                = connection.prepareStatement("UPDATE [InterviewSchedule] \n"
                        + "SET "
                        + "    [ScheduleTitle] = ?, \n"
                        + "    [JobID] = ?, \n"
                        + "    [CandidateID] = ?, \n"
                        + "    [ScheduleDateFrom] = ?, \n"
                        + "    [ScheduleDateTo] = ?, \n"
                        + "    [Location] = ?, \n"
                        + "    [UserID] = ?, \n"
                        + "    [Notes] = ?, \n"
                        + "    [MeetingID] = ?, \n"
                        + "    [Result] = ?, \n"
                        + "    [InterviewStatusID] = ? \n"
                        + "WHERE InterviewScheduleID = ?")) {

            preparedStatement.setString(1, interviewSchedule.getScheduleTitle());
            preparedStatement.setLong(2, interviewSchedule.getJobId());
            preparedStatement.setLong(3, interviewSchedule.getCandidateId());
            preparedStatement.setTimestamp(4, Timestamp.valueOf(interviewSchedule.getScheduleDateFrom()));
            preparedStatement.setTimestamp(5, Timestamp.valueOf(interviewSchedule.getScheduleDateTo()));
            preparedStatement.setString(6, interviewSchedule.getLocation());
            preparedStatement.setLong(7, interviewSchedule.getUserId());
            preparedStatement.setString(8, interviewSchedule.getNotes());
            preparedStatement.setString(9, interviewSchedule.getMeetingId());
            preparedStatement.setString(10, interviewSchedule.getResult());
            preparedStatement.setLong(11, interviewSchedule.getInterviewStatusId());
            preparedStatement.setLong(12, interviewSchedule.getInterviewScheduleId());
            int rs = preparedStatement.executeUpdate();
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
            if (rs > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    //========TEST DATA==========
    public static void main(String[] args) {
        System.out.println("===Run Main Here===");
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss");

        InterviewSchedule interviewSchedule = InterviewSchedule.builder()
                .interviewScheduleId(12L)
                .scheduleTitle("BA intern")
                .jobId(Long.parseLong("1"))
                .candidateId(Long.parseLong("5"))
                .scheduleDateFrom(LocalDateTime.now())
                .scheduleDateTo(LocalDateTime.now())
                .location("Da Nang")
                .userId(Long.parseLong("2"))
                .notes("Ngay em ")
                .meetingId("Heee")
                .result("He")
                .interviewStatusId(Long.parseLong("2")).build();
        System.out.println(updateInterviewSchedule(interviewSchedule));

        System.out.println(getToltalPage("i",1));
    }

}
