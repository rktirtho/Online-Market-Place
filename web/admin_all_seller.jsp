<%-- 
    Document   : admin_all_seller
    Created on : Mar 26, 2018, 12:44:13 PM
    Author     : DELL
--%>

<%@page import="com.bean.Seller"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.dao.DatabaseHelper"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Product"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
        <%

            String userName = (String) request.getAttribute("adminName");

        %>
        <div class="toolbar">
            <a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>


            <a href="userlogin.jsp" class="btn">Log out</a>


        </div>
        <div class="pagebody" style="">
            <div class="sideoption" style="width: 20%">


                <div class="option" style="height: 780px"  >
                    <center><img src="images/avatar.png"></center>
                    <br>
                    <hr>
                    <ul>
                        <li><a href="admin_page.jsp"> All Post</a></li>
                        <li><a href="admin_page_panding_post.jsp"> Pending Post</a></li>
                        <li> <a href="admin_pending_account.jsp">Pending Account</a></li>
                        <li><a href="#">All Seller</a></li>

                    </ul>

                </div>


            </div>
            <div class="maincontent"  style="width: 75%">
                <%                   
                    ArrayList<Seller> sellers = DatabaseHelper.getAllSeller();
                    request.setAttribute("list", sellers);

                %>

                <center>
                     <h2 style="color: white; margin: 10px">Account Under Review</h2>
                    <table border="1px"style="background:#F1F1F1 ">
                        <tr ><td>Name</td><td>Phone Number</td><td>National Id</td><td>Email Add</td><td>Gender</td><td>Division</td><td>District</td><td>Sub District</td><td>Post Office</td><td>Village</td><td>Occupation</td><td>Action</td></tr>

                        <c:forEach items="${list}" var="u">

                            <tr><td> ${u.getName()}</td><td> ${u.getPhone()}</td><td> ${u.getNid()}</td><td> ${u.getEmail()}</td><td> ${u.getGender()}</td><td> ${u.getDivision()}</td>
                                <td> ${u.getDistric()}</td><td> ${u.getSubdis()}</td><td> ${u.getPostoffice()}</td><td> ${u.getVillage()}</td><td> ${u.getOccupation()}</td>
                                <td><a href="delete_panding_seller.jsp?id=${u.getId()}"><img src="images/delete.png" style="width: 20px;height: 20px"></a></td>  
                                <td><a href="add_seller_sellertable.jsp?id=${u.getId()}"><img src="images/accept.png" style="width: 20px;height: 20px"></a></td>  
                                </tr>
                                    </c:forEach>
                    </table>
                </center>


            </div>


            <! End of page Body!>



        </div>
    <center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right reserved by Becha Kena Dot Com </label></footer></center>
</body>
</html>
