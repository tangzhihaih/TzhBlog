    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
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

    </style>
</head>
<body class="container">
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
<div class="table-responsive">
<table class="table table-hover table-responsive table-striped table-bordered" border="1">
    <thead>



            <th>商品名称</th>

            <th>商品原价格</th>
            <th>商品价格</th>
            <th>商品库存</th>
            <th style="width:80px">创建时间</th>
            <th>操作</th>
            <th>商品状态</th>
        </tr>
        </thead>
        <c:forEach items="${currentPageUsers}" var="c">
            <tr>
                <td>${c.name}</td>
                <td>${c.originalPrice}</td>
                <td>${c.promotePrice}</td>
                <td>${c.stock}</td>
                <td><fmt:formatDate value="${c.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                <td>
                            <input type="button" value="商品下架" style="color: #0000cc;size: 20px " onclick="upProduct(${c.id})">
                <td style="color: #0000cc;size: 20px ">商品已上架</td>
            </tr>

        </c:forEach>
    </table>
    <hr>
    <div class="text-center">
        <nav>
            <ul class="pagination" >

                <li><a href="<c:url value="${basePath}/readmin/toRemoveProduct?page=1"/>">首页</a><>

                <li><a href="<c:url value="${basePath}/readmin/toRemoveProduct?page=${page-1>1?page-1:1}"/>">&laquo;</a>

                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                        <c:set var="active" value="${loop.index==page?'active':''}"/>

                <li class="${active}"><a
                        href="<c:url value="${basePath}/readmin/toRemoveProduct?page=${loop.index}"/>">${loop.index}</a>
                </li>

                    </c:forEach>
                     <li>
                        <a href="<c:url value="${basePath}/readmin/toRemoveProduct?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                     </li>



                <li><a href="<c:url value="${basePath}/readmin/toRemoveProduct?page=${totalPages}"/>">尾页</a></li>
                <li style="font-size: 20px;font-family: 微软雅黑;color: #0000cc">总页数${totalPages}>当前第${page}页</li>
            </ul>

        </nav>
    </div>

</div>
<script>
    function upProduct(id) {
        location.href="<%=basePath%>/readmin/updateRemoveProduct?id="+id;

    }
</script>

</body>
</html>
