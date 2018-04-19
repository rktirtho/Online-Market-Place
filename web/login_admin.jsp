<%-- 
    Document   : login_admin
    Created on : Mar 12, 2018, 12:17:46 PM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <center>
        <form action="login_chack_admin.jsp" method="post">
        <input type="text" name="admin_user_name" placeholder="User ID">
        <input type="password" name="admin_user_password" placeholder="Password">
        <input type="submit" value="login">
    </form>
        </center>   
  
</body>
</html>
