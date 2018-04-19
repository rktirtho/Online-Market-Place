<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <style>
            body{margin: 0px auto;padding: 0px ; background: #535333}
            .pform{width: 400px; background: brown; padding: 20px;margin: 0px auto;border-radius: 10px}
            fieldset{color: #fff; border-radius: 10px; border: 3px solid cyan; }
            #title{width: 300px}
            tr{width: 300px}
            select:hover{background: brown}
            input{padding: 5px}
            .backto{ margin-right: 50px; margin-top: 10px; background: cornsilk; border-radius: 5px ; float: right}

        </style>

        <title>Home</title>
        <link href="style.css" rel="stylesheet" type="text/css"/>
        <link rel="shortcut icon" type="image/x-icon" href="logo.png">
    </head>
    <body>

        <div class="toolbar">
            <a href="index.jsp"><img src="images/logo.png" alt="logo"/></a>


            <a href="sellerpage.jsp" class="backto" >Back to Console</a>


        </div>
        <div class="pagebody">
            <center> 
                <div class="maincontent" style="width: 100%">


                    <! Start of body!>

                    <div class="pform">
                        <%
                            String phone = (String) session.getAttribute("userPhone");
                        %>
                        <fieldset>
                            <center><h2>Product Registration </h2></center>
                            <form action="productregistration.jsp" method="POST">
                                <center>
                                    <label>Product Title</label><br>
                                    <input type="text" name="title" placeholder="Samsung S8" style="width: 300px" >
                                    <table>

                                        <tr><td><label>Select Category</label></td><td><label>Quantity</label></td></tr>
                                        <tr>
                                            <td>
                                                <select name="catagory"><option>Select Category</option>
                                                    <option value="Air Conditioner">Air Conditioner</option>
                                                    <option value="Apartment">Apartment</option>
                                                    <option value="Books ">Books </option>
                                                    <option value="Camera ">Camera </option>
                                                    <option value="Desktop PC">Desktop PC</option>
                                                    <option value="Electronics">Electronics</option>
                                                    <option value="Health Fitness"> Health Fitness</option>
                                                    <option value="Internet Service">Internet Service</option>
                                                    <option value="Laptop">Laptop </option>
                                                    <option value="Laptop Assesories"> Laptop Accessories</option>
                                                    <option value="Machine & Tools"> Machine & Tools</option>
                                                    <option value="Phone Accessories">Phone Accessories </option>
                                                    <option value="Phone Accessories">Phone Accessories</option>

                                                </select></td><td><input type="number" name="quantity" min="0" placeholder="Quantity"></td></tr>
                                        <tr><td><label>Price</label></td><td><label>Phone Number</label></td></tr>
                                        <tr><td><input type="number" name="price" min="0" placeholder="Price"></td><td><input type="text" name="phone" placeholder="01XXXXXXXXX" readonly="readonly" value="<% out.print(phone);%>"></td></tr>
                                        <tr></tr>

                                    </table>
                                    <center><textarea style="width: 300px; height: 100px" placeholder="Droduct Discription" name="details"></textarea></center>

                                    <br>
                                </center>
                                Attach Minimum tow picture of Product<br>
                                <input type="file" >
                                <input type="file" >
                                <input type="file" >

                                <center><input type="submit" value="Submit"></center>


                            </form>

                        </fieldset>


                    </div>





                </div>


                <! End of page Body!>



        </div>
    </center>
<center><footer style="padding: 10px; background: #336b87"><label> &copy;2018. All right researved by Becha Kena Dot Com </label></footer></center>
</body>
</html>
