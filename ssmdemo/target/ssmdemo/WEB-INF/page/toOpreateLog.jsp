<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/10/010
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<head>
    <title>添加商品功能</title>
    <link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
    <script src="<%=basePath%>/resources/layui/layui.js"></script>
</head>
<body>

<div class="container" style="color: #aa1111;font-size: 40px;font-family: Arial, Helvetica, Tahoma, Verdana, Sans-Serif">
    <p>此页面太复杂</p>
</div>
</body>
</html>
