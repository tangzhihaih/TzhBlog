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
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <script src="<%=basePath%>/resources/bootstrap.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
    <link href="<%=basePath%>/layui/dist/css/layui.css">
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
<div style="padding-top: 61px;padding-left: 15%;padding-right: 30%;background-color:  #c2c2c2;height: auto">
    <ul>
        <li style="float: left;padding-left: 50px;list-style: none">
            <span>Tang.blog-></span>

        </li>
        <li style="float: left;padding-left: 10px;list-style: none">
            <span>问答首页-></span>

        </li>
        <li style="float: left;padding-left: 10px;list-style: none">
            <a href="<%=basePath%>/Blog/hasWork">已解决</a>

        </li>
        <li style="float: left;padding-left: 10px;list-style: none">
            <a href="<%=basePath%>/Blog/NoWork">未解决</a>
        </li>
    </ul>
</div>
<div>
    <div>
        <section class="content">
            <div style="padding-left: 15%;padding-right: 15%">
                <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                    <thead>
                    <th>博主</th>
                    <th>帖子名称</th>
                    <th>创建时间</th>
                    <th>标签</th>
                    </thead>
                    <c:forEach items="${currentPageUsers}" var="li">
                        <tr>
                            <td>${li.user.nickname}</td>
                            <td>${li.note_title}</td>
                            <td><fmt:formatDate type="both" value="${li.write_time}" /></td>
                            <td>
                                    ${li.note_mark}.${li.note_markt}
                                <c:if test="${li.finish=='0'}">
                                    <a href="<%=basePath%>/Blog/answerNote?id=${li.id}">回答</a>
                                </c:if>
                                <c:if test="${li.finish=='1'}">
                                    <a href="#">已结帖</a>
                                </c:if>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </section>
    </div>
</div>
<div style="padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
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
</body>
</html>



