<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<link rel="stylesheet" href="<%=basePath%>/editor.md/css/editormd.min.css"/>
<jsp:include page="#{basePath}/header.jsp"/>
<div style="padding-left: 40%;height: 10%" >
    <div style="height: 100%;float: left">
        <h3>${article.article_name}</h3>
        <p>
            ${article.is_private}&nbsp;&nbsp;&nbsp;${dat}&nbsp;&nbsp;&nbsp;<label>标签:&nbsp;${article.label}</label>
        </p>
    </div>
    <div style="height: 100%;padding-left: 60%">
        <c:if test="${is_zero=='0'}">
        </c:if>
        <c:if test="${is_zero=='1'}">
            <button class="layui-btn layui-btn-normal layui-btn-radius"  id="storage" value="${article.id}" onclick="button_change(this)" >收藏一下</button>
        </c:if>
        <c:if test="${is_zero=='2'}">
            <input style="display: none" value="${article.id}" id="kai">
            <button class="layui-btn layui-btn-normal layui-btn-radius" id="can_storage" value="${present_id}" onclick="button(this)" >取消收藏</button>
        </c:if>
    </div>
</div>
<div id="content-editormd" style="padding-left: 15%;padding-right: 15%;padding-top: 1%" class="page-content">
    ${content}
</div>
<script src="<%=basePath%>/resources/jquery.min.js"></script>
<script src="<%=basePath%>/js/editormd.min.js"></script>
<script src="<%=basePath%>/editor.md/lib/marked.min.js"></script>
<script src="<%=basePath%>/editor.md/lib/prettify.min.js"></script>

<script type="text/javascript">
    $(function () {
        editormd.markdownToHTML("content-editormd");
    })
</script>
<script>
    function button_change(obj) {
        var id=obj.value;
        window.location.href="<%=basePath%>/Blog/storage_article?id="+id;
    }
    function button(obj) {
        var id=obj.value;
        window.location.href="<%=basePath%>/Blog/can_storage?id="+id;
    }
</script>
<script>
    $(function(){
        $(".page-content").find("img").each(function(){
            $(this).attr("src", "data:image/jpeg;base64," + decode64($(this).context.src));
            $(this).css("width", "65%");
            $(this).css("height", "65%");
            $(this).wrap("<div align='center'></div>");
        })

    });

    function decode64(imgUrl){
        $.ajax({
            type: 'post',
            url: "<%=basePath%>/Blog/getImage",
            dataType: "json",
            async: false,
            data : {
                urls : imgUrl,
            },
            success: function (result) {
                imgUrl = result.resImg;
            },
            error: function () {
                console.log("error!");
            }
        });
        return imgUrl;
    }

</script>

</body>
</html>
