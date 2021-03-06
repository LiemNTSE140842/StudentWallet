/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.wallet.WalletDAO;
import fwallet.data.wallet.WalletDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author pphuh
 */
@WebServlet(name = "UpdateWalletDataController", urlPatterns = {"/UpdateWalletDataController"})
public class UpdateWalletDataController extends HttpServlet {

    private static final String url = "admin/walletData.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String walletID = request.getParameter("walletID");
            String walletName = request.getParameter("walletName");
            String userID = request.getParameter("userID");
            int walletPoint = Integer.parseInt(request.getParameter("walletPoint"));
            String status = request.getParameter("status");
            boolean walletStatus = false;
            if("active".equals(status)){
                walletStatus = true;
            }
            WalletDAO walletDao = new WalletDAO();
            WalletDTO wallet = new WalletDTO(walletID, userID, walletName, walletPoint, walletStatus);
            boolean checkUpdate = walletDao.updateWalletFiveInfo(wallet);
        } catch (Exception e) {
            log("Error at UpdateWalletDataController: " + e.toString());
        }finally{
            response.sendRedirect(url);
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
