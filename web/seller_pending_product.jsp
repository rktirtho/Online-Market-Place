<%-- 
    Document   : seller_pending_product
    Created on : Mar 15, 2018, 2:26:09 PM
    Author     : DELL
--%>

<%@page import="java.util.List"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String phoneNumber = (String) session.getAttribute("userPhone");
    ArrayList<Product> products = DatabaseHelper.searchPendingProductOfAUser(phoneNumber);
    request.setAttribute("list", products);
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
            .option ul a li{
                padding-top: 10px;
                padding-bottom: 10px
                    ;padding-left: 20px
            }

            .option ul li:hover{
                background: #CCCCCC;
                transform: scale(1.1)
            }
            .option ul li:active{
                background: #00adee;
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

            <a  class="add" href="productreg.jsp"style="margin-top: 5px"><label style="margin: 20px;padding: 5px; float: right; border-radius: 5px;box-shadow: 3px tomato; background: #fff">Add New</label></a>
          <a  class="add" href="seller_log_out.jsp"style="margin-top: 5px"><label style="margin-top: 20px;padding: 5px; float: right; border-radius: 5px;box-shadow: 3px tomato; background: #fff">Log out</label></a>
          


        </div>
        <div class="pagebody" style="">
            <div class="sideoption" style="width: 20%">


                <div class="option" style="height: 780px; padding-top: 10px"  >
                    <center><img src="images/avatar.png"></center>
                    <center>
                        <h2 style="color: gold"></h2></center><br>
                    <hr>
                    <ul>
                        <a href="sellerpage.jsp"> <li>My Product</li></a>
                        <a href="#"><li>Product in Review</li></a>
                        <a href="seller_account_view.jsp"><li>My Account</li></a>
                        <a href="privacy_and_policy.jsp"> <li>Privacy and Policy</li></a>

                    </ul>

                </div>


            </div>
            <div class="maincontent"  style="width: 75%">


                <center>
                    <h2 style="color: white; margin: 10px">Product in Review</h2>
                    <table border="1px" width="900px" style="background: white">
                        <tr ><td>Product Name</td><td>Category</td><td>Quantity</td><td>Phone Number</td><td>Price</td><td width="200px">Details</td><td>Delete</td><td>Edit</td></tr>

                        <c:forEach items="${list}" var="u">

                            <tr><td> ${u.getTitle()}</td><td> ${u.getCatagory()}</td><td> ${u.getQuantity()}</td>
                                <td> ${u.getPhone()}</td><td> ${u.getPrice()}</td><td> ${u.getDetails()}</td>
                                <td> <a href="seller_delete_product.jsp?id=${u.getId()}"><img src="images/delete.png" style="width: 20px;height: 20px"></a></td>
                                <td> <a href="seller_product_update.jsp?id=${u.getId()}"><img src="images/edit.png" style="width: 20px;height: 20px"></a></td>

                            </tr>

                        </c:forEach>
                    </table>
                </center>


            </div>


            <! End of page Body!>



        </div>
    <center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right researved by Becha Kena Dot Com </label></footer></center>
</body>
</html>

