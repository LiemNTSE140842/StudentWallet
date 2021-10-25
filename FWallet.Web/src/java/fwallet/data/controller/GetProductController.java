/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.order.OrderDAO;
import fwallet.data.order.OrderDTO;
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
@WebServlet(name = "GetProductController", urlPatterns = {"/GetProductController"})
public class GetProductController extends HttpServlet {
    private final static String SUCCESS = "ShowProductController";
    private final static String ERROR = "error.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String productID = request.getParameter("productID");
            float productPoint = Float.parseFloat(request.getParameter("productPoint"));
            HttpSession session = request.getSession();
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
            WalletDAO walletDao = new WalletDAO();
            WalletDTO wallet = walletDao.getUserWallet(user);
            int remainPoint = (int) (wallet.getWalletPoint() - productPoint);
            if(remainPoint>=0){
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
                LocalDateTime currentDateTime = LocalDateTime.now();
                Timestamp timeTemp = Timestamp.valueOf(currentDateTime);
                String formattedDateTime = currentDateTime.format(dtf);
                OrderDAO orderDao = new OrderDAO();
                OrderDTO order = new OrderDTO(formattedDateTime, user.getUserID(), productID, remainPoint, timeTemp, "pending");
                wallet.setWalletPoint(remainPoint);
                walletDao.updateWallet(user, remainPoint);
                //orderDao.insertOrder(order);
                url=SUCCESS;
            }else{
                url=ERROR;
            }
        } catch (Exception e) {
            log("Error at GetProductController: " + e.toString());
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
