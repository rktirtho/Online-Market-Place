<%-- 
    Document   : index
    Created on : Mar 7, 2018, 3:27:01 PM
    Author     : DELL
--%>

<%@page import="com.dao.DatabaseHelper"%>
<%@page import="java.util.List"%>
<%@page import="com.bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.tomcat.jni.User"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--<jsp:useBean id="product" class="com.bean.Product"></jsp:useBean>
<jsp:setProperty property="*" value="product"></jsp:setProperty>--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
    </head>
    <body>




        <%

//            String email = (String) session.getAttribute("email");

//        //redirect user to home page if already logged in
//        if(email!=null){
//           out.print("Correct login details!"); 
//        }
// 
//        String status=request.getParameter("status");
//        
//        if(status!=null){
//            if(status.equals("false")){
//                   out.print("Incorrect login details!");                       
//            }
//            else{
//                out.print("Some error occurred!");
//            }
//        }
//           String loginStatus=(String) session.getAttribute("loginStatus");
//           
            String isLogin = (String) session.getAttribute("isLogin");
            int numberOfProduct = DatabaseHelper.getNumberApprovedProduct();
            int numberOfSeller = DatabaseHelper.getNumberApprovedSeller();
        %>

        <div class="toolbar">
            <img src="images/logo.png" alt="logo"/>
            <div class="loginbtn">

                <a href="login_admin.jsp" class="btn">Admin</a>
                <%
                    if (isLogin!=null) {%>
                <a href="sellerpage.jsp" class="btn">Console</a>
                <%
                     } else {%>
                <a href="userlogin.jsp" class="btn">Login</a>
                <%
                        }
%>

            </div>
            <form class="searchform" action="searchresult.jsp" method="post">
                <input type="text"  name="search" placeholder="Search..." style="width: 300px"/>
                <input type="submit"/>
            </form>
        </div>
        <div class="pagebody">
            <div class="sideoption">
                <div style="margin-top: 30px; background: maroon; margin-left: 10px; border-radius: 10px; padding: 50px 0px 50px 0 ">
                    <table style="color: white; font-size: 1.3em">
                        <tr style="padding: 50px"><td>Number of Total Product </td><td style="width: 50px; text-align: right">      <%=numberOfProduct%></td></tr>
                        <tr><td>Number of Total Seller </td><td style="width: 50px; text-align: right">      <%=numberOfSeller%></td></tr>
                    </table>

                </div>

                <div style="margin-top: 30px; background: maroon; margin-left: 10px; border-radius: 10px; padding: 10px ">

                    <form action="#" method="post">

                        <select class="option1" name="shortchoiser">
                            <option value="id desc">Short By</option>
                            <option value="id desc">Newest</option>
                            <option value="title">Name</option>
                            <option value="catagory">Category</option>
                            <option value="price">Low Price</option>
                            <option value="price desc">High Price</option>
                            <option value="id">Oldest</option>

                        </select>


                        <input type="submit"  value="Search" class="searchbtn" >
                    </form>
                </div>
                <br>
                <br>
                <br>
                <br>
            </div>
            <%
                String string = request.getParameter("shortchoiser");

                List<Product> products = DatabaseHelper.getAllProduct(string);
                request.setAttribute("list", products);
            %>
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


            <! End of page Body!>Copyright © 2008 Apple Inc. All rights reserved.



        </div>
        <footer style="padding: 15px; background: #336b87">
            <center> <label style="color: white">Copyright &copy; 2018 Becha Kena Dot Com. All rights reserved. </label>
            </center>
            <p style="float: right; color: aqua">Developed By: Code Buzzard</p>
        </footer>

    </body>
</html>
