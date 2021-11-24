/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fwallet.data.controller;

import fwallet.data.product.ProductDAO;
import fwallet.data.product.ProductDTO;
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
 * @author pphuh
 */
@WebServlet(name = "CreateProductController", urlPatterns = {"/CreateProductController"})
public class CreateProductController extends HttpServlet {

    private final static String ERROR = "/admin/product/createProduct.jsp";
    private final static String SUCCESS = "/admin/productData.jsp";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = ERROR;
        try {
            String productID = request.getParameter("productID");
            String categoryID = request.getParameter("categoryID");
            String productName = request.getParameter("productName");
            String description = request.getParameter("description");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            String image = request.getParameter("image");
            Timestamp createDate = new Timestamp(System.currentTimeMillis());
            ProductDTO product = new ProductDTO(productID, categoryID, productName, description, price, quantity, false, createDate, image);
            ProductDAO dao = new ProductDAO();
            boolean checkInsert = false;
            List<String> listproduct = dao.getProductlID();
            for (String products : listproduct) {
                if (!checkInsert||!products.matches("^sp(\\d{1}|\\d{2}|\\d{3}|\\d{4}|\\d{5})$")) {
                    request.setAttribute("MASSAGEID", "Please productID check fomat[sp-{6}xxx]");  
                }else if(productID.equals(products)){
                    request.setAttribute("MASSAGEID", "ProductID is adready, please try again!");
                }else if(productName.length()>50){
                 request.setAttribute("MASSAGENAME", "ProductName is too long size(50)"); 
                }else if(description.length()>50){
                 request.setAttribute("MASSAGEDES", "Description is too long size(50)");  
                }else if(image.length()>200){
                 request.setAttribute("MASSAGEIMG", "ProductImage is too long size(200)");
                }
                else{
                    checkInsert = dao.insertNewProduct(product);
                    url = SUCCESS;
                }
            }
           
        } catch (Exception e) {
            log("Error at CreateProductController: " + e.toString());
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
