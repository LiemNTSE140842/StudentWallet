<%-- 
    Document   : createUser
    Created on : Oct 1, 2021, 10:31:53 PM
    Author     : pphuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Product Page</title>
    </head>
    <body>
        <h1>Create New Product</h1>
        <form action="<%= request.getContextPath() %>/CreateProductController" method="POST"><br>
            product ID<input type="text" name="productID" required=""/><br>
            category ID<input type="text" name="categoryID" required=""/><br>
            product Name<input type="text" name="productName" required=""/><br>
            description<input type="text" name="description" required=""/><br>
            price<input type="number" value="1" min="0" name="price" required=""/><br>
            quantity<input type="number" value="1" min="0" name="quantity" required=""/><br>
            image<input type="text" name="image" required=""/><br>
            <input type="submit"/>
        </form>
    </body>
</html>
