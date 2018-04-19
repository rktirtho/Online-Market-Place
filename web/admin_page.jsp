<%-- 
    Document   : showproduct
    Created on : Mar 13, 2018, 6:57:17 PM
    Author     : DELL
--%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Product"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    // boolean isPermited=false;
    // session.setAttribute("isAdminParmited", isPermited);
    String userName = (String) request.getAttribute("adminName");
//    String password = request.getParameter("admin_user_password");
//
//    boolean isTrue = DatabaseHelper.adminLogin(userName, password);
//    if (!isTrue) {
//        response.sendRedirect("login_chack_admin.jsp");
//    }else{
//       
//     boolean getPermit=(Boolean)session.getAttribute("isAdminParmited");
//     getPermit=true;
//     session.setAttribute("isAdminParmited", getPermit);
//    }
//    
//    boolean isPermit=false;
//    isPermit=(Boolean)session.getAttribute("isAdminParmited");
//    if (!isPermit){
//   
//    }
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
        <title>Admin Panel</title>
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


                
                <div class="option" style="height: 780px; margin-top: 10px"  >
                    <center><img src="images/avatar.png"></center>
                    <br>
                    <hr>
                    <ul>
                        <li><a href="#"> All Post</a></li>
                        <li> <a href="admin_page_panding_post.jsp"> Pending Post</a></li>
                        <li> <a href="admin_pending_account.jsp">Pending Account</a></li>
                        <li><a href="admin_all_seller.jsp">All Seller</a></li>
                        

                    </ul>

                </div>


            </div>
            <div class="maincontent"  style="width: 75%">
                <%
                    List<Product> products = DatabaseHelper.getAllProduct("id");
                    request.setAttribute("list", products);
                %>

                <center>
                    <h2 style="color: white; margin: 10px">All Product in Market</h2>
                    <table border="1px" width="90%" style="background:#F1F1F1 ">
                        <tr ><td>Product Name</td><td>Category</td><td>Quantity</td><td>Phone Number</td><td>Price</td><td width="200px">Details</td><td>Action</td></tr>

                        <c:forEach items="${list}" var="u">

                            <tr><td> ${u.getTitle()}</td><td> ${u.getCatagory()}</td><td> ${u.getQuantity()}</td>
                                <td> ${u.getPhone()}</td><td> ${u.getPrice()}</td><td> ${u.getDetails()}</td>
                                <td><img src="images/delete.png" style="width: 20px;height: 20px"> <a herf=""><img src="images/accept.png" style="width: 20px;height: 20px"></a></td></tr>
                                    </c:forEach>
                    </table>
                </center>


            </div>


            <! End of page Body!>



        </div>
    <center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right researved by Becha Kena Dot Com </label></footer></center>
</body>
</html>
