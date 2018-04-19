<%-- 
    Document   : delete_panding_seller
    Created on : Mar 15, 2018, 1:22:42 AM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<jsp:useBean id="seller" class="com.bean.Seller"></jsp:useBean>
<jsp:setProperty property="*" name="seller"></jsp:setProperty>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    DatabaseHelper.deleteSeller(seller, "selleraccountpanding");
    response.sendRedirect("admin_pending_account.jsp");
%>

