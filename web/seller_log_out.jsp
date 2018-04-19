<%-- 
    Document   : seller_log_out
    Created on : Mar 26, 2018, 11:33:29 PM
    Author     : Tirtho
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        session.setAttribute("isLogin", null);
        response.sendRedirect("index.jsp");
        
        %>
        <h1>Hello World!</h1>
    </body>
</html>
