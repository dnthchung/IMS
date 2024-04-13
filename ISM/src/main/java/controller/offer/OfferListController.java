/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.offer;

import dao.OfferDAO;
import dto.OfferInformationDTO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Department;
import model.Offer;
import model.User;

/**
 *
 * @author tranh
 */
@WebServlet(name = "OfferListServlet", urlPatterns = {"/offer-list"})
public class OfferListController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OfferListServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OfferListServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User loggedInUser = (User) session.getAttribute("loggedInUser");
        if (loggedInUser != null) {
            if (loggedInUser.getUserRoleId() != 3) {
                OfferDAO offerDAO = new OfferDAO();  
                request.setAttribute("offers", offerDAO.getAllOfferInformations());
                request.setAttribute("offerStatuses", offerDAO.getAllOfferStatuses());
                request.setAttribute("departments", offerDAO.getAllDepartments());
                request.getRequestDispatcher("view/offer/offer-list.jsp").forward(request, response);
            } else {
                response.sendRedirect("login");
            }
        } else {
            response.sendRedirect("login");
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchValue = request.getParameter("searchValue");
        String dept = request.getParameter("dept");
        String status = request.getParameter("status");
        if (searchValue.isEmpty() && dept.equals("Department") && status.equals("Status")) {
            doGet(request, response);
        } else {
            OfferDAO offerDAO = new OfferDAO();
            List<OfferInformationDTO> offers = offerDAO.searchOffers(searchValue, dept, status);
            if (offers.isEmpty()) {
                request.setAttribute("isEmptySearch", true);
            } else {
                request.setAttribute("isEmptySearch", false);
                request.setAttribute("offers", offerDAO.searchOffers(searchValue, dept, status));
            }
            request.setAttribute("offerStatuses", offerDAO.getAllOfferStatuses());
            request.setAttribute("departments", offerDAO.getAllDepartments());
            request.getRequestDispatcher("view/offer/offer-list.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
