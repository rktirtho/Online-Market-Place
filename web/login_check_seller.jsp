<%-- 
    Document   : login_check_seller
    Created on : Mar 12, 2018, 11:02:27 AM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <head>
        <style>
            a{text-decoration: none}
            a:hover{background: aquamarine}
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String phoneNumber = request.getParameter("user_login_phone_number");
            String password = request.getParameter("user_login_phone_password");
            
            int status=DatabaseHelper.sellerLogin(phoneNumber, password);

           if (status==1) {
                   response.sendRedirect("sellerpage.jsp");
                   session.setAttribute("userPhone", phoneNumber);
                   
                   session.setAttribute("isLogin", "yes");
               }
           


        %>
    <center>
        <h1>Failed</h1>
        <br>
        <hr>
        <br><br><br><br>
        <h2>Phone Number or Password does not match</h2>
        <h3><a href="userlogin.jsp">Try Again</a></h3> <h3><a href="index.jsp">Go Back Home</a></h3></center>
    </body>
</html>
