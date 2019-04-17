<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 3/26/2019
  Time: 9:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<link href="<%=basePath%>/layui/dist/css/layui.css">
<script src="<%=basePath%>/resources/layui/layui.js"></script>
<link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
    $(function () {
        $.ajax( {
            type:"POST",
            url:"<%=basePath%>/Admin/checkLogin",
            dataType:"json",
            data: null,
            success:function (ms) {
                if(!ms['success']){
                    layui.confirm('确定登录吗',{btn: ['确定', '取消'],title:"提示"}, function () {
                        window.location.href="<%=basePath%>/login.jsp";
                    });
                }
            }
        })
    })
</script>
<script>
    layui.use(['layer', 'laypage', 'element'], function() {
    });
</script>