<%-- 
    Document   : add_seller_sellertable
    Created on : Mar 15, 2018, 1:47:12 AM
    Author     : DELL
--%>

<%@page import="com.bean.Seller"%>
<%@page import="com.dao.DatabaseHelper"%>


<%
    String id = request.getParameter("id");
    int ids = (Integer) Integer.parseInt(id);
    Seller seller = DatabaseHelper.getSellerById(ids,"selleraccountpanding");
    DatabaseHelper.sellerAddToSellerDatabase(seller);
    DatabaseHelper.deleteSeller(seller, "selleraccountpanding");
    response.sendRedirect("admin_pending_account.jsp");
%>

<html>
    <head>
        <title>Check</title>
    </head>
    <body>

        <%
            out.print(ids);
        %>

    </body>

</html>