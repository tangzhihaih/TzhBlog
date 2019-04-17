<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/6/006
  Time: 9:25
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>

<div class="container">
    <h2 class="text-center" style="color: #1D9D73;font-family:Microsoft YaHei;margin-top: 66px;">新增下架信息录入</h2>
    <hr/>
    <br/>
    <form class="form-inline text-center" name="form2" action="<%=basePath%>/" method="post" onSubmit="return myCheck()">
        <div hidden="hidden">
            <!-- 这个id值默认中数据库中查询 -->
            <input type="text" name="p_id" class="form-control" value="${newId}"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品名称：</label>
            <input type="text" name="p_name" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>商品描述：</label>
            <input type="text" name="p_title" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>：</label>
            <input type="text" name="p_count" class="form-control"/>
        </div>
        <br/>
        <br/>
        <input type="submit" class="btn btn-success text-center" value="确定下架"/>
        <input type="reset" class="btn btn-danger text-center" value="重置"/>
    </form>
</div>



<%--检测输入表单输入值是否为空--%>
<script type="text/javascript">
    function myCheck()
    {
        for(var i=0;i<=document.form2.elements.length-1;i++)
        {
            if(document.form2.elements[i].value=="")
            {

                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('当前输入不能有空项');
                });
                document.form2.elements[i].focus();
                return false;
            }
        }
        return true;

    }
</script>
</body>
</html>

