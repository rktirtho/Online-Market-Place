<%-- 
    Document   : signup_seller
    Created on : Mar 12, 2018, 11:31:36 AM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="seller" class="com.bean.Seller"></jsp:useBean>
<jsp:setProperty property="*" name="seller"></jsp:setProperty>


<!DOCTYPE html>
<html>
    <head>
        <style>
            
            a{font-size: 2em; text-decoration: none;}
            
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >
       <%
    int status=DatabaseHelper.sellerRegister(seller);
    if (status==1) {
        response.sendRedirect("seller_registration_success.jsp");
    } else {
       response.sendRedirect("seller_registration_failed.jsp");
       
        }


%>

    </body>
</html>
