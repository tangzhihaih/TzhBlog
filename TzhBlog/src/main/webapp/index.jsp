<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">
    <meta name="applicable-device" content="pc,mobile">
    <title>tang.blog登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/index.css">
    <style type="text/css">
        body{
            background:url("<%=basePath%>/images/login.jpg") no-repeat;
            background-size: 100%;
        }
    </style>
</head>
<body>
<div  id="loginModal" style="width:300px;height:500px;padding-left:36%;padding-top:10%;" >
    <div class="modal-dialog modal-sm" style="width:540px;">
        <div class="modal-content" style="border:none;">
            <div class="col-left"></div>
            <div class="col-right">
                <div class="modal-header">
                    <button type="button" id="login_close" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                    <h4 class="modal-title" id="loginModalLabel" style="font-size: 18px;">登录</h4>
                </div>
                <div class="modal-body">
                    <section class="box-login v5-input-txt" id="box-login">
                        <form id="login_form" action="<%=basePath%>/Admin/login" method="post">
                            <ul>
                                <li class="form-group"><input class="form-control" id="name" maxlength="50" name="name" placeholder="请输入账号/手机号" type="text"></li>
                                <li class="form-group"><input class="form-control" id="password" name="password" placeholder="请输入密码" type="password"></li>
                            </ul>
                            <p class="good-tips marginB10"><a id="btnForgetpsw" class="fr">忘记密码？</a>还没有账号？<a href="<%=basePath%>/register.jsp" target="_blank" id="btnRegister">立即注册</a></p>
                            <div class="login-box marginB10">
                                <button  type="submit" class="btn btn-micv5 btn-block globalLogin">登录</button>
                                <div id="login-form-tips" class="tips-error bg-danger" style="display: none;">错误提示</div>
                            </div>
                            <div class="threeLogin"><span>其他方式登录</span><a class="nqq" href="javascript:;"></a><a class="nwx" href="javascript:;"></a><!--<a class="nwb"></a>--></div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="<%=basePath%>/js/jquery2.2.2.min.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/modal.js"></script>
<script type="text/javascript" src="<%=basePath%>/js/script.js"></script>
</body>
</html>
