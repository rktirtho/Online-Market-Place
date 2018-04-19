<%-- 
    Document   : admin_page_panding_post
    Created on : Mar 14, 2018, 11:40:10 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

    String userName = (String) request.getAttribute("adminName");

%>

<!DOCTYPE html>
<html>
    <head>
        <style>

            .option{
                background: darkgrey

            }
            .option ul a{
                color: #000;
                font-size: 1.3em

            }
            .option ul li{
                padding-top: 10px;
                padding-bottom: 10px
                    ;padding-left: 20px
            }

            .option ul li:hover{
                background: #CCCCCC;
                transform: scale(1.1)
            }
            .option ul li:active {
                background: red;
                transform: scale(1.1)
            }
            td{
                padding: 3px
            }
        </style>
        <title>Home</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
    </head>
    <body>

        <div class="toolbar">
            <a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>


            <a href="userlogin.jsp" class="btn">Log out</a>


        </div>
        <div class="pagebody" style="">
            <div class="sideoption" style="width: 20%">


                <div class="option" style="height: 780px;padding-top: 10px"  >
                    <center><img src="images/avatar.png"></center>
                    <br>
                    <hr>
                    <ul>
                        <li> <a href="admin_page.jsp"> All Post</a></li>
                        <li> <a href="#"> Pending Post</a></li>
                        <li> <a href="admin_pending_account.jsp">Pending Account</a></li>
                        <li><a href="admin_all_seller.jsp">All Seller</a></li>

                    </ul>

                </div>


            </div>
            <div class="maincontent"  style="width: 75%">
                <%                    List<Product> products = DatabaseHelper.getAllPendingProduct();
                    request.setAttribute("list", products);
                %>

                <center>
                    <h2 style="color: white; margin: 10px">Product Under Review</h2>
                    <table border="1px" width="90%" style="background:#F1F1F1 ">
                        <tr ><td>Product Name</td><td>Category</td><td>Quantity</td><td>Phone Number</td><td>Price</td><td width="200px">Details</td><td>Action</td></tr>

                        <c:forEach items="${list}" var="u">

                            <tr><td> ${u.getTitle()}</td><td> ${u.getCatagory()}</td><td> ${u.getQuantity()}</td>
                                <td> ${u.getPhone()}</td><td> ${u.getPrice()}</td><td> ${u.getDetails()}</td>
                                <td><a href="delete_panding_product.jsp?id=${u.getId()}"></a><img src="images/delete.png" style="width: 20px;height: 20px"> <a herf=""><img src="images/accept.png" style="width: 20px;height: 20px"></a></td></tr>
                                    </c:forEach>
                    </table>
                </center>


            </div>


            <! End of page Body! >



        </div>
    <center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right researved by Becha Kena Dot Com </label></footer></center>
</body>
</html>
