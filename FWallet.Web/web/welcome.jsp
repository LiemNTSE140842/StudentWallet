<%-- 
    Document   : welcome
    Created on : Sep 25, 2021, 3:14:46 PM
    Author     : pphuh
--%>

<%@page import="fwallet.data.user.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome Page</title>
    </head>
    <body>
        <% 
            UserDTO user = (UserDTO) session.getAttribute("LOGIN_USER");
        %>
        <h1>Welcome <%= user.getUserID()%></h1>
    </body>
</html>
