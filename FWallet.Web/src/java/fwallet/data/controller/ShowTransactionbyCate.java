/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.transaction.TransactionDAO;
import fwallet.data.transaction.TransactionDTO;
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
 * @author ThanhLiemPro
 */
@WebServlet(name = "ShowTransactionbyCate", urlPatterns = {"/ShowTransactionbyCate"})
public class ShowTransactionbyCate extends HttpServlet {

    private final static String ERROR = "error.jsp";
    private final static String SUCCESS = "/user/transaction.jsp";

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
        String url = ERROR;
        String option = request.getParameter("transaction");
        try {
            HttpSession session = request.getSession();
            TransactionDAO dao = new TransactionDAO();
            List<TransactionDTO> list ;
            if (option.equals("All")) {
                list = dao.getAllTransaction();
                session.setAttribute("LIST_TRANSACTION", list);

                url = SUCCESS;
            } else if (option.equals("Transaction Minus")) {
                list = dao.getAllTransactionMinusPoint();
                session.setAttribute("LIST_TRANSACTION", list);
                request.setAttribute("ISSELECTED", option);
                request.setAttribute("MINUS", "MINUS");
                url = SUCCESS;
            } else if (option.equals("Transaction Plus")) {
                list = dao.getAllTransactionPlusPoint();
                session.setAttribute("LIST_TRANSACTION", list);
                request.setAttribute("ISSELECTED", option);
                request.setAttribute("PLUS", "PLUS");
                url = SUCCESS;
            } else {
                request.setAttribute("ERROR_MESSAGE", "Transaction is being maintained");
            }
        } catch (Exception e) {
            log("Error at ShowProductController: " + e.toString());
        } finally {
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
