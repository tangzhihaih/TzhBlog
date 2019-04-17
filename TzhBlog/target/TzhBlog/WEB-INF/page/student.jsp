<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>我的收藏</title>
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <script src="<%=basePath%>/resources/bootstrap.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
</head>

<body style="background-color: #DDDDDD;height: 100%">
<div style="border:1px dashed #000;height: 2px;margin-top: 1px;width: 100%;background-color: white;position: relative">
    <jsp:include page="#{basePath}/header.jsp"/>
</div>
<div >
    <div class="col-sm-3 col-md-2 sidebar" style="margin-left: 12%;background-color: white;">
        <ul class="nav nav-sidebar">
            <li class="active"><a href="<%=basePath%>/User/leftModel">个人资料 <span class="sr-only">(current)</span></a></li>
            <li><a href="<%=basePath%>/Blog/storage?page=1">我的收藏</a></li>
            <li><a href="<%=basePath%>/Blog/attention?page=1">我的关注</a></li>
            <li><a href="<%=basePath%>/Blog/fans">我的粉丝</a></li>
        </ul>
        <ul class="nav nav-sidebar">
            <li><a href="<%=basePath%>/Blog/default?page=1">我的博客</a></li>
            <li><a href="<%=basePath%>/Blog/MyAllNote?page=1">我的帖子</a></li>
            <li><a href="<%=basePath%>/User/account">账号设置</a></li>
        </ul>
    </div>
    <div style="margin-left: 28.7%;height: 70%;margin-right: 10%;background-color: white"><%--/**/#f5f5f5--%>
        <div style="border-bottom: 0.3px solid  #000;width: 100%">
            <br/><br/>
            <h4 style="padding-left: 5%">我的学员</h4>
            <br/>
        </div>
        <div style="height: 100%;width: 100%;">
            <img src="<%=basePath%>/images/block.png" style="height: 100%;width: 100%">
        </div>
    </div>
</div>
<div style="position: fixed;padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>

</body>
</html>
