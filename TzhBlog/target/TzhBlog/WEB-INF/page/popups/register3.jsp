<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta name="format-detection" content="telephone=no" />
    <meta name="viewport" content="user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1, width=device-width, height=device-height" />
    <meta charset="utf-8">
    <title>注册页</title>
</head>
<link href="<%=basePath%>/resource/css/common.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="<%=basePath%>/resource/js/jquery.js"></script>
<script type="text/javascript" src="<%=basePath%>/resource/js/jquery.validate.js"></script>
<script type="text/javascript" src="<%=basePath%>/resource/js/interaction.js"></script>
<style type="text/css">
    body{
        font-family: "华文细黑";
        background:url("<%=basePath%>/images/register.jpg") no-repeat;
        background-size: 100%;
    }
</style>
<body style="background-color:#f4f4f4;">
<div class="headBar">
    <a href="javascript:history.back(-1)"><img class="headleft" src="<%=basePath%>/resource/images/backjt.png"/></a>
    <span>手机注册</span>
</div>
<div class="mth1"></div>
<div class="mid mt20" >
    <img class="successimg" src="<%=basePath%>/resource/images/successicon.png" style="padding-left: 35%"/>
    <span class="successtip">恭喜，您已成功注册！</span>
</div>
<div class="register">
    <form id="registerForm2" action="<%=basePath%>/login.jsp">
        <div class="mid mt10" style="width:80%;">
            <input type="submit" style="color:#fff;font-size:16px; background:#2d94fb;border:none;border-radius:2px; width:30%;" value="立即登入" />
        </div>
    </form>
</div>
</body>
</html>

