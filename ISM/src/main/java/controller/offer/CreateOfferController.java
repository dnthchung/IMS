package controller.offer;

import dao.AuthenticationDAO;
import dao.OfferDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Objects;
import model.Candidate;
import model.ContractType;
import model.Department;
import model.InterviewSchedule;
import model.Level;
import model.Offer;
import model.Position;
import model.User;

/**
 *
 * @author tranh
 */
@WebServlet(name = "CreateOfferServlet", urlPatterns = {"/create-offer"})
public class CreateOfferController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            AuthenticationDAO authenticationDAO = new AuthenticationDAO();
            loggedInUser = authenticationDAO.getUserByID(loggedInUser.getUserId());
            session.setAttribute("loggedInUser", loggedInUser);
            if (loggedInUser.getUserRoleId() != 3 && loggedInUser.getUserStatusId() != 2) {
                OfferDAO offerDAO = new OfferDAO();
                List<Candidate> offerableCandidate = offerDAO.getOfferableCandidates();
                request.setAttribute("offerableCandidate", offerableCandidate);
                List<User> activeManagers = offerDAO.getAllActiveManager();
                request.setAttribute("activeManagers", activeManagers);
                List<User> activeRecuiters = offerDAO.getAllActiveRecuiter();
                request.setAttribute("activeRecuiters", activeRecuiters);
                getSystemOfferValues(request);
                request.setAttribute("URL", "Offer");
                request.getRequestDispatcher("view/offer/offer-create.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }
    }

    private void getSystemOfferValues(HttpServletRequest request) {
        OfferDAO offerDAO = new OfferDAO();
        List<ContractType> contractTypes = offerDAO.getAllContractTypes();
        request.setAttribute("contractTypes", contractTypes);

        List<Position> positions = offerDAO.getAllPositions();
        request.setAttribute("positions", positions);

        List<Level> levels = offerDAO.getAllLevels();
        request.setAttribute("levels", levels);

        List<Department> departments = offerDAO.getAllDepartments();
        request.setAttribute("departments", departments);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            AuthenticationDAO authenticationDAO = new AuthenticationDAO();
            loggedInUser = authenticationDAO.getUserByID(loggedInUser.getUserId());
            session.setAttribute("loggedInUser", loggedInUser);
            if (loggedInUser.getUserRoleId() != 3 && loggedInUser.getUserStatusId() != 2) {
                try {
                    boolean isContinueSave = true;
                    OfferDAO offerDAO = new OfferDAO();
                    // Validate candidate
                    Long candidateID = getLongValue(request.getParameter("candidateId"), "candidateErr", "Invalid candidate", request);
                    List<Candidate> offerableCandidate = offerDAO.getOfferableCandidates();
                    boolean isValidCandidate = false;
                    for (Candidate candidate : offerableCandidate) {
                        if (Objects.equals(candidate.getCandidateId(), candidateID)) {
                            isValidCandidate = true;
                            break;
                        }
                    }
                    if (!isValidCandidate) {
                        request.setAttribute("candidateErr", "Cannot create offer for this candidate!");
                        System.out.println("Err candidate");
                        isContinueSave = false;
                    }

                    Long contractTypeID = getLongValue(request.getParameter("contractTypeID"), "contractTypeErr", "Invalid contract type", request);
                    List<ContractType> contractTypes = offerDAO.getAllContractTypes();
                    boolean isValidContractType = false;
                    for (ContractType contractType : contractTypes) {
                        if (Objects.equals(contractType.getContractTypeID(), contractTypeID)) {
                            isValidContractType = true;
                            break;
                        }
                    }
                    if (!isValidContractType) {
                        request.setAttribute("contractErr", "Invalid contract type!");
                        System.out.println("Err contract");
                        isContinueSave = false;
                    }

                    Long positionID = getLongValue(request.getParameter("positionId"), "positionErr", "Invalid position", request);
                    List<Position> positions = offerDAO.getAllPositions();
                    boolean isValidPosition = false;
                    for (Position position : positions) {
                        if (Objects.equals(position.getPositionId(), positionID)) {
                            isValidPosition = true;
                            break;
                        }
                    }
                    if (!isValidPosition) {
                        request.setAttribute("positionErr", "Invalid position!");
                        System.out.println("Err position");
                        isContinueSave = false;
                    }

                    Long levelID = getLongValue(request.getParameter("levelId"), "levelErr", "Invalid level", request);
                    List<Level> levels = offerDAO.getAllLevels();
                    boolean isValidLevel = false;
                    for (Level level : levels) {
                        if (Objects.equals(level.getLevelId(), levelID)) {
                            isValidLevel = true;
                            break; 
                        }
                    }
                    if (!isValidLevel) {  
                        request.setAttribute("levelErr", "Invalid level!");
                        System.out.println("Err level");
                        isContinueSave = false;
                    }

                    Long approverID = getLongValue(request.getParameter("approverId"), "approverErr", "Invalid approver", request);
                    List<User> approvers = offerDAO.getAllActiveManager();
                    boolean isValidApprover = false;
                    for (User approver : approvers) {
                        if (Objects.equals(approver.getUserId(), approverID)) {
                            isValidApprover = true;
                            break;
                        }
                    }
                    if (!isValidApprover) {
                        request.setAttribute("approverErr", "Invalid approver!");
                        System.out.println("Err manager");
                        isContinueSave = false;
                    }

                    Long departmentID = getLongValue(request.getParameter("departmentId"), "departmentErr", "Invalid department", request);
                    List<Department> departments = offerDAO.getAllDepartments();
                    boolean isValidDepartment = false;
                    for (Department department : departments) {
                        if (Objects.equals(department.getDepartmentId(), departmentID)) {
                            isValidDepartment = true;
                            break;
                        }
                    }
                    if (!isValidDepartment) {
                        request.setAttribute("departmentErr", "Invalid department!");
                        System.out.println("Err department");
                        isContinueSave = false;
                    }

                    Long interviewID = getLongValue(request.getParameter("interviewScheduleId"), "interviewErr", "Invalid interview schedule", request);
                    if (isValidCandidate) {
                        List<InterviewSchedule> interviews = offerDAO.getInterviewSchedulesByCandidateId(candidateID);
                        boolean isValidInterview = false;
                        for (InterviewSchedule interview : interviews) {
                            if (Objects.equals(interview.getInterviewScheduleId(), interviewID)) {
                                isValidInterview = true;
                                break;
                            }
                        }
                        if (!isValidInterview) {
                            request.setAttribute("interviewErr", "Invalid interview schedule!");
                            System.out.println("Err interview");
                            isContinueSave = false;
                        }
                    }

                    Long recruiterID = getLongValue(request.getParameter("recruiterId"), "recruiterErr", "Invalid recruiter", request);
                    List<User> activeRecuiters = offerDAO.getAllActiveRecuiter();
                    boolean isValidInterview = false;
                    for (User activeRecuiter : activeRecuiters) {
                        if (Objects.equals(activeRecuiter.getUserId(), recruiterID)) {
                            isValidInterview = true;
                            break;
                        }
                    }
                    if (!isValidInterview) {
                        request.setAttribute("recruiterErr", "Invalid recruiter!");
                        System.out.println("err recruiter");
                        isContinueSave = false;
                    }

                    Date contractFrom = getDateValue(request.getParameter("startDate"), "contractDateErr", "Invalid date format!", request);
                    Date contractTo = getDateValue(request.getParameter("endDate"), "contractDateErr", "Invalid date format!", request);
                    if (!checkSevenDays(contractFrom)) {
                        request.setAttribute("contractDateErr", "Invalid start date!");
                        System.out.println("Err 7 contract from");
                        isContinueSave = false;
                    }
                    if (!checkRangeMonths(contractFrom, contractTo, request.getParameter("contractTypeID"))) {
                        System.out.println("Err month range");
                        request.setAttribute("contractDateErr", "Invalid to date!");
                        isContinueSave = false;
                    }

                    Date dueDate = getDateValue(request.getParameter("dueDate"), "dueDateErr", "Invalid date format!", request);
                    Calendar calendar = Calendar.getInstance();
                    calendar.setTime(new Date());
                    calendar.add(Calendar.DAY_OF_MONTH, -1);
                    Date yesterday = calendar.getTime();
                    if (!dueDate.before(contractFrom) || dueDate.before(yesterday)) {
                        System.out.println("Err due date");
                        request.setAttribute("dueDateErr", "Invalid offer due date!");
                        isContinueSave = false;
                    }

                    String salaryStr = request.getParameter("salary").replaceAll("\\D", "");
                    Double salary = Double.valueOf(salaryStr);
                    if (salary < 1000000) {
                        request.setAttribute("salaryErr", "Min: 1.000.000 VND!");
                        System.out.println("Err salary");
                        isContinueSave = false;
                    }

                    String note = request.getParameter("note");

                    if (isContinueSave) {
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd/MM/yyyy");
                        Offer offer = Offer.builder()
                                .candidateId(candidateID)
                                .contractTypeId(contractTypeID)
                                .positionId(positionID)
                                .levelId(levelID)
                                .appover(approverID)
                                .departmentId(departmentID)
                                .interviewScheduleId(interviewID)
                                .recuiterOwner(recruiterID)
                                .contractFrom(LocalDate.parse(request.getParameter("startDate"), formatter))
                                .contractTo(LocalDate.parse(request.getParameter("endDate"), formatter))
                                .dueDate(LocalDate.parse(request.getParameter("dueDate"), formatter))
                                .basicSalary(salary)
                                .note(note)
                                .offerStatusId(1L)
                                .createdAt(LocalDateTime.now())
                                .modifiedBy(loggedInUser.getUserId())
                                .modifiedAt(LocalDateTime.now())
                                .build();
                        offerDAO.saveOffer(offer);
                        response.sendRedirect("offer-list?isCreateOfferSuccess=true");
                    } else {
                        request.setAttribute("isInvalidData", "Invalid data! Please check again.");
                        System.out.println("Invalid data");
                        doGet(request, response);
                    }

                } catch (NumberFormatException e) {
                    e.printStackTrace();
                    request.setAttribute("isInvalidData", "Invalid data! Please check again.");
                    System.out.println("Invalid catch");
                    doGet(request, response);
                }
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }
    }

    private Long getLongValue(String str, String errField, String errMsg, HttpServletRequest request) {
        try {
            return Long.valueOf(str);
        } catch (NumberFormatException e) {
            request.setAttribute(errField, errMsg);
            System.out.println("Err parse: " + errField);
            e.printStackTrace();
        }
        return 0L;
    }

    private Date getDateValue(String str, String errField, String errMsg, HttpServletRequest request) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            return sdf.parse(str);
        } catch (ParseException e) {
            request.setAttribute(errField, errMsg);
            System.out.println("Err parse: " + errField);
            e.printStackTrace();
        }
        return null;
    }

    public boolean checkSevenDays(Date fromDate) {
        Calendar cal = Calendar.getInstance();
        cal.add(Calendar.DAY_OF_MONTH, -7);
        Date sevenDaysAgo = cal.getTime();
        return fromDate.after(sevenDaysAgo);
    }

    public boolean checkRangeMonths(Date fromDate, Date toDate, String contractTypeId) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(fromDate);
        int addMonths = 2;
        switch (contractTypeId) {
            case "1":
                addMonths = 2;
                break;
            case "2":
                addMonths = 3;
                break;
            case "3":
                addMonths = 12;
                break;
            case "4":
                addMonths = 36;
                break;
            default:
                addMonths = 2;
        }
        cal.add(Calendar.MONTH, addMonths);
        Date monthsLater = cal.getTime();
        System.out.println(monthsLater);
        System.out.println(toDate);
        return !monthsLater.after(toDate);
    }

}
