<%-- 
    Document   : userlogin
    Created on : Mar 7, 2018, 4:50:30 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body >


        <style>
            *{margin:0px auto;padding:px;}
            body{background: darkslategray}
            .toolbar{background: #336b87; height:  70px}
            .searchform{float: right;padding:15px;}	
            .input{border:1px solid #ddd; padding:3px;float: left; border-radius: 5px}	
            .signupform{
                padding:10px;
                font-family:arial;
                border:1px dotted white;
                margin:10px;
            }
           
            select{
                 width: 200px;
                 border-radius: 5px
               
            }
            select:hover{
                background: cyan;
            }

            .wrap{
                width:600px;
                margin:auto;
                background:#00adee;
                margin-top:50px;
                padding:5px;
            }
            table{
                width: 500px
            }
            td{
                padding: 5px
            }
            
            .bdate{
                width: 95%;
                  border-radius: 5px
            }
            
            input[type=text],[type=date],[type=password]{
                border-radius: 5px;
                     width: 200px
               
            }
            input[type=submit]:hover{
                background: crimson;
                color: coral;
               
            }
            date{
                 width: 200px
            }
            
            span{color: red}
        </style>


        <div style="display: block; overflow: hidden;" >

            <div class="toolbar">
                <a href="index.jsp"><img style="width: 200px;height: 40px; margin-left: 50px; margin-top: 5px" src="images/logo.png" alt="logo"/></a>
                <form class="searchform" action="login_check_seller.jsp" method="post">
                    <label style="color: white">Login </label>
                    <input type="text" name="user_login_phone_number" placeholder="Mobile Number" style="" />
                    <input type="password"  name="user_login_phone_password"placeholder="Password" style="margin-left: 10px; margin-right: 10px"/>
                    <input type="submit" value="Signin"/>
                </form>
            </div>

<br>

            <div class = "wrap" style="border-radius: 10px;box-shadow: 5px 5px 0px 0px  #fff; margin: 0px auto; height: 100%">
                
                    <fieldset style="border-radius:  10px; border-style:  double">
                        <center><h2 style="color: brown; font-family: cursive;transition: all"><strong>Sign up</strong></h2></center>
                        <form class="signupform" action="signup_seller.jsp" method="post">

                            <table>
                                <tr><td><label>Full Name <span>*</span></label></td><td><label>Phone Number <span>*</span></label></td></tr>
                                <tr><td><input type="text" name="name" placeholder="Name"></td><td><input type="text" name="phone" placeholder="Phone Number"></td></tr>
                                <tr><td><label>National Id No <span>*</span></label></td><td><label>Email <span>*</span></label></td></tr>
                                <tr><td><input type="text" name="nid" placeholder="NID Number"></td> <td><input type="text" name="email" placeholder="Email"></td></tr>
                                <tr><td><label>Death of Birth <span>*</span></label></td><td><label>Select Gender <span>*</span></label></td></tr>
                                <tr><td><input type="date" name="bdate" placeholder="Birth Date" class="bdate"></td><td><select name="gender"><option>Gender</option><option value="Male">Male</option><option value="Female">Female</option><option value="Others">Others</option></select></td></tr>
                                <tr><td><label>Password <span>*</span></label></td><td><label>Re-type Password<span>*</span></label></td></tr>
                                <tr><td><input type="password" name="password" placeholder="Password"></td><td><input type="password" name="repassword" placeholder="Re type password"></td></tr>
                                <tr><td><label>Select Division<span>*</span></label></td><td><label>District <span>*</span></label></td></tr>
                                <tr><td><select name="division"><option value="Dhaka">Dhaka</option><option value="Chittagonj">Chittagonj</option><option value="Sylet">Sylet</option>
                                            <option value="Rangpur">Rangpur</option><option value="Rajshahi">Rajshahi</option><option value="Barisal">Barisal</option><option value="Khulna">Khulna</option><option value="Mymensing"></option></select></td><td><input type="text" name="distric" placeholder="Distric"></td></tr>
                                <tr><td><label>Sub District <span>*</span></label></td><td><label>Post Office <span>*</span></label></td></tr>
                                <tr><td><input type="text" name="subdis" placeholder="Sub Distric"></td><td><input type="text" name="postoffice" placeholder="Post Office"></td></tr>
                                <tr><td><label>Village <span>*</span></label></td><td><label>Occupation <span>*</span></label></td></tr>
                                <tr><td><input type="text" name="village" placeholder="Vllage"</td><td><select name="occupation"><option>Occupation</option><option value="Businessman">Businessman</option><option value="Farmer">Farmer</option><option value="Students">Students</option><option value="Employee">Employee</option></select></td></tr>

                            </table>
                            <center><input type="submit" value="Submit"></center>
                        </form>

                        </form>
                    </fieldset>
                
            </div>

    </body>
</html>


</div>

</div>

</body>
</html>
