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
<script type="text/javascript" src="<%=basePath%>/js/jquery2.2.2.min.js"></script>
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

<div class="register">
    <form id="registerForm2" action="<%=basePath%>/Admin/register3">
        <div class="mid " style="width:30%;margin-top: 7%">
            <span class="register2label">您的手机号：+86 ${mobole_Number}</span>
            <br/><br/><br/><br/><label class="tip">请输入您收到的短信验证码</label>
        </div>
        <div class="mid mt15" style="width:30%;">
            <span><img id="registericon2" class="registerinputiconleft" src="<%=basePath%>/resource/images/codeicon.png"/></span>
            <input type="text" id="registercaptcha" name="registercaptcha" style="width:75%;"/>
            <br/><br/><label class="tip" style="text-align:center;margin-top: 5%">
            <input style="border: 0px;outline:none;cursor: pointer;background-color: grey;width: 20px" disabled="disabled" id="timer" value="60"/> S后
            <a  href="register2.jsp" style="color:#ed6301;border-bottom:1px solid #ed6301;">重新发送</a></label>
        </div>
        <div class="mid mt10" style="width:25%;">
            <input type="submit" style="color:#fff;font-size:16px; background:#2d94fb;border:none;border-radius:2px; width:100%;" value="下一步" />
        </div>
    </form>
    <script>
        $(function(){
            var timerVal = $("#timer").val();
            var i = setInterval(function() {
                timerVal--;
                $("#timer").val(timerVal);

                if (timerVal < 1)
                    clearInterval(i);
            }, 1000);
        });
    </script>

</div>
</body>
</html>

