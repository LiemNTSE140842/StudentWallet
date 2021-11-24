/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.studentreward.StudentRewardDAO;
import fwallet.data.transaction.TransactionDAO;
import fwallet.data.transaction.TransactionDTO;
import fwallet.data.user.UserDTO;
import fwallet.data.wallet.WalletDAO;
import fwallet.data.wallet.WalletDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "AddPointController", urlPatterns = {"/AddPointController"})
public class AddPointController extends HttpServlet {

    private final static String SUCCESS = "ShowUserRewardController";
    private final static String ERROR = "error.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String studentRewardID = request.getParameter("studentRewardID");
            String pointString = request.getParameter("productPoint");
            int productPoint = Integer.parseInt(pointString);
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            WalletDAO walletDao = new WalletDAO();
            WalletDTO wallet = walletDao.getUserWallet(user);
            if(wallet!=null){
                int remainPoint = wallet.getWalletPoint() + productPoint;
                TransactionDAO transactionDao = new TransactionDAO();
                String formattedDateTime = getTransactionID();
                Timestamp timeTemp = getTimeTemp();
                TransactionDTO transaction = new TransactionDTO(formattedDateTime, studentRewardID, wallet.getWalletID(), productPoint, timeTemp);
                wallet.setWalletPoint(remainPoint);
                walletDao.updateWallet(user, remainPoint);
                transactionDao.insertAddPointTransaction(transaction);
                StudentRewardDAO studentRewardDao = new StudentRewardDAO();
                boolean checkUpdateStatus = studentRewardDao.updateStudentWalletStatus(studentRewardID);
                url=SUCCESS;
            }else{
                url=ERROR;
            }
            
        } catch (Exception e) {
            log("Error at AddPointController: " + e.toString());
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
    }
    String getTransactionID(){
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyyMMddHHmmss");
        LocalDateTime currentDateTime = LocalDateTime.now();
        String formattedDateTime = currentDateTime.format(dtf);
        return formattedDateTime;
    }
    Timestamp getTimeTemp(){
        LocalDateTime currentDateTime = LocalDateTime.now();
        Timestamp timeTemp = Timestamp.valueOf(currentDateTime);
        return timeTemp;
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
