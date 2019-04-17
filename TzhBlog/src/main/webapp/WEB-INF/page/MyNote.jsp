<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html>
<head>
    <title>我的收藏</title>
    <link rel="stylesheet" href="<%=basePath%>/editor.md/css/style.css" />
    <link rel="stylesheet" href="<%=basePath%>/editor.md/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <script src="<%=basePath%>/resources/bootstrap.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
    <link href="<%=basePath%>/layui/dist/css/layui.css">
    <script src="<%=basePath%>/editor.md/editormd.min.js"></script>
    <script src="<%=basePath%>/resources/layui/layui.js"></script>
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
</head>

<body style="background-color: #DDDDDD;height: 100%">

<div style="border:1px dashed #000;height: 2px;margin-top: 1px;width: 100%;background-color: white;position: relative">
    <jsp:include page="#{basePath}/header.jsp"/>
</div>
<div style="float: left;padding-left: 10%;width: 70%">
    <div style="padding-top: 0px;padding-left: 4%;padding-right: 4%;background-color:  #c2c2c2">
        <ul>
            <li style="float: left;padding-left: 50px;list-style: none">
                <span>Tang.blog-></span>
            </li>
            <li style="float: left;padding-left: 10px;list-style: none">
                <span>问答首页-></span>
            </li>
            <li style="float: left;padding-left: 10px;list-style: none">
                <a href="<%=basePath%>/Blog/MyAllNote?page=1">
                    <span style="color: blue">
                        我的帖子
                    </span>
                </a>
            </li>
        </ul>
    </div>

</div>
<div>
    <div style="height: auto;width: 100%;padding-right: 5%;float: left;padding-left: 15%">
        <p></p><p></p>
        <p>帖子标题：</p>
        <h2 style="padding-top: 10px">${note.note_title}</h2>
        <p>帖子内容：</p>
        <div>
            ${note.note_content}
        </div>
        <p>发布于：<fmt:formatDate value="${note.write_time}"/></p>
        <p>标签：${note.note_mark},${note.note_markt}</p>
        <p></p><p></p><p></p><p></p>

    </div>
    <p>回答列表：</p>
    <section class="content">
        <div style="padding-left: 15%;padding-right: 15%">
            <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                <thead>
                <th>博主</th>
                <th>帖子名称</th>
                <th>回答时间</th>
                <th></th>
                </thead>
                <c:forEach items="${answerList}" var="li">
                    <tr>
                        <td>${li.user.nickname}</td>
                        <td>${li.content}</td>
                        <td><fmt:formatDate type="both" value="${li.note.write_time}" /></td>
                        <td>
                            <c:if test="${finish=='0'}">
                                <a href="<%=basePath%>/Blog/finishNote?username=${li.user.username}&id=${note.id}">结贴</a>
                            </c:if>
                            <c:if test="${finish=='1'}">
                                <a href="#">已结贴</a>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </section>
</div>

<script>
    $(function () {
        $('#example1').DataTable()
        $('#example2').DataTable({
            'paging'      : true,
            'lengthChange': false,
            'searching'   : false,
            'ordering'    : true,
            'info'        : true,
            'autoWidth'   : false
        })
    })
</script>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<script>
    layui.use(['layer', 'laypage', 'element'], function() {
    });
</script>
<script type="text/javascript">
    var testEditor;
    $(function() {
        testEditor = editormd("content-editormd", {
            width   : "90%",
            height  : 580,
            syncScrolling : "single",
            path    : "<%=request.getContextPath()%>/lib/",
            imageUpload : true,
            // 图片上传
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/uploadfile",
            saveHTMLToTextarea : true,
            previewTheme : "dark"
        });
    });
    //editor.md期望得到一个json格式的上传后的返回值，格式是这样的：
    /*
     {
     success : 0 | 1,           // 0 表示上传失败，1 表示上传成功
     message : "提示的信息，上传成功或上传失败及错误信息等。",
     url     : "图片地址"        // 上传成功时才返回
     }
     */
</script>
</body>
</html>




