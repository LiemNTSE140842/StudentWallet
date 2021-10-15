<%-- 
    Document   : addPoint
    Created on : Oct 13, 2021, 8:54:40 AM
    Author     : pphuh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Point Page</title>
    </head>
    <body>
        <h1>Add Point Manager</h1>
        <%
            String searchFrom = request.getParameter("searchFrom");
            String search = request.getParameter("search");
            String cmb = request.getParameter("cmbStatus");
            if (cmb == null) {
                cmb = "Select";
            }
            if(searchFrom == null){
                searchFrom="";
            }
            if (search == null) {
                search = "";
            }
        %>
        <form action="SearchController">
            <select name="cmbStatus">
                <option value="<%= cmb%>" selected hidden><%= cmb%></option>
                <option value="All">All</option>
                <option value="Deleted">Deleted</option>
                <option value="Available">Available</option>
            </select>
            <input typpe="number" name="searchFrom" value="<%= searchFrom %>" min="0" required=""/>
            <input type="number" name="search" value="<%= search%>" min="1" required=""/>
            <input type="submit" name="action" value="Search"/>
        </form>
        <br>
<!--        <div>
            <table border="1">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Reward Name</th>
                        <th>Reward Point</th>
                        <th>Student ID</th>
                        <th>Student Reward Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <%
                    FoodDAO dao = new FoodDAO();
                    List<FoodDTO> list = (List<FoodDTO>) request.getAttribute("FOOD_LIST");
                    if (list != null) {
                %>
                <tbody>
                    <%
                        int count = 1;
                        for (FoodDTO food : list) {
                    %>
                    <tr>
                        <td><%= count++%></td>
                        <td><%= food.getName()%></td>
                        <td><%= food.getPrice()%></td>
                        <td><%= food.getCookingTime()%></td>
                        <td><%= food.getDescription()%></td>
                        
                <form action="MainController" method="POST">
                    <input type="hidden" name="ID" value="<%= food.getID()%>"/>
                    <input type="hidden" name="deleteStatus" value="<%= food.getIsDelete()%>"/>
                    <td>
                        <button type="submit" name="action" value="Read Food">
                            Read
                        </button>

                        <button type="submit" name="action" value="Edit Food">
                            Modify
                        </button>

                        <button type="submit" name="action" value="Delete Food">
                            Remove
                        </button>
                    </td>
                </form>
                </tr>
                <%
                    }
                %>
                </tbody>
                <%
                    }
                %>
            </table>

        </div>-->
    </body>
</html>
