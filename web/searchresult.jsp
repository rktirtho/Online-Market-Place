<%-- 
    Document   : searchresult
    Created on : Mar 11, 2018, 11:10:33 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
        <title>Search Result</title>
    </head>
    <body>
        
        <%
            String search=request.getParameter("search");
            if (search.length()!=0) {
                    List<Product> products=DatabaseHelper.productSearch(search);
            request.setAttribute("list", products);
           
                } else {
                response.sendRedirect("index.jsp");
                }
            
        %>
        <div class="toolbar">
            <a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>
            <div class="loginbtn">
               
                <a href="userlogin.jsp" class="btn">Sign Up</a>
            </div>
            <form class="searchform" action="searchresult.jsp" method="post">
                <input type="text"  name="search" placeholder="Search..." style="width: 300px"/>
                <input type="submit"/>
            </form>
        </div>
        <div class="pagebody">
            <div class="sideoption">
                
            </div>
            <div class="maincontent">
                <!-- This View will show for every product!-->
                <c:forEach items="${list}" var="u">
                   
                    <div class="modeltablemain">
                        <div class="modelimage">
                            <img src="http://www.pvhc.net/img212/wigpvgngnsbxeqngiwuq.png">
                        </div>


                        <div class="modelinfo" style="padding-left: 50px">
                            <div>
                                <label style=" font-size: 20px"> <a href="productview.jsp?id=${u.getId()}" class="item"> ${u.getTitle()}</a><br></label>
                            </div>  
                            <table style="float: left">
                                <tr><td style="margin-right: 10px"><img src="images/bdt.png"style="width: 16px;height: 16px"> ${u.getPrice()}</td><td width="20px"></td> <td>Quantity: ${u.getQuantity()}</td></tr>
                                <tr><td style="margin-right: 10px"><img src="images/tele.png" style="width: 16px;height: 16px"> ${u.getPhone()}</td><td> </td><td><img src="images/category.png" style="width: 16px;height: 16px"> ${u.getCatagory()}</td></tr>
                            </table>
                        </div>
                    </div>

              


                </c:forEach>
                <!-- This View will show for every product!-->

              

               

            </div>


            <! End of page Body!>

            <!-- <div class="footer">
                 <p>&copy;Right By Rejaul</p>
             </div>
            !-->
          
        </div>
    </body>
</html>
