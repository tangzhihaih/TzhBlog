<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<head>
    <title>AddProduct</title>
    <link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
    <script src="<%=basePath%>/resources/layui/layui.js"></script>
    <style type="text/css">
        .content {
            width: 100%;
            margin: 0% 0% 0 0%;
            height: 53%;
        }

    </style>
</head>
<body class="content">
<div class="container">
    <c:set var="totalUsers" value="${requestScope.totalUsers}"/>
    <c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
    <c:set var="totalPages" value="${requestScope.totalPages}"/>
    <c:set var="beginIndex" value="${requestScope.beginIndex}"/>
    <c:set var="endIndex" value="${requestScope.endIndex}"/>
    <c:set var="page" value="${requestScope.page}"/>
    <c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
    <p>用户总数:${totalUsers}</p>
    <p>每页用户数:${usersPerPage}</p>
    <p>总页数:${totalPages}</p>
    <p>当前页:${page}</p>
    <table class="table table-hover table-responsive table-striped table-bordered" border="1">
        <thead>
        <tr>
            <th style="width: auto">商品名称</th>
            <th style="width: auto">商品原价格</th>
            <th style="width: auto">商品价格</th>
            <th style="width: auto">商品库存</th>
            <th style="width:80px">创建时间</th>
            <th style="width: auto">操作</th>
            <th style="width: auto">商品状态</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${currentPageUsers}" var="c">
            <tr>
                <td>${c.name}</td>

                <td>${c.originalPrice}</td>
                <td>${c.promotePrice}</td>
                <td>${c.stock}</td>
                <td><fmt:formatDate value="${c.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                    <input type="button" value="商品上架" style="color: #0000cc;size: 20px " onclick="upProduct(${c.id})">
                </td>
                <td style="color: #0000cc;size: 20px ">商品已下架</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <hr>
    <div class="text-center">
        <nav>
                    <ul class="pagination" >

                            <li><a href="<c:url value="${basePath}>/admin/toAddProduct?page=1"/>">首页</a><>

                            <li><a href="<c:url value="${basePath}/admin/toAddProduct?page=${page-1>1?page-1:1}"/>">&laquo;</a>

                        <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                            <c:set var="active" value="${loop.index==page?'active':''}"/>

                                <li class="${active}"><a
                                        href="<c:url value="${basePath}/admin/toAddProduct?page=${loop.index}"/>">${loop.index}</a>
                                </li>
                        </c:forEach>
                        <li>
                            <a href="<c:url value="${basePath}/admin/toAddProduct?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                        </li>
                        <li><a href="<c:url value="${basePath}/admin/toAddProduct?page=${totalPages}"/>">尾页</a></li>
                        <li style="font-size: 20px;font-family: 微软雅黑;color: #0000cc">总页数${totalPages}>当前第${page}页</li>
                    </ul>
        </nav>
    </div>
</div>
<script>
    function upProduct(id) {
        location.href="<%=basePath%>/readmin/updateAddProduct?id="+id;
    }

</script>
</body>
</html>
