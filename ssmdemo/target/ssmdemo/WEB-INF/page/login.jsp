<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
  String path = request.getContextPath();
  String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>管理员登录页面</title>
  <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
  <link rel="stylesheet" href="<%=basePath%>/resources/font-awesome.min.css"/>
  <link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
  <style type="text/css">
    .header{
      background-image: url("<%=basePath%>/img/4.png");
      background-size: 100%;
      height: 280px;
      border-bottom:3px solid blue;
    }
    /* #code{
         font-family:Arial;
         font-style:italic;
         font-weight:bold;
         letter-spacing:2px;
         color: #393D49;
         width: 70px;
     }*/
    #content{
      width:40%;
      margin: 6% 30% 0 30%;
      height: 53%;
    }

  </style>
</head>
<body>
<div class="header">
  <div style="margin: 0 45% 0 45%;padding-top:5%;text-align:center;">

  </div>
</div>

<div class="container">
  <div id="content">
    <h2 class="text-nowrap" style="color: #393D49;text-align:center;padding-top:20px;font-family: Menlo">yt电商管理系统</h2>
    <div style="text-align: center;">
      <br/>
      <br/>
      <label style="font-size:20px;color:white;padding-right:50px;margin-left: 50px;">
        <a href="#" id="login" style="text-decoration: none;border-bottom:2px solid #009688;color:#009688">管理员登录</a>
      </label>

    </div>
    <hr style="color: #484848;text-align:center;"/>
    <!-- 登录的表单 -->
    <form action="<%=basePath%>/user/login" id="loginform" method="post" class="layui-form" style="text-align: center;margin-right:58px;margin-top:40px;">
      <input name="a_id" hidden="hidden" value=""/>
      <div>
        <div class="layui-form-item layui-inline" style="width:110%">
          <label class="layui-form-label" style="margin-left:58px;"><i class="fa fa-user fa-fw"></i></label>
          <div class="layui-input-inline">
            <input type="text" name="username" id="username" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="请输入用户名"/>
          </div>
        </div>

        <br/>
        <div class="layui-form-item layui-inline">
          <label class="layui-form-label">
            <span class="fa fa-lock fa-fw"></span>
          </label>
          <div class="layui-input-inline">
            <input type="password" name="password" id="password" class="layui-input" style="background:none;border: none;border-bottom:1px solid white;" placeholder="请输入密码"/>
          </div>
        </div>
        <br/>
        <br/>
        <div style="text-align:center;color: #009688;background-color: #01AAED;width:48%;margin-left:138px;">
          <input type="submit" class="layui-btn layui-btn-lg" style="background: none;" value="登录"/>
        </div>
      </div>
    </form>

  </div>
</div>
</body>