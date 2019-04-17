
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/layui/dist/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
    <link href="<%=basePath%>/layui/css/layui.css">
</head>
<body>
<div>
    <div style="width: 20%;float: left">
        <div style="width: 10%;float: left;background-color:black ">
        </div>
        <div style="float: right">
            <img src="<%=basePath%>/images/headC.jpg" style="height: 60px;width: 100%;">
        </div>

    </div>
    <div style="width: 80%;float: right">
        <ul class="layui-nav" style="padding-left: 10%" >
            <li class="layui-nav-item" >
                <a href="<%=basePath%>/Blog/HomePage">HomePage</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Blog/answers">questions-and-answers</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Blog/Community">BlogCommunity</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/User/writeBlog">WriteBlog</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Blog/writeNote">WriteNote</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Markdown/index.jsp">markdown教程</a>
            </li>
            <c:if test="${no_img=='1'}">
                <li class="layui-nav-item" lay-unselect="">
                    <a href="javascript:;"><img src="/photo/${img_name}" class="layui-nav-img">
                        <span class="layui-nav-more"></span></a>
                    <dl class="layui-nav-child">
                        <dd ><a href="<%=basePath%>/Blog/storage?page=1">我的收藏</a></dd>
                        <dd ><a href="<%=basePath%>/Blog/attention?page=1">我的关注</a></dd>
                        <dd ><a href="<%=basePath%>/User/leftModel">个人中心</a></dd>
                        <dd ><a href="<%=basePath%>/Blog/default?page=1">我的博客</a></dd>
                        <dd ><a href="<%=basePath%>/User/account">账号设置</a></dd>
                        <dd ><a href="<%=basePath%>/Blog/MyAllNote?page=1">我的帖子</a></dd>
                        <dd ><a href="<%=basePath%>/Admin/exit">退出</a></dd>
                    </dl>
                </li>
            </c:if>

        </ul>
    </div>

</div>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script>

    $(function () {
        $("#publishArticle").click(function () {
            layui.use(['layer', 'laypage', 'element'], function () {
                layer.open({
                    title:"请给文章添加标签",
                    type:2,
                    maxmin:false,
                    area:['600px','400px'],
                    content:"<%=basePath%>/User/publishArticle",
                });
            });
        })
    })
</script>
</body>
</html>
