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
    <div style="margin-left: 28.7%;height: 70%;margin-right: 10%;background-color: white"><%--/**/#f5f5f5--%>
        <div style=" border-bottom: 0.3px solid  #000 ;width: 100%;height: 4%">
            <div style="float: left;width: 30%;height: 100%">
                <h4 style="padding-left: 10%;padding-top: 1%;">我的粉丝</h4>
                <br/>
            </div>
            <div style="padding-left: 70%;float: right;padding-right: 10%;height: 100%">
                <c:if test="${is_zero=='1'}">
                    共${totalUsers}人
                </c:if>
            </div>
        </div>
        <section class="content">
            <div class="box">
                <div class="box-body">
                    <c:if test="${is_zero=='0'}">
                        <div style="height: 100%;width: 100%;">
                            <img src="<%=basePath%>/images/block.png" style="height: 80%;width: 100%">
                        </div>
                    </c:if>
                    <c:if test="${is_zero=='1'}">
                        <table class="table table-hover table-responsive table-striped table-bordered"
                               border="1">
                            <thead>
                            <th></th>
                            </thead>
                            <c:forEach items="${currentPageUsers}" var="li">
                                <tr id="${li.user.username}">
                                    <td>
                                        <img src="<%=basePath%>/photo/${li.img.img_name}" class="layui-nav-img">
                                        <a href="<%=basePath%>/Blog/view_User?username=${li.user.username}&page=1">${li.user.nickname}</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="text-center" style="margin-top: 0px">
                            <nav>
                                <ul class="pagination">

                                    <li><a href="<c:url value="${basePath}/Blog/fans?page=1"/>">首页</a>
                                    </li>

                                    <li>
                                        <a href="<c:url value="${basePath}/Blog/fans?page=${page-1>1?page-1:1}"/>">&laquo;</a>
                                    </li>

                                    <c:forEach begin="1" end="${totalPages}" varStatus="loop">
                                        <c:set var="active" value="${loop.index==page?'active':''}"/>

                                        <li class="${active}"><a
                                                href="<c:url value="${basePath}/Blog/fans?page=${loop.index}"/>">${loop.index}</a>
                                        </li>

                                    </c:forEach>
                                    <li>
                                        <a href="<c:url value="${basePath}/Blog/fans?page=${page+1<totalPages?page+1:totalPages}"/>">&raquo;</a>
                                    </li>
                                    <li>
                                        <a href="<c:url value="${basePath}/Blog/fans?page=${totalPages}"/>">尾页</a>
                                    </li>
                                </ul>

                            </nav>
                        </div>
                    </c:if>
                </div>
            </div>
        </section>
    </div>
</div>
<div style="position: fixed;padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>

<script>
    $('input:radio').click(function(){
        var $radio = $(this);
        // if this was previously checked
        if ($radio.data('waschecked') == true){
            $radio.prop('checked', false);
            $radio.data('waschecked', false);
        } else {
            $radio.prop('checked', true);
            $radio.data('waschecked', true);
        }
    });
</script>
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


