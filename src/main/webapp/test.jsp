<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <h1>test</h1>
    <table>
        <tr><th>编号</th><th>用户名</th><th>性别</th><th>手机</th><th>邮箱</th></tr>
        <tr>
            <c:forEach items="${users}" var="user" varStatus="s">
                <tr>
        <td>${s.count}</td>
        <td>${user.username}</td>
        <td>${user.gender}</td>
        <td>${user.phone}</td>
        <td>${user.email}</td>
    </tr>
            </c:forEach>
        </tr>
    </table>
</body>
</html>

<a href="hello-servlet">Hello Servlet</a>
<a href="${pageContext.request.contextPath}/UserListServlet">test</a>