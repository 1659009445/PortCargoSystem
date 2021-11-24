<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>港口货物管理系统 用户注册</title>
    <link rel="icon" type="image/x-icon" href="img/logo.ico"/>
    <link rel="icon" type="image/png" href="img/logo.png"/>
    <link rel="stylesheet" href="css/login&register.css">

    <script>
        window.onload=function (){
            var img = document.getElementById("img_check");
            img.onclick=function (){
                var date = new Date().getTime();
                img.src="checkServlet?"+date;
            }
        }
        </script>
    <script>
        function validateform() {
            var username = document.forms["registerform"]["username"].value;
            var password = document.forms["registerform"]["password"].value;
            var email = document.forms["registerform"]["email"].value;
            var phone = document.forms["registerform"]["phone"].value;
            var checkcode = document.forms["registerform"]["checkcode"].value;
            if (username == null || username == "" || password == null || password == "" || email == null || email == "" || phone == null || checkcode == "" || phone == null || checkcode == "") {
                alert("请填写完整信息!");
                // var re=document.getElementById("spanAll");
                // re.innerHTML="请填写完整信息!";
                return false;
            }
            var atpos = email.indexOf("@");
            var dotpos = email.lastIndexOf(".");
            if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= email.length) {
                //alert("不是一个有效的 e-mail 地址");
                var email1=document.getElementById("spanemail");
                email1.innerHTML="请输入正确邮箱!";
                return false;
            }
            if (phone == "" || isNaN(phone)||phone.length!=11) {
                // alert("请输入正确的手机号!");
                var phone1=document.getElementById("spanPhone");
                phone1.innerHTML="请输入正确的手机号!";
                return false;
            }
        }
    </script>
</head>
<body>
<div class="register_layout">
    <div class="register_left">
        <p>港口货物管理系统</p>
        <p>USER REGISTER</p>
    </div>

    <div class="register_center">
        <div class="register_form">
            <form name="registerform" action="RegisterServlet" method="post" onsubmit="return validateform()">
                <table >
                    <tr><td> &ensp;</td></tr>
                    <tr><td> &ensp;</td></tr>
                    <tr>
                        <td class="td_left"><lable for="username">用户名</lable></td>
                        <td class="td_right"><input type="text" name="username" id="username" placeholder="请输入用户名"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><lable for="password">密码</lable></td>
                        <td class="td_right"><input type="password" name="password" id="password" placeholder="请输入密码"></td>
                    </tr>
<%--                    <tr>--%>
<%--                        <td class="td_left"><lable for="psswordconfirm">确认密码</lable></td>--%>
<%--                        <td class="td_right"><input type="password" name="psswordconfirm" id="psswordconfirm" placeholder="确认您的密码"></td>--%>
<%--                    </tr>--%>
                    <tr>
                        <td class="td_left"><lable for="email">邮箱</lable></td>
                        <td class="td_right"><input type="email" name="email" id="email" placeholder="请输入电子邮件"></td>
                        <td><span id="spanemail" style="color:#d90d0d; font-size: 5px;"></span></td>
                    </tr>

                    <tr>
                        <td class="td_left"><lable for="phone">手机号</lable></td>
                        <td class="td_right"><input type="text" name="phone" id="phone" placeholder="请输入电话号码"></td>
                        <td><span id="spanPhone" style="color:#d90d0d;font-size: 5px;"></span></td>
                    </tr>
                    <tr>
                        <td class="td_left"><lable for="checkcode">验证码</lable></td>
                        <td class="td_right"><input type="text" name="checkcodeR" id="checkcode" placeholder="请输入验证码"> <img id="img_check" class="checkcode" src="checkServlet"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" id="btn_reg"value="注册"></td>

                    </tr>
                    <tr>
                        <td align="center">  <td class="spantag"> <span lang="spanPhone" id="spanAll" class="registertip" style="color:#d90d0d;font-size: 5px;margin-left: 60px!important;"></span></td>&ensp;</td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="register_right">
        <p>已有账号?<a href="login.jsp">立即登录</a></p>
    </div>
</div>

</body>
</html>