<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<html lang="zh">
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<head>
    <meta charset="utf-8" />
    <title>tang.blog</title>
    <link rel="stylesheet" href="<%=basePath%>/editor.md/css/style.css" />
    <link rel="stylesheet" href="<%=basePath%>/editor.md/css/editormd.css" />
    <link rel="shortcut icon" href="https://pandao.github.io/editor.md/favicon.ico" type="image/x-icon" />
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <script src="<%=basePath%>/editor.md/editormd.min.js"></script>

    <link rel="stylesheet" href="<%=basePath%>/layui/dist/css/layui.css" media="all">
    <link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">
    <script src="<%=basePath%>/resources/jquery.min.js"></script>
    <link href="<%=basePath%>/css/dashboard.css" rel="stylesheet">
    <link href="<%=basePath%>/layui/css/layui.css">
</head>

<c:set var="totalUsers" value="${requestScope.totalUsers}"/>
<c:set var="usersPerPage" value="${requestScope.usersPerPage}"/>
<c:set var="totalPages" value="${requestScope.totalPages}"/>
<c:set var="beginIndex" value="${requestScope.beginIndex}"/>
<c:set var="endIndex" value="${requestScope.endIndex}"/>
<c:set var="page" value="${requestScope.pa}"/>
<c:set var="currentPageUsers" value="${requestScope.users.subList(beginIndex,endIndex)}"/>
<body>
<jsp:include page="#{basePath}/header.jsp"/>
<div style="padding-top: 61px;padding-left: 20%;padding-right: 26%">
    <div class="layui-tab layui-tab-card" style="height: 550px;">
        <ul class="layui-tab-title">
            <li class="layui-this">博客</li>
            <li>帖子</li>
        </ul>
        <div class="layui-tab-content" style="height: 100px;">
            <div class="layui-tab-item layui-show" style="float: left">
                <div style="width: 100%;height: 40px;border-bottom: 1px slategrey">
                    <ul>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>博客：${grade}</span>
                            <strong>等级</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${visit_count}</span>
                            <strong>访问</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${orginal_count}</span>
                            <strong>原创</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${count}</span>
                            <strong>排名</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>11</span>
                            <strong>评论</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${like_count}</span>
                            <strong>获赞</strong>
                        </li>
                    </ul>

                </div>
                <c:if test="${zero=='0'}">
                    <div style="height: 80%;width: 100%;">
                        <img src="<%=basePath%>/images/block.png" style="height: 40%;width: 100%">
                    </div>
                </c:if>
                <c:if test="${zero=='1'}">
                    <div style="width: 115%;height: 450px">
                        <section class="content">
                            <div style="padding-left: 15%;padding-right: 15%">
                                <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                                    <thead>
                                    <th style="width: 33%">文章名称</th>
                                    <th style="width: 33%">阅读次数</th>
                                    <th style="width: 33%">创建时间</th>
                                    </thead>
                                    <c:forEach items="${currentPageUsers}" var="li">
                                        <tr >
                                            <td>${li.article_name}</td>
                                            <td>${li.visit_count}</td>
                                            <td><fmt:formatDate value="${li.write_time}"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                                <hr>
                                <div class="text-center">
                                    <nav>
                                        <ul class="pagination">
                                            <li><a href="<c:url value="${basePath}/Blog/view_User?page=1&username=${username}"/>">首页</a></li>
                                            <li><a href="<c:url value="${basePath}/Blog/view_User?page=${page-1>1?page-1:1}&username=${username}"/>">&laquo;</a>
                                            </li>
                                            <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                                <c:set var="active" value="${loop.index==page?'active':''}"/>
                                                <li class="${active}"><a href="<c:url value="${basePath}/Blog/view_User?page=${loop.index}&username=${username}"/>">${loop.index}</a></li>
                                            </c:forEach>
                                            <li>
                                                <a href="<c:url value="${basePath}/Blog/view_User?page=${page+1<totalPages?page+1:totalPages}&username=${username}"/>">&raquo;</a>
                                            </li>
                                            <li><a href="<c:url value="${basePath}/Blog/view_User?page=${totalPages}&username=${username}"/>">尾页</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                        </section>
                    </div>
                </c:if>
            </div>
            <div class="layui-tab-item">
                <div style="width: 100%;height: 40px;border-bottom: 1px slategrey">
                    <ul>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>博客：${grade}</span>
                            <strong>等级</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${note_count}</span>
                            <strong>发帖</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${back_note}</span>
                            <strong>原创</strong>
                        </li>
                        <li style="float: left;padding-left: 60px;list-style: none">
                            <span>${finish_note}</span>
                            <strong>结帖率</strong>
                        </li>
                    </ul>
                </div>
                <c:if test="${is_zero=='0'}">
                    <div style="height: 80%;width: 100%;">
                        <img src="<%=basePath%>/images/block.png" style="height: 60%;width: 100%">
                    </div>
                </c:if>
                <c:if test="${is_zero=='1'}">
                    <div style="width: 115%;height: 450px">
                        <section class="content">
                            <div style="padding-left: 15%;padding-right: 15%">
                                <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                                    <thead>
                                    <th style="width: 33%">帖子名称</th>
                                    <th style="width: 33%">帖子分数</th>
                                    <th style="width: 33%">创建时间</th>
                                    </thead>
                                    <c:forEach items="${noteList}" var="li">
                                        <tr >
                                            <td>${li.note_title}</td>
                                            <td>${li.note_score}</td>
                                              <td><fmt:formatDate value="${li.write_time}"/></td>
                                        </tr>
                                    </c:forEach>
                                </table>
                            </div>
                        </section>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>
<div style="padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>
</body>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>

<script>
    layui.use(['layer', 'laypage', 'element'], function() {
    });
</script>
</html>


