package controller.offer;

import dao.AuthenticationDAO;
import dao.OfferDAO;
import dto.OfferInformationDTO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.User;

/**
 *
 * @author tranh
 */
@WebServlet(name = "OfferListServlet", urlPatterns = {"/offer-list"})
public class OfferListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            AuthenticationDAO authenticationDAO = new AuthenticationDAO();
            loggedInUser = authenticationDAO.getUserByID(loggedInUser.getUserId());
            session.setAttribute("loggedInUser", loggedInUser);
            System.out.println(loggedInUser.getUserStatusId());
            if (loggedInUser.getUserRoleId() != 3 && loggedInUser.getUserStatusId() != 2) {
                OfferDAO offerDAO = new OfferDAO();
                List<OfferInformationDTO> offers = offerDAO.searchOffers("", "", "", 1);
                request.setAttribute("offers", offers);
                request.setAttribute("offerStatuses", offerDAO.getAllOfferStatuses());
                request.setAttribute("departments", offerDAO.getAllDepartments());
                request.setAttribute("URL", "Offer");
                request.setAttribute("currentPage", 1);
                request.setAttribute("nextPage", 2);
                request.setAttribute("totalPage", getTotalPage(offerDAO, "", "", ""));

                String isEmptyExport = request.getParameter("isEmptyExport");
                if (isEmptyExport != null) {
                    request.setAttribute("toastMsg", "No offer on the selected date");
                }

                String isInvalidDate = request.getParameter("isInvalidDate");
                if (isInvalidDate != null) {
                    request.setAttribute("toastMsg", "From Date needs to be earlier than To date");
                }

                String isCreateOfferSuccess = request.getParameter("isCreateOfferSuccess");
                if (isCreateOfferSuccess != null) {
                    request.setAttribute("toastMsg", "Create new offer successfully!");
                }

                String isEditOfferSuccess = request.getParameter("isEditOfferSuccess");
                if (isEditOfferSuccess != null) {
                    request.setAttribute("toastMsg", "Edit offer successfully!");
                }

                request.getRequestDispatcher("view/offer/offer-list.jsp").forward(request, response);
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }
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
                String searchValue = request.getParameter("searchValue");
                String dept = request.getParameter("dept");
                String status = request.getParameter("status");
                int pageNum = 1;
                try {
                    pageNum = Integer.parseInt(request.getParameter("currentPage"));
                    if (request.getParameter("btnPage").equals("prev")) {
                        pageNum--;
                    } else {
                        pageNum++;
                    }
                } catch (Exception e) {
                }
                if (searchValue.isEmpty() && dept.equals("Department") && status.equals("Status")) {
                    doGet(request, response);
                } else {
                    OfferDAO offerDAO = new OfferDAO();
                    System.out.println("Dept: " + dept);
                    System.out.println("Status: " + status);
                    List<OfferInformationDTO> offers = offerDAO.searchOffers(searchValue, dept, status, pageNum);
                    if (offers.isEmpty()) {
                        request.setAttribute("isEmptySearch", true);
                    } else {
                        request.setAttribute("isEmptySearch", false);
                        request.setAttribute("offers", offers);
                    }

                    if (!dept.equals("Department")) {
                        request.setAttribute("deptSelected", dept);
                    }

                    if (!status.equals("Status")) {
                        request.setAttribute("statusSelected", status);
                    }
                    request.setAttribute("searchedValue", searchValue);
                    request.setAttribute("offerStatuses", offerDAO.getAllOfferStatuses());
                    request.setAttribute("departments", offerDAO.getAllDepartments());
                    request.setAttribute("currentPage", pageNum);
                    request.setAttribute("totalPage", getTotalPage(offerDAO, searchValue, dept, status));
                    request.setAttribute("URL", "Offer");
                    request.getRequestDispatcher("view/offer/offer-list.jsp").forward(request, response);
                }
            } else {
                response.sendRedirect("home");
            }
        } else {
            String path = request.getServletPath();
            response.sendRedirect("login?continueUrl=" + path.substring(1));
        }
    }

    private int getTotalPage(OfferDAO offerDAO, String searchValue, String departmentId, String statusId) {
        int rowsDisplay = 10; // Change number of rows to display here
        int numRows = offerDAO.countAllOffers(searchValue, departmentId, statusId);
        int totalPage = numRows / rowsDisplay;
        if (numRows % rowsDisplay != 0) {
            totalPage++;
        }
        return totalPage;
    }

}
