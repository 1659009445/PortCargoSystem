<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                    <li><a href="UserAcc.jsp">我的(${user.username})</a></li>
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
    <div><br><br><br><br></div>
    <div class="jumbotron j1">
        <h1>黄伟铭 13 Pro</h1>
        <p>强的很</p>
        <p><a>&nbsp;&nbsp;进一步了解>&nbsp;&nbsp;</a><a>&nbsp;&nbsp;点击购买>&nbsp;&nbsp;</a></p>
        <img src="img/huang1.jpg" class="pic" height="400px" width="520px">
    </div>
    <div class="jumbotron j2">
        <h1 class="t2">王之源 13 </h1>
        <p class="t2">解锁超能力</p>
        <p><a>&nbsp;&nbsp;进一步了解>&nbsp;&nbsp;</a><a>&nbsp;&nbsp;点击购买>&nbsp;&nbsp;</a></p>
        <img src="img/wang1.jpg" class="pic" height="400px" width="520px">
    </div>
    <div class="jumbotron j3">
        <h1 >胡轶 Pro </h1>
        <p >强者的强</p>
        <p><a>&nbsp;&nbsp;进一步了解>&nbsp;&nbsp;</a><a>&nbsp;&nbsp;点击购买>&nbsp;&nbsp;</a></p>
        <img src="img/huang1.jpg" class="pic" height="400px" width="520px">
    </div>
    <div>
            <span class=" j4" >
                <br>
                <img src="img/huang1.jpg" class="pic" height="400px" width="520px">
                <h1 >李文龙 Pro </h1>
                <p >全新音频空间</p>
                <p><a>&nbsp;&nbsp;进一步了解>&nbsp;&nbsp;</a><a>&nbsp;&nbsp;点击购买>&nbsp;&nbsp;</a></p>
            </span>
        <span class=" j5">
                <h1 >何戴龙 SE </h1>
                <p >全屏先手</p>
                <p><a>&nbsp;&nbsp;进一步了解>&nbsp;&nbsp;</a><a>&nbsp;&nbsp;点击购买>&nbsp;&nbsp;</a></p>
                <img src="img/huang1.jpg" class="pic" height="400px" width="520px">
                <br><br>
            </span>
    </div>
    <div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <br><br><br><br><br><br><br><br><br><br><br><br><br><br></div>
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