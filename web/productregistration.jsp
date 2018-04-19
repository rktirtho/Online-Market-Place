<%-- 
    Document   : productregistration
    Created on : Mar 8, 2018, 11:43:22 PM
    Author     : DELL
--%>


<%@page import="com.bean.Product"%>
<%@page import="com.dao.DatabaseHelper" %>
<jsp:useBean id="u" class="com.bean.Product"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>
<%
    int insert=DatabaseHelper.insertProduct(u);
    
if (insert>0) {
        response.sendRedirect("sellerpage.jsp");
    }
else{
     response.sendRedirect("product_reg_failed.jsp");
}

%>
