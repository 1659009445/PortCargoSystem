<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>港口货物管理系统 用户登录</title>
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
</head>
<body>
<div class="login_layout">
    <div class="login_left">
        <p>港口货物管理系统</p>
        <p>USER LOGIN</p>
    </div>

    <div class="login_center">
        <div class="login_form">
            <form action="loginServlet" method="post">
                <table >
                    <tr>
                        <td> &ensp;</td>
                    </tr>
                    <tr>
                        <td> &ensp;</td>
                    </tr>
                    <tr>
                        <td class="td_left"><lable for="username">用户名</lable></td>
                        <td class="td_right"><input type="text" name="username" id="username" placeholder="请输入用户名"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><lable for="password">密码</lable></td>
                        <td class="td_right"><input type="password" name="password" id="password" placeholder="请输入密码"></td>
                    </tr>
                    <tr>
                        <td class="td_left"><lable for="checkcode">验证码</lable></td>
                        <td class="td_right"><input type="text" name="checkcode" id="checkcode" placeholder="请输入验证码"> <img id="img_check" class="checkcode" src="checkServlet"></td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><input type="submit" id="btn_reg"value="登录" ></td>
                    </tr>
                    <tr>
                        <td> &ensp;</td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <div class="login_right">
        <p> 还没有账号?<a href="register.jsp">立即注册</a></p>
    </div>
</div>

</body>
</html>