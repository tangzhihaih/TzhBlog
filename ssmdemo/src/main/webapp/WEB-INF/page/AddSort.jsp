<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/5/005
  Time: 20:10
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
    <style type="text/css">

    </style>
</head>
<body>

<div class="container">
    <h2 class="text-center" style="color: #1D9D73;font-family:Microsoft YaHei;margin-top: 66px;">新增商品类别添加</h2>
    <hr/>
    <br/>
    <form class="form-inline text-center" name="form2" action="<%=basePath%>/admin/AddProductSort" method="post" onSubmit="return myCheck()">
        <br/>
        <br/>
        <div class="form-group form-inline" style="font-size: 2.3ex;font-family: 微软雅黑;">
            <label>商品名称：</label>
            <input type="text" name="sortname" id="sortname" style="border-color: #0000cc;height: 30px;width: 160px;font-size: 2ex;border-radius:5px;"/>
        </div>

        <input type="submit" class="btn btn-success text-center" value="添加"/>
    </form>
</div>



<%--检测输入表单输入值是否为空--%>
<script type="text/javascript">
    function myCheck()
    {


            if(document.form2.elements[0].length==0)
            {

                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('当前输入不能有空项');
                });
                document.form2.elements[i].focus();
                return false;
            }
        return true;


    }
</script>
</body>
</html>
