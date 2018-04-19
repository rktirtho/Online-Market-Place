<%-- 
    Document   : login_chack_admin
    Created on : Mar 12, 2018, 12:26:16 PM
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
        
        <%
   // boolean isPermited=false;
    // session.setAttribute("isAdminParmited", isPermited);
    String userName = request.getParameter("admin_user_name");
    String password = request.getParameter("admin_user_password");

    boolean isTrue = DatabaseHelper.adminLogin(userName, password);
    if (isTrue) {
        response.sendRedirect("admin_page.jsp");
        request.setAttribute("adminName", userName);
    }
%>
        
        
    <center><h1>User ID or Password Miss match</h1>
        <a href="login_admin.jsp">Try again</a>
    </center>
    </body>
</html>
