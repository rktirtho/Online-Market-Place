<%-- 
    Document   : seller_delete_product
    Created on : Mar 15, 2018, 1:50:34 PM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<jsp:useBean id="product" class="com.bean.Product"></jsp:useBean>
<jsp:setProperty property="*" name="product"></jsp:setProperty>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    DatabaseHelper.deleteProduct(product, "productinfo");
    response.sendRedirect("sellerpage.jsp");
%>
