<%-- 
    Document   : displayReward
    Created on : Oct 7, 2021, 3:31:04 PM
    Author     : pphuh
--%>

<%@page import="fwallet.data.reward.RewardDTO"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reward Page</title>
    </head>
    <body>
        <h1>Hello User!</h1>
        <table border="1">
            <thead>
                <tr>
                    <th>Image</th>
                    <th>Name</th>
                    <th>Description</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List<RewardDTO> listReward = (List<RewardDTO>) request.getAttribute("LIST_REWARD");
                    if (listReward != null) {
                        for (RewardDTO r : listReward) {
                %>
                <tr>
                    <td>Image</td>
                    <td><%= r.getRewardName() %></td>
                    <td><%= r.getDescription() %></td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
