<%-- 
    Document   : productview
    Created on : Mar 14, 2018, 9:29:01 PM
    Author     : DELL
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="com.dao.DatabaseHelper,com.bean.Product"%>
<%
    String id = request.getParameter("id");
    int ids=(Integer) Integer.parseInt(id);
    Product product = DatabaseHelper.getProducById(ids);

%>

<!DOCTYPE html>
<html>
    <head>
        <title>Home</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
    </head>
    <body>

        <div class="toolbar">
            <a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>
            <div class="loginbtn">

                <a href="userlogin.jsp" class="btn">Login</a>
            </div>

        </div>
        <div class="pagebody" style="width: 600px; background: cyan">
            <div class="maincontent" style="width: 100%; " >

                <center>
                    <fieldset style="margin: 30px">
                        <img src="images/pm.png" style="width: 200px; height: 250px">
                        <h2 style="background: chartreuse"><%=product.getTitle()%></h2>
                        <table style="width: 80%; margin: 30px">
                            <tr style="background: #F1F1F1; height: 30px"><td style="margin-right: 10px"><img src="images/bdt.png"style="width: 16px;height: 16px"> <%=product.getPrice()%></td> <td>Quantity: <%=product.getQuantity()%></td></tr>
                            
                            <tr  style="background: #535333;height: 30px "><td style="margin-right: 10px"><img src="images/tele.png" style="width: 16px;height: 16px"> <%=product.getPhone()%></td><td><img src="images/category.png" style="width: 16px;height: 16px"> <%= product.getCatagory()%></td></tr>
                        </table>

                        <h3 style="margin-bottom: 20px">Details: </h3>
                        <p><%=product.getDetails()%></p>
                    </fieldset>

                </center>




            </div>






        </div>


    </body>
</html>
