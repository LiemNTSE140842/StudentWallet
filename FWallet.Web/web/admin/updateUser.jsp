<%-- 
    Document   : createUser
    Created on : Oct 1, 2021, 10:31:53 PM
    Author     : pphuh
--%>

<%@page import="fwallet.data.user.UserDTO"%>
<%@page import="fwallet.data.user.UserDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Page</title>
    </head>
    <body>
        <h1>Update User !</h1>
        <%
            String userEmail = request.getParameter("email");
            UserDAO dao = new UserDAO();
            UserDTO user = dao.getAUserByEmail(userEmail);
            if(user.isGender()){
                String userGender = "male";
            }else{
                String userGender = "female";
            }
        %>
        <form action="<%= request.getContextPath() %>/UpdateController" method="POST"><br>
            universityID<input type="text" name="universityID" value="<%= user.getUniversityID() %>" required=""/><br>
            studentName<input type="text" name="studentName" value="<%= user.getStudentName() %>" required=""/><br>
            age<input type="number" name="age" value="<%= user.getAge() %>" required=""/><br>
            gender<input type="text" name="gender" value="<%= user.isGender() %>" required=""/><br>
            address<input type="text" name="address" value="<%= user.getAddress() %>" required=""/><br>
            email<input type="text" name="email" value="<%= user.getEmail() %> " required=""/><br>
            status<input type="text" name="status" value="<%= user.getStatusID() %> " required=""/><br>
            <input type="hidden" name="oldEmail" value="<%= userEmail %>"/>
            <input type="submit"/>
        </form>
    </body>
</html>
