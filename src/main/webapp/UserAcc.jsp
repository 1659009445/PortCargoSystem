
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>港口货物管理系统</title>
    <link rel="icon" type="image/x-icon" href="img/logo.ico"/>
    <link rel="icon" type="image/png" href="img/logo.png"/>
    <link rel="stylesheet" href="css/index.css">
    <%--导入外部资源--%>
    <link rel="stylesheet" href="css/bootstrap.min.css" >
    <script src="https://cdn.jsdelivr.net/npm/html5shiv@3.7.3/dist/html5shiv.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/respond.js@1.4.2/dest/respond.min.js"></script>
    <script src="js/jquery-3.5.1.min.js" ></script>
    <script src="js/bootstrap.min.js" ></script>

    <script>
        function validateform() {
            var name = document.forms["addCargoForm"]["name"].value;
            var weight = document.forms["addCargoForm"]["weight"].value;
            var intime = document.forms["addCargoForm"]["intime"].value;
            if (name == null || name == "" || weight == null || weight == "" || intime == null || intime == "") {
                alert("请填写完整信息!");
                // var re=document.getElementById("spanAll");
                // re.innerHTML="请填写完整信息!";
                return false;
            }
            if (weight == "" || isNaN(weight)) {
                alert("请输入正确的重量!");
                return false;
            }
        }
    </script>





</head>

<body>
<header class="header">
    <nav class="navbar-default navbar-inverse navbar-fixed-bottom">
        <div class="container-fluid navbar-inverse">
            <div class="navbar-header ">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand " href="#">  </a>
                <img src="img/logo.ico" class="img-responsive" height="60px" width="50px">
            </div>
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse">
                <ul class="nav navbar-nav">
                    <li><a><p> 港 口 货 物 管 理 系 统 </p></a></li>
                    <li class="active"><a href="index.html">首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#"> 地区 </a></li>
                    <li><a href="cookieTime_Servlet"> 时间 </a></li>
                    <li><a href="FindCargoByPageServlet">货物管理</a></li>
                    <li><a href="CargoFindServlet">货物查询</a></li>
                    <li><a href="CargoFind.jsp">港口查询</a></li>
                    <li><a href="businessManagement.jsp">业务办理</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <form class="navbar-form navbar-left">
                        <div class="form-group"><input type="text" class="form-control" placeholder="搜索"></div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>
                    <li><a href="account.jsp">我的(${user.username})</a></li>
                    <li><a href="register.jsp">注册</a></li>
                    <li><a href="login.jsp">登录</a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">更多 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="#">联系我们</a></li>
                            <li><a href="#">其他产品</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">帮助</a></li>
                            <li><a href="#">反馈</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>

<div class="layout">

    <div class="usermain">
        <div><br><br><br><br></div>
        <h1 class="pageHead">港口货物管理系统><span class="subPageHead">我的个人信息</span></h1>
        <div class="usertable1">
            <table class="table1">
                <tr>
                    <td></td><td class="usert2">我的个人信息</td><td></td>
                </tr>
                <tr>
                    <td class="usert1">用户id:</td> <td class="usert2" >${user.id}</td> <td class="usert1"> 复制</td>
                </tr>
                <tr>
                    <td class="usert1">用户名:</td>  <td class="usert2">${user.username}</td><td class="usert1">更改</td>
                </tr>
                <tr>
                    <td class="usert1">密码管理:</td>  <td class="usert2">${user.password}</td><td class="usert1">更改</td>
                </tr>
                <tr>
                    <td class="usert1">电话管理:</td>  <td class="usert2">${user.phone}</td><td class="usert1">更改</td>
                </tr>
                <tr>
                    <td class="usert1">邮箱管理:</td>  <td class="usert2">${user.email}</td><td class="usert1">更改</td>
                </tr>
            </table>
        </div>

        <div class="usertable1">
            <table class="table1">
                <tr>
                    <td></td><td class="usert2">货物信息统计</td><td></td>
                </tr>
                <tr>
                    <td class="usert1">货物总数:</td> <td class="usert2" >${user.id}</td> <td class="usert1"> 复制</td>
                </tr>
                <tr>
                    <td class="usert1">货物总量:</td>  <td class="usert2">${user.username}</td><td class="usert1">更改</td>
                </tr>
                <tr>
                    <td class="usert1">货物在港数:</td>  <td class="usert2">${user.password}</td><td class="usert1">更改</td>
                </tr>
                <tr>
                    <td class="usert1">更新中:</td>  <td class="usert2">${user.phone}</td><td class="usert1">更改</td>
                </tr>
            </table>
        </div>
        <div>
            <form action="/PortCargoSystem_war_exploded/UploadPicServlet" method="post" enctype="multipart/form-data">
                请选择上传的图片或文件:<input type="file" name="fileName"/><input type="submit" value="上传"/>
            </form>
        </div>
        <div><br><br><br><br><br><br><br></div>
    </div>



</div>

<footer class="footer">
    <div class=" jp">
        <br><br>
        <div>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;业务&nbsp;</p>
                    <p><a class="af" href="cargo_manage.html">&nbsp;货物管理&nbsp;</a></p>
                    <p><a class="af" href="harbour_select.html">&nbsp;港口查询&nbsp;</a></p>
                    <p><a class="af" href="cargo_select.html">&nbsp;货物查询&nbsp;</a></p>
                    <p><a class="af" href="business.html">&nbsp;业务办理&nbsp;</a></p>
                    <p><a class="af" href="schedule.html">&nbsp;申请调度&nbsp;</a></p>
                    <p><a class="af" href="result.html">&nbsp;进度查询&nbsp;</a></p>
                </ul>
            </span>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;账户&nbsp;</p>
                    <p><a class="af" href="account.html">&nbsp;我的账户&nbsp;</a></p>
                    <p><a class="af" href="account.html">&nbsp;账户管理&nbsp;</a></p>
                    <p><a class="af" href="account.html">&nbsp;账户余额&nbsp;</a></p>
                    <p><a class="af" href="account.html">&nbsp;账户设置&nbsp;</a></p>
                </ul>
            </span>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;项目技术&nbsp;</p>
                    <p><a class="af" href="https://github.com/" target="_blank">&nbsp;Github</a></p>
                    <p><a class="af" href="#">&nbsp;javaEE&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;MySQL&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;bootstrap&nbsp;</a></p>

                </ul>
            </span>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;人员&nbsp;</p>
                    <p><a class="af" href="#">&nbsp;hy</a></p>
                    <p><a class="af" href="#">&nbsp;hwm&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;hdl</a></p>
                </ul>
            </span>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;关于&nbsp;</p>
                    <p><a class="af" href="#">&nbsp;了解我们&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;联系我们&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;反馈&nbsp;</a></p>
                    <p><a class="af" href="#">&nbsp;反馈&nbsp;</a></p>
                </ul>
            </span>
            <span class="col-xs-2">
                <ul>
                    <p>&nbsp;更多&nbsp;</p>
                    <p><a class="af" href="#">&nbsp;理念&nbsp;</a></p>
                    <p><a class="af" href="tip.html">&nbsp;打赏&nbsp;</a></p>
                </ul>
            </span>
        </div>
        <hr class="hr"/>
        <p class="f1">重庆交通大学 信息科学与工程学院 2020级 计算机3班</p>
        <p class="f1">港口货物管理系统</p>
        <p class="f1">Copyright &copy  2021 413 Inc. 保留所有权利。</p>
    </div>

</footer>


</body>
</html>