
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<script src="<%=basePath%>/resources/layui/layui.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
</head>
<body >
<c:set var="totalUsers" value="${requestScope.totalUsers}"/>
<c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
<c:set var="totalPages" value="${requestScope.totalPages}"/>
<c:set var="beginIndex" value="${requestScope.beginIndex}"/>
<c:set var="endIndex" value="${requestScope.endIndex}"/>
<c:set var="username" value="${requestScope.username}"/>
<c:set var="page" value="${requestScope.page}"/>
<c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>

<div>
    <jsp:include page="#{basepth}/header.jsp"/>
    <div>
            <section class="content">
                <div style="padding-left: 15%;padding-right: 15%">
                    <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                        <thead>
                        <th>博主</th>
                        <th>文章名称</th>
                        <th>文章类型</th>
                        <th>创建时间</th>
                        <th></th>
                        </thead>
                        <c:forEach items="${currentPageUsers}" var="li">
                            <tr id="${li.user.username}">
                                <td>${li.user.nickname}</td>
                                <td><a href="<%=basePath%>/Blog/view_blog?id=${li.id}&username=${li.user.username}">${li.article_name}</a></td>
                                <td>${li.blog_sort}</td>
                                <td><fmt:formatDate type="both" value="${li.write_time}" /></td>
                                <td>
                                    <c:if test="${li.follow_type=='0'}">
                                        <a id="follow" href="<%=basePath%>/Blog/follow?username=${li.user.username}&page=${page}"
                                                class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">关注一下
                                        </a>
                                    </c:if>
                                    <c:if test="${li.follow_type=='1'}">
                                        <a id="followcal" href="<%=basePath%>/Blog/followcal?username=${li.user.username}&page=${page}"
                                           class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">取消关注
                                        </a>
                                    </c:if>
                                    <c:if test="${li.follow_type=='3'}">
                                        <label>这是你自己，不能关注哦！</label>
                                    </c:if>
                                </td>
                            </tr>
                        </c:forEach>
                    </table>
                    <hr>
                    <div class="text-center">
                        <nav>
                            <ul class="pagination">
                                <li><a href="<c:url value="${basePath}/Blog/Community?page=1"/>">首页</a></li>
                                <li><a href="<c:url value="${basePath}/Blog/Community?page=${page-1>1?page-1:1}"/>">&laquo;</a>
                                </li>
                                <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                    <c:set var="active" value="${loop.index==page?'active':''}"/>
                                    <li class="${active}"><a href="<c:url value="${basePath}/Blog/Community?page=${loop.index}"/>">${loop.index}</a></li>
                                </c:forEach>
                                <li>
                                    <a href="<c:url value="${basePath}/Blog/Community?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                                </li>
                                <li><a href="<c:url value="${basePath}/Blog/Community?page=${totalPages}"/>">尾页</a></li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </section>
    </div>
</div>
</body>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<script src="<%=basePath%>/resources/jquery.min.js"></script>
</html>
