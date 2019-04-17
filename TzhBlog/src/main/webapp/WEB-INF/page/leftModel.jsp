<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>个人资料</title>
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <script src="<%=basePath%>/resources/bootstrap.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
    <link href="<%=basePath%>/layui/css/layui.css">
    <script src="<%=basePath%>/layui/layui.all.js"></script>
    <script src="<%=basePath%>/layer/layer.js"></script>
</head>
<body style="background-color: #DDDDDD;">
<div style="border:1px dashed #000;height: 2px;margin-top: 1px;width: 100%;background-color: white;position: relative">
    <jsp:include page="#{basePath}/header.jsp"/>
</div>

<div >
    <div class="col-sm-3 col-md-2 sidebar" style="margin-left: 12%;background-color: white;">
        <ul class="nav nav-sidebar">
            <li class="active"><a href="<%=basePath%>/User/leftModel">个人资料 <span class="sr-only">(current)</span></a></li>
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
    <div style="margin-left: 28.7%;height: 70%;margin-right: 10%;background-color: white">
        <div style="border-bottom: 0.3px solid  #000;width: 100%">
            <br/><br/>
            <h4 style="padding-left: 5%">个人资料</h4>
            <br/>
        </div>
        <div style="height: 100%;width: 100%;float: left">
            <div style="height: 100%;width: 15%;float: left">
                <img src="/photo/${img_name}" style="border-radius: 50%;width: 90px;height: 90px;margin-left: 20px;margin-top: 20px;" >
                <p></p>
                <button style="padding-left: 20%;border:none;outline:none;background-color: white"
                        id="change" onmouseover="change()" onmouseout="back()" >修改图像</button>
            </div>
            <div style="height: 100%;width: 100%;">
                <div style="border-bottom: 0.5px solid grey;margin-left: 15%">
                    <p></p>
                    <p>ID:&nbsp;&nbsp;${name}<span style="padding-left: 87%;padding-top: 4%">
                        <a href="<%=basePath%>/Blog/view_User?username=${username}&page=1" style="text-decoration: none">个人主页></a></span></p>
                    <p>关注:&nbsp;&nbsp;${follow__count}&nbsp;粉丝:&nbsp;&nbsp;${fans_count}</p>
                </div>
                <div>
                    <div style="float: left">
                        <p></p>
                        <p>昵称:&nbsp;&nbsp;${name}</p>
                        <p>实名:&nbsp;&nbsp;${truename}</p>
                        <p>性别:&nbsp;&nbsp;${sex}</p>
                        <p>生日:&nbsp;&nbsp;${birthday}</p>
                        <p>地区:&nbsp;&nbsp;${place}</p>
                        <p>行业:&nbsp;&nbsp;${work}</p>
                        <p>职位:&nbsp;&nbsp;${job}</p>
                        <p>简介:&nbsp;&nbsp;${remark}</p>
                    </div>
                    <div style="float: right;padding-right: 4%;padding-top: 3.5%">
                        <button  class="layui-btn layui-btn-normal layui-btn-radius" id="changMessage">修改资料</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%=basePath%>/layui/dist/layui.js"></script>
<div style="position: fixed;padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>
<script>
    function change() {
        document.getElementById("change").style.color='blue';
    }
    function back() {
        document.getElementById("change").style.color='black';
    }
    $(function () {
        $("#change").click(function () {
            layui.use(['layer', 'laypage', 'element'], function () {
                layer.open({
                    title:false,
                    type:2,
                    offset:'auto',
                    maxmin:false,
                    area:['700px','350px'],
                    content:"<%=basePath%>/User/upLoad",
                });
            });
        });
    })
</script>
<script>
    $(function () {
        $("#changMessage").click(function () {
            layui.use(['layer', 'laypage', 'element'], function () {
                layer.open({
                    title:"修改资料",
                    type:2,
                    offset:'auto',
                    maxmin:false,
                    area:['500px','500px'],
                    content:"<%=basePath%>/User/changMessage",
                });
            });
        })
    })
</script>
</body>
</html>
