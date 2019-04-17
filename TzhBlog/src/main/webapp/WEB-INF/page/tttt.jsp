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
        <div style="border-bottom: 0.3px solid  #000;width: 100%">
            <div style="float: left;width: 20%">
                <h4 style="padding-left: 5%">我的帖子</h4>
                <br/>
            </div>
            <div style="width: 80%;float:right ;padding-top: 2%">
                <a href="<%=basePath%>/Blog/default?page=1">默认</a>
                <a href="<%=basePath%>/Blog/updateTime?page=1">按更新时间</a>
                <a href="<%=basePath%>/Blog/viewCount?page=1">按访问量</a>
            </div>
        </div>
        <form>
            <section class="content">
                <div class="box">
                    <div class="box-body">

                            <table class="table table-hover table-responsive table-striped table-bordered"
                                   border="1">
                                <thead>
                                <th>帖子名称</th>
                                <th>帖子类型</th>
                                <th>创建时间</th>
                                <th>操作</th>
                                </thead>
                                <c:forEach items="${list}" var="li">
                                    <tr >
                                        <td>${li.remark}</td>
                                        <td>${li.nickname}</td>
                                        <td>${li.place}</td>
                                        <td>${li.article_name}</td>
                                    </tr>
                                </c:forEach>
                            </table>
                    </div>
                </div>
            </section>
        </form>
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
    $(function () {
        $(".content").delegate("#btn-del", "click", function () {
            var pa = $(this).parents("tr");
            var par_value = pa.attr("id");
            layer.confirm('真的删除行么',{btn: ['确定', '取消'],title:"提示"}, function () {
                $.ajax({
                    type: "POST",
                    url: "<%=basePath%>/Blog/delete_note?id="+par_value,
                    data: null,
                    dataType:'json',
                    success: function (msg) {
                        if (msg["success"]) {
                            layer.msg('删除成功', {time: 2700}, function () {
                                pa.remove();
                                layer.close(index);
                            });
                            window.location.reload();
                        }
                    },

                });
            });
        });
    })
</script>
<script>
    layui.use(['layer', 'laypage', 'element'], function() {
    });
</script>
</body>
</html>
