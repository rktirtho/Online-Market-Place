<%-- 
    Document   : product_update_chack
    Created on : Mar 15, 2018, 2:16:24 PM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page import="com.bean.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <jsp:useBean id="p" class="com.bean.Product"></jsp:useBean>
        <jsp:setProperty property="*" name="p"></jsp:setProperty>
        <%
            
          
            int status=DatabaseHelper.updatePandingPost(p);
//            response.sendRedirect("seller_pending_product.jsp");
           if (status==1) {
                   response.sendRedirect("seller_pending_product.jsp");
               } else {
               out.print("Failed..");
               }
        %>
    </body>
</html>
