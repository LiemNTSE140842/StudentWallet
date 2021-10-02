<%-- 
    Document   : createUser
    Created on : Oct 1, 2021, 10:31:53 PM
    Author     : pphuh
--%>

<%@page import="fwallet.data.product.ProductDTO"%>
<%@page import="fwallet.data.product.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <h1>Update New Product</h1>
        <% 
            String productId = request.getParameter("productID");
            ProductDAO dao = new ProductDAO();
            ProductDTO product = dao.getAProductByID(productId);
        %>
        <form action="<%= request.getContextPath() %>/UpdateProductController" method="POST"><br>
            product Name<input type="text" value="<%= product.getProductName()%>" name="productName" required=""/><br>
            description<input type="text" value="<%= product.getDescription()%>" name="description" required=""/><br>
            price<input type="number" value="<%= product.getPrice()%>" min="0" name="price" required=""/><br>
            quantity<input type="number" value="<%= product.getQuantity()%>" min="0" name="quantity" required=""/><br>
            status ID<input type="text" value="<%= product.isStatusID()%>" name="statusID" required=""/><br>
            <input type="hidden" name="productID" value="<%= productId %>"/>
            <input type="submit"/>
        </form>
    </body>
</html>
