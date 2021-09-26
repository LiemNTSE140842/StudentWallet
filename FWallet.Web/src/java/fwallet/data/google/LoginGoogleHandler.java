/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.google;


import com.google.gson.Gson;
import com.google.gson.JsonObject;
import fwallet.data.user.UserDAO;
import fwallet.data.user.UserDTO;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.fluent.Form;

/**
 *
 * @author pphuh
 */
@WebServlet(name = "LoginGoogleHandler", urlPatterns = {"/LoginGoogleHandler"})
public class LoginGoogleHandler extends HttpServlet {

    private static final String ERROR = "error.jsp";
    private static final String SUCCESS = "welcome.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String code = request.getParameter("code");
            String accessToken = getToken(code);
            UserGoogleDTO user = getUserInfo(accessToken);
            HttpSession session = request.getSession();
            if(!user.getEmail().contains("@fpt.edu.vn")){
                session.setAttribute("ERROR_MESSAGE", "Your email have no permission!");
                return;
            }
            if(user.getId()!=null && !user.getId().isEmpty()){
                UserDAO dao = new UserDAO();
                UserDTO userDAO = dao.checkLoginGmail(user.getId());
                if(userDAO!=null){
                    session.setAttribute("LOGIN_USER", userDAO);
                    url=SUCCESS;
                }else{
                    boolean check = dao.updateGoogleUser(user);
                    if(check){
//                        userDAO = new UserDTO(user.getId(), user.getName(), "", "US", "inactive");
                        session.setAttribute("ERROR_MESSAGE", "Account is inactive");
                        
                    }else{
                        session.setAttribute("ERROR_MESSAGE", "Update Fail!");
                    }
                }
            }else{
                session.setAttribute("ERROR_MESSAGE", "Can not access to Google!");
            }
        } catch (Exception e) {
            log("Eror at LoginGoogleHandler: " + e.toString());
        } finally {
            response.sendRedirect(url);
        }
    }

    public static String getToken(String code) throws ClientProtocolException, IOException {
        // call api to get token
        String response = Request.Post(Constants.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", Constants.GOOGLE_CLIENT_ID)
                        .add("client_secret", Constants.GOOGLE_CLIENT_SECRET)
                        .add("redirect_uri", Constants.GOOGLE_REDIRECT_URI).add("code", code)
                        .add("grant_type", Constants.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static UserGoogleDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
        String link = Constants.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();

        UserGoogleDTO googlePojo = new Gson().fromJson(response, UserGoogleDTO.class);

        return googlePojo;
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
