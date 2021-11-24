/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.reward.RewardDAO;
import fwallet.data.reward.RewardDTO;
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThanhLiemPro
 */
@WebServlet(name = "CreateRewardDataController", urlPatterns = {"/CreateRewardDataController"})
public class CreateRewardDataController extends HttpServlet {

   private final static String ERROR = "/admin/reward/createReward.jsp";
   private final static String SUCCESS = "/admin/rewardData.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
      String url =ERROR;
        try {
            String rewardID = request.getParameter("rewardID");
            String chanelID = request.getParameter("channelID");
            String rewardName = request.getParameter("rewardName");
            Timestamp rewardDate = new Timestamp(System.currentTimeMillis());
            int rewardPoint = Integer.parseInt(request.getParameter("rewardPoint"));
            String description = request.getParameter("description");
            String studentID = request.getParameter("studentID");
            String rewardType = request.getParameter("rewardType");
            RewardDTO dto = new RewardDTO(rewardID, chanelID, rewardType, rewardName, rewardPoint, rewardDate, description, rewardName, studentID);
            RewardDAO dao = new RewardDAO();
            boolean insertReward = dao.insertNewReward(dto);
            if(insertReward){
                url=SUCCESS;
            }
        } catch (Exception e) {
             log("Error at CreateRewarDataController: " + e.toString());
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
