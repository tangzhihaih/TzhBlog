<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>后台管理</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/resources/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo" style="font-size: 13px;"><strong>电商管理系统</strong></div>
        <ul class="layui-nav layui-layout-left">
            <li class="layui-nav-item"><a href="<%=basePath%>/" style="text-decoration: none;"><strong>首页</strong></a></li>
        </ul>
        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;" style="text-decoration: none;">
                    <img src="<%=basePath%>/resources/avatar.png" class="layui-nav-img">
                 <%--   可以直接写adminName也可以取值，因为已经封装到域对象中了--%>
                    <strong>超级管理员：${requestScope.adminName}</strong>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="" style="text-decoration: none;"><strong>基本资料</strong></a></dd>
                    <dd><a href="" style="text-decoration: none;"><strong>安全设置</strong></a></dd>
                    <hr/>
                    <dd  ><strong>退出登录</strong></dd>
                </dl>
            </li>
            <li class="layui-nav-item">
                <a style="text-decoration: none">
                </a>
            </li>

        </ul>
    </div>

    <div class="modal fade" id="trashModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模糊框头部 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title">提示</h4>
                </div>
                <!-- 模糊框主体 -->
                <div class="modal-body">
                    <strong>你确定要退出吗？</strong>
                </div>
                <!-- 模糊框底部 -->
                <div class="modal-footer">
                    <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;商品类别管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: AddSort() ;" style="text-decoration: none;"><strong>新增类别</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: SortRelation();" style="text-decoration: none;"><strong>类别关联</strong></a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;商品管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toAddSort();" style="text-decoration: none;"><strong>新增商品</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toAddProduct() ;" style="text-decoration: none;"><strong>商品上架</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: toRemoveProduct();" style="text-decoration: none;"><strong>商品下架</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;用户管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>搜索管理</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>查看用户信息</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>重置密码</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;订单管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>发货</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>查询</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>确认退款</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;销量统计</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>销售额统计</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>TOP10商品</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;活动管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: toPublishMessage();" style="text-decoration: none;"><strong>活动消息发布</strong></a></dd>

                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;后台权限</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>操作员管理</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>角色管理</strong></a></dd>
                        <dd><a href="javascript:;" onclick="javascript: ;" style="text-decoration: none;"><strong>权限管理</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item">
                    <a style="text-decoration: none;"><strong><span class="fa fa-leaf fa-fw"></span>&nbsp;&nbsp;&nbsp;系统管理</strong></a>
                    <dl class="layui-nav-child">
                        <dd><a href="javascript:;" onclick="javascript: OpreateLog();" style="text-decoration: none;"><strong>操作日志查询</strong></a></dd>
                    </dl>
                </li>
                <li class="layui-nav-item"><a href="<%=basePath%>/" style="text-decoration: none;"><strong><span class="fa fa-twitter fa-fw"></span>&nbsp;&nbsp;&nbsp;关于我们</strong></a></li>
                <li class="layui-nav-item"><a href="<%=basePath%>/" style="text-decoration: none;"><strong><span class="fa fa-send-o fa-fw"></span>&nbsp;&nbsp;&nbsp;联系我们</strong></a></li>
            </ul>
        </div>
    </div>
    <!-- 以上都是共享内容 -->

    <!-- 内容主体区域 -->
    <div class="layui-body">
        <div id="content">
            <div style="font-size: 52px;color: #1D9D73;margin-top: 166px;" class="text-center"><strong>欢迎登录电商管理系统</strong></div>
            <p class="text-center">
            </p>
        </div>
    </div>

    <div class="layui-footer">
        <!-- 底部固定区域 -->
        <strong>© 后台电商管理系统&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong>
        <strong class="layui-layout-right">系统时间：<%=nowDate%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>
    </div>
</div>
</body>
<script>

</script>
<script src="<%=basePath%>/resources/layui/layui.js"></script>
<script src="<%=basePath%>/resources/bootstrap.min.js"></script>
<script src="<%=basePath%>/resources/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
    layui.use('element', function(){
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function toAddSort() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/user/toAddSort.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toAddProduct() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/admin/toAddProduct?page="+1+"\" width=\"100%\" height=\"100%\"></object>";
    }
    function toRemoveProduct() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/readmin/toRemoveProduct?page="+1+"\" width=\"100%\" height=\"100%\"></object>";
    }
    function AddSort() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/admin/AddSort.do\" width=\"100%\" height=\"100%\"></object>";
    }function SortRelation() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/admin/SortRelation.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function OpreateLog() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/admin/toOpreateLog.do\" width=\"100%\" height=\"100%\"></object>";
    }
    function toPublishMessage() {
        document.getElementById("content").innerHTML = "<object type=\"text/html\" data=\"<%=basePath%>/admin/toPublish.do\" width=\"100%\" height=\"100%\"></object>";
    }
</script>

</html>