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
<c:set var="def" value="${requestScope.def}"/>
<c:set var="totalUsers" value="${requestScope.totalUsers}"/>
<c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
<c:set var="totalPages" value="${requestScope.totalPages}"/>
<c:set var="beginIndex" value="${requestScope.beginIndex}"/>
<c:set var="endIndex" value="${requestScope.endIndex}"/>
<c:set var="page" value="${requestScope.page}"/>
<c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
<div style="border:1px dashed #000;height: 2px;margin-top: 1px;width: 100%;background-color: white;position: relative">
    <jsp:include page="#{basePath}/header.jsp"/>
</div>
<div style="float: left;padding-left: 5%;width: 30%">
    <div style="padding-top: 0px;padding-left: 4%;padding-right: 4%;background-color:  #c2c2c2">
        <ul>
            <li style="float: left;padding-left: 50px;list-style: none">
                <span>Tang.blog-></span>
            </li>
            <li style="float: left;padding-left: 10px;list-style: none">
                <span>问答首页-></span>
            </li>
            <li style="float: left;padding-left: 10px;list-style: none">
                <a href="<%=basePath%>/Blog/hasWork">
                    已解决
                </a>
            </li>
            <li style="float: left;padding-left: 10px;list-style: none">
                <a href="<%=basePath%>/Blog/NoWork">
                    <span style="color: blue">
                        未解决
                    </span>
                </a>
            </li>
        </ul>
    </div>
    <div>
        <div style="height: auto;width: 100%;padding-right: 5%;float: left;">
            <p>帖子标题：</p>
            <h2 style="padding-top: 10px">${note.note_title}</h2>
            <p>帖子内容：</p>
            <div>
                ${note.note_content}
            </div>
            <p>分数：${note.note_score}</p>
            <p>发布于：<fmt:formatDate type="both" value="${note.write_time}"/></p>
            <p>标签：${note.note_mark},${note.note_markt}</p>
            <p></p><p></p><p></p><p></p>
            <div style="color: red;">
                抄袭、复制答案，在Tang.blog问答是严格禁止的,一经发现立刻封号。是时候展现真正的技术了！
            </div>
        </div>
    </div>
</div>
<form action="<%=basePath%>/Blog/WantAnswer?id=">
    <div style="float: right;width: 60%">
        <div style="width: 100%;height: auto;padding-left: 3%;padding-top: 10px;float: left">
            <div style="height: auto">
                <div id="content-editormd" class="form-group">
                <textarea style="display:none;" class="form-control" id="content-editormd-markdown-doc"
                          name="content-editormd-markdown-doc">
                </textarea>
                    <input style="display: none" id="id" name="id" value="${note.id}">
                </div>
            </div>
        </div>

            <div style="width: 15%;padding-left: 5%;padding-right: 5%;float: right">
                <div style="float: right;width: auto">
                    <button class="layui-btn layui-btn-normal layui-btn-radius" type="submit">我要回答</button>
                </div>
            </div>

    </div>
</form>

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




