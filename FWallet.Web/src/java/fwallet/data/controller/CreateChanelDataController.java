/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.channel.ChannelDAO;
import fwallet.data.channel.ChannelDTO;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ThanhLiemPro
 */
@WebServlet(name = "CreateChanelDataController", urlPatterns = {"/CreateChanelDataController"})
public class CreateChanelDataController extends HttpServlet {

    private final static String ERROR = "/admin/channel/createChannel.jsp";
    private final static String SUCCESS = "/admin/channelData.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String channelID = request.getParameter("channelID");
            String channelName = request.getParameter("channelName");
            String channelOffice = request.getParameter("channelOffice");
            String channelPhone = request.getParameter("channelPhone");
            Timestamp channelCreateDate = new Timestamp(System.currentTimeMillis());
            ChannelDTO channel = new ChannelDTO(channelID, channelName, channelOffice, channelPhone, channelCreateDate);
            ChannelDAO dao = new ChannelDAO();
            boolean checkInsertChannel = dao.insertNewChanel(channel);
            List<String> listChannelID = dao.getChannelID();
            for (String channelid : listChannelID) {
                if (channelID.equals(channelid)) {
                    request.setAttribute("MASSAGE", "ChannelID is adready, please try again!");
                   
                }else if(!channelID.matches("^cn(\\d{1}|\\d{2}|\\d{3}|\\d{4}|\\d{5})$")){
                    request.setAttribute("MASSAGE", "Please forr");
                } else if(checkInsertChannel) {
                    url = SUCCESS;
                }
            }

        } catch (Exception e) {
            log("Error at CreateChanellController: " + e.toString());
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
