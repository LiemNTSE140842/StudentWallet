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
        <title>Create Page</title>
    </head>
    <body>
        <h1>Create New User !</h1>
        <form action="<%= request.getContextPath() %>/CreateController" method="POST"><br>
            userID<input type="text" name="userID" required=""/><br>
            universityID<input type="text" name="universityID" required=""/><br>
            studentName<input type="text" name="studentName" required=""/><br>
            age<input type="text" name="age" required=""/><br>
            gender<input type="text" name="gender" required=""/><br>
            address<input type="text" name="address" required=""/><br>
            email<input type="text" name="email" required=""/><br>
            <input type="submit"/>
        </form>
    </body>
</html>
