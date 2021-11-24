<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        function delCArgo(id,uid){
            <%--/CargoDelServlet??id=${cargo.id}--%>
            if(confirm("确定删除?")){
                location.href="/PortCargoSystem_war_exploded/CargoDelServlet?id="+id+"&uid="+uid;
            }

        }
    </script>

</head>

<body>
<header class="header">
    <nav class="navbar-default  navbar-fixed-bottom">
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
                    <li class="active"><a href="index.jsp">首页 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#"> 地区 </a></li>
                    <li><a href="cookieTime_Servlet"> 时间 </a></li>
                    <li><a href="CargoListServlet">货物管理</a></li>
                    <li><a href="harbour_select.html">港口查询</a></li>
                    <li><a href="cargo_select.html">货物查询</a></li>
                    <li><a href="business.html">业务办理</a></li>
                    <li><a href="schedule.html">申请调度</a></li>
                    <li><a href="result.html">进度查询</a></li>
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
    <div><br><br><br><br><br><br></div>
    <h1 class="pageHead">港口货物管理系统><span class="subPageHead">管理我的货物</span></h1>
    <div class="maintable">
        <table class="cargotable">
            <tr class="table1"><td class="tablth">货物编号</td>
                <td class="tablth tablehCargoName">货物名称()</td>
                <td class="tablth">货物重量(单位:t)</td><td class="tablth">货物种类</td>
                <td class="tablth">所在港口</td><td class="tablth">货物所属</td>
                <td class="tablth">入库时间</td><td class="tablth">货物状态</td>
            <td class="tablth">修改</td><td class="tablth">删除</td></tr>
            <%--              <tr class="table2">--%>
            <c:forEach items="${pc.list}" var="cargo">
                <tr class="table2">
                    <td class="tabltd">${cargo.id}</td>
                    <td class="tabltd2">${cargo.name}</td>
                    <td class="tabltd">${cargo.weight}</td>
                    <td class="tabltd2">${cargo.typeid}</td>
                    <td class="tabltd">${cargo.harbourid}</td>
                    <td class="tabltd2">${cargo.userid}</td>
                    <td class="tabltd">${cargo.intime}</td>
                    <td class="tabltd2">${cargo.state}</td>
                    <td class="tabltd"><a class="btn btn-default" href="/PortCargoSystem_war_exploded/CargoModifyServlet?id=${cargo.id}&uid=${user.id}" style="text-decoration: none;">修改</a></td>
                    <td class="tabltd2"><a class="btn btn-default" href="javascript:delCArgo(${cargo.id},${user.id})" style="text-decoration: none;">删除</a></td>
                </tr>
            </c:forEach>
            <%--              </tr>--%>
        </table>
    </div>
    <nav aria-label="Page navigation" class="pageBar ">
        <ul class="pagination">
            <%--最前页        --%>
            <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=1&rows=10"><<</a></li>
            <%--向前翻页功能--%>
            <c:if test="${pc.currentPage == 1}">
                <li><a href="#" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
                <%--/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=1&rows=10--%>
                <c:forEach begin="1" end="${(pc.totalPage < 10) ? (pc.totalPage) : (10)}" var="i">
                    <c:if test="${pc.currentPage==i}">
                        <li class="active"><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${i}&rows=10">${i}</a></li>
                    </c:if>

                    <c:if test="${pc.currentPage!=i}">
                        <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${i}&rows=10">${i}</a></li>
                    </c:if>
                </c:forEach>
            </c:if>
            <%----%>
            <c:if test="${pc.currentPage != 1 }">
                <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${pc.currentPage-1}&rows=10" aria-label="Previous"><span aria-hidden="true"><</span></a></li>
                <c:forEach begin="${  (pc.currentPage > 10) ? ( ( (pc.totalPage-pc.currentPage) > 10) ?  ( pc.currentPage-1 ) : (pc.totalPage - 9 ) ): ( pc.currentPage-1 )}" end="${((pc.currentPage+8) > pc.totalPage) ? pc.totalPage : pc.currentPage+8}" var="i">
                    <%--                 > pc.totalPage ? pc.currentPage+8 : pc.totalPage --%>
                    <%--                <c:if test="${(pc.currentPage+2)<=pc.totalPage}">--%>
                    <%--                (pc.totalPage-pc.currentPage) < 10 ? (pc.totalPage-pc.currentPage+1-8) : (pc.currentPage-1)--%>
                    <%--                pc.currentPage > 10 ? ( ((pc.totalPage-pc.currentPage) < 10 ) ? (pc.totalPage-pc.currentPage-7) : ((pc.currentPage-1)) ) : (pc.currentPage-1)--%>
                    <%--                (pc.currentPage > 10) ? ( ( (pc.totalPage-pc.currentPage) < 10) ?  ( pc.totalPage-pc.currentPage-7 ) : ( pc.currentPage-1 ) ) : ( pc.currentPage-1 )--%>
                    <%--                (pc.currentPage-1) > 10 ? (11-pc.currentPage) :(pc.currentPage-1)--%>
                    <%--                    !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!BUG--%>
                    <c:if test="${(pc.currentPage)==i}">
                        <li class="active"><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${i}&rows=10">${i}</a></li>
                    </c:if>

                    <c:if test="${(pc.currentPage)!=i}">
                        <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${i}&rows=10">${i}</a></li>
                    </c:if>
                    <%--                </c:if>--%>

                </c:forEach>
            </c:if>
            <%--标签页主体--%>

            <%--    标签页主体大量页面        --%>

            <%--向前翻页功能--%>
            <c:if test="${pc.currentPage == pc.totalPage}">
                <li><a href="#" aria-label="Next"><span aria-hidden="true">></span></a></li></c:if>
            <%--/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${pc.currentPage + 1}&rows=10--%>
            <c:if test="${pc.currentPage != pc.totalPage}">
                <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${pc.currentPage + 1}&rows=10" aria-label="Next"><span aria-hidden="true">></span></a></li></c:if>
            <li><a href="/PortCargoSystem_war_exploded/FindCargoByPageServlet?currentPage=${pc.totalPage}&rows=10">>></a></li>
            <%--    <li><a href="#">jump</a></li>--%>
        </ul>
    </nav>
    <div><br><p class="f1">共计${pc.totalCount}条记录,共计${pc.totalPage}页</p></div>

    <div><br><br>
        <br></div>
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