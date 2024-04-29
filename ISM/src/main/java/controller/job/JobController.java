/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.job;

import constant.IConstant;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author acer
 */
public abstract class JobController extends HttpServlet {

    protected User loggedInUser;

    protected boolean isAdmin() {
        return loggedInUser.getUserRoleId() == IConstant.ADMIN_ID;
    }

    protected boolean isManager() {
        return loggedInUser.getUserRoleId() == IConstant.MANAGER_ID;
    }

    protected boolean isInterviewer() {
        return loggedInUser.getUserRoleId() == IConstant.INTERVIEWER_ID;
    }

    protected boolean isRecuiter() {
        return loggedInUser.getUserRoleId() == IConstant.RECUITER_ID;
    }

    private void validateUser(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            HttpSession session = request.getSession();
            loggedInUser = (User) session.getAttribute("loggedInUser");
            if (loggedInUser != null) {
                request.setAttribute("isInterviewer", isInterviewer());
                request.setAttribute("isRecuiter", isRecuiter());
                request.setAttribute("isManager", isManager());
                request.setAttribute("isAdmin", isAdmin());
            } else {
                String path = request.getServletPath();
                response.sendRedirect("login?continueUrl=" + path.substring(1));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            validateUser(request, response);
            if (authenticated()) {
                processGet(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            validateUser(request, response);
            if (authenticated()) {
                processPost(request, response);
            } else {
                response.sendRedirect("home");
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    protected abstract boolean authenticated();

    protected abstract void processGet(HttpServletRequest request, HttpServletResponse response);

    protected abstract void processPost(HttpServletRequest request, HttpServletResponse response);

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
