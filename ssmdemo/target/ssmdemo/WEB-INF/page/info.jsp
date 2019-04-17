
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<head>
    <title>Title</title>
</head>
<body>

<br/>
<br/>
<br/>
<center>

        <button type="button" class="btn btn-success btn-lg" style="margin-top: 166px;">添加客户信息成功！</button>

</center>
</body>
</html>
