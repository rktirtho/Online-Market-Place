<%-- 
    Document   : seller_account_view
    Created on : Mar 26, 2018, 11:28:13 AM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page import="com.bean.Seller"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            h3{
                padding: 5px;
                color: darkturquoise
            }
            p{
                color: ghostwhite;
                font-size: 1.2em;
                font-family: monospace;
                padding-left: 20px
            }
        </style>
        <title>Home</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
    </head>
    <body>
        <%
            String phoneNumber = (String) session.getAttribute("userPhone");
            Seller seller = DatabaseHelper.getSellerByPhoneNumber(phoneNumber);
        %>
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
                        <a href="seller_pending_product.jsp"><li>Product in Review</li></a>
                        <a href="seller_account_view.jsp"><li>My Account</li></a>
                        <a href="privacy_and_policy.jsp"> <li>Privacy and Policy</li></a>

                    </ul>

                </div>


            </div>
            <div class="maincontent"  style="width: 75%">


                <center>
                    <h2 style="color: white; margin: 10px">My Account</h2>

                </center>

                <fieldset>
                    <legend>Basic Information</legend>
                    <h3>Name</h3>
                    <p><%=seller.getName()%></p>
                    <h3>Phone Number</h3>
                    <p><%=seller.getPhone()%></p>
                    <h3>Email </h3>
                    <p><%=seller.getEmail()%></p>
                    <h3>Password </h3>
                    <p><%=seller.getEmail()%></p>
                    <h3>Gender</h3>
                    <p><%=seller.getGender()%></p>
                    <h3>Occupation</h3>
                    <p><%=seller.getOccupation()%></p>
                </fieldset>
                <br>

                <fieldset>
                    <legend>Address</legend>

                    <h3>Division</h3>
                    <p><%=seller.getDivision()%></p>

                    <h3>District </h3>
                    <p><%=seller.getDistric()%></p>

                    <h3>Sub District</h3>
                    <p><%=seller.getSubdis()%></p>

                    <h3>Post Office</h3>
                    <p><%=seller.getPostoffice()%></p>
                    <h3>Village</h3>
                    <p><%=seller.getVillage()%></p>
                    
                </fieldset>




            </div>


            <! End of page Body!>



        </div>
    <center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right researved by Becha Kena Dot Com </label></footer></center>
</body>
</html>