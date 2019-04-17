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
<div>
    <div class="col-sm-3 col-md-2 sidebar" style="margin-left: 12%;background-color: white;">
        <ul class="nav nav-sidebar">
            <li class="active"><a href="<%=basePath%>/User/leftModel">个人资料 <span class="sr-only">(current)</span></a>
            </li>
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
    <div style="margin-left: 28.7%;height: 70%;margin-right: 15%;background-color: white">
        <div style="height: 50%;width: 100%;padding-bottom: 50%;position: fixed;padding-top: 100px;padding-left: 10%">
            <form method="post" action="<%=basePath%>/Admin/changePassword">
            <h3 style="padding-left: 9%">修改密码</h3>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">当前密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="oldPassword" lay-verify="required" lay-vertype="tips"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">新密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="password" lay-verify="pass" lay-vertype="tips" autocomplete="off"
                           id="LAY_password" class="layui-input">
                </div>
                <div class="layui-form-mid layui-word-aux">6到16个字符</div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <label class="layui-form-label">确认新密码</label>
                <div class="layui-input-inline">
                    <input type="password" name="repassword" lay-verify="repass" lay-vertype="tips" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-form-item" style="margin-top: 20px">
                <div class="layui-input-block">
                    <button type="submit" class="layui-btn" lay-submit="" lay-filter="setmypass">确认修改</button>
                </div>
                <p></p><p></p>
                <p><span style="color: red;padding-left: 30px">更新成功将会自动跳转到登录界面！！！</span></p>
            </div>
            </form>
        </div>
    </div>
</div>
<div style="position: fixed;padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>

</body>
</html>

