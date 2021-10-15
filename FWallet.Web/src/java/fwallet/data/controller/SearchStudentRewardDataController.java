/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.studentreward.StudentRewardDAO;
import fwallet.data.studentreward.StudentRewardDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author pphuh
 */
@WebServlet(name = "SearchStudentRewardDataController", urlPatterns = {"/SearchStudentRewardDataController"})
public class SearchStudentRewardDataController extends HttpServlet {

    
    private final static String NEXT_PAGE = "/admin/addPoint.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = NEXT_PAGE;
        HttpSession session = request.getSession();
        try {
            String searchFrom = request.getParameter("searchFrom");
            String search = request.getParameter("search");
            String cmbStatus = request.getParameter("cmbStatus");
            StudentRewardDAO studentRewardDao = new StudentRewardDAO();
            List<StudentRewardDTO> studentRewardList;
            if("All".equals(cmbStatus)){
                studentRewardList = studentRewardDao.getStudentRewardByEmail(search);
                if(!studentRewardList.isEmpty()){
                    request.setAttribute("LIST_STUDENT_REWARD", studentRewardList);
                }
            }else{
                
            }
        } catch (Exception e) {
            log("Error at SearchStudentRewardDataController: " + e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
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
        processRequest(request, response);
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
        processRequest(request, response);
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
