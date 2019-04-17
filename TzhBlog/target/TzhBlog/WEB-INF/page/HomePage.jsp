
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<link rel="stylesheet" href="<%=basePath%>/resources/dist/css/bootstrap.min.css"/>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="<%=basePath%>/resources/layui/layui.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="<%=basePath%>/layui/css/layui.css" media="all">
</head>
<body>
<c:set var="username1" value="${requestScope.username1}"/>
<c:set var="username2" value="${requestScope.username2}"/>
<c:set var="username3" value="${requestScope.username3}"/>
<c:set var="username4" value="${requestScope.username4}"/>
<c:set var="username5" value="${requestScope.username5}"/>
<c:set var="username6" value="${requestScope.username6}"/>
<div>
    <div style="position: fixed;z-index: 1">
        <jsp:include page="#{basepath}/header.jsp"/>
    </div>

    <div style="width: 100%;padding-top: 1%;height: 150px">
        <div style="width: 20%;float: left;padding-top: 3.5%;height: 150px;position: fixed">
            <div style="padding-left: 68%">
                <ul class="nav nav-pills nav-stacked">
                    <li class="active"><a href="<%=basePath%>/Blog/HomePage">Home</a></li>
                    <li><a href="<%=basePath%>Blog/home?type=java">java</a></li>
                    <li><a href="<%=basePath%>">linux</a></li>
                    <li><a href="<%=basePath%>">mysql</a></li>
                    <li><a href="<%=basePath%>">web开发</a></li>
                    <li><a href="<%=basePath%>">PHP</a></li>
                    <li><a href="<%=basePath%>">c++</a></li>
                    <li><a href="<%=basePath%>">html</a></li>
                    <li><a href="<%=basePath%>">安全</a></li>
                    <li><a href="<%=basePath%>">物联网</a></li>
                    <li><a href="<%=basePath%>">前端</a></li>
                    <li><a href="<%=basePath%>">程序人生</a></li>
                    <li><a href="<%=basePath%>">其他</a></li>
                </ul>
            </div>
        </div>
        <div style="padding-top: 3.5%;width: 80%;float: right;height: 150px;">
            <div style="width: 66%;float: left;padding-left: 2%">
                <div id="myCarousel" class="carousel slide">
                    <!-- 轮播（Carousel）指标 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                        <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                    <!-- 轮播（Carousel）项目 -->
                    <div class="carousel-inner" >
                        <div class="item active">
                            <img src="<%=basePath%>/images/${img1}" alt="First slide">
                            <div class="carousel-caption">为前端工程之崛起而编程</div>
                        </div>
                        <div class="item">
                            <img src="<%=basePath%>/images/${img2}" alt="Second slide">
                            <div class="carousel-caption">终于可以和qq说再见了</div>
                        </div>
                        <div class="item">
                            <img src="<%=basePath%>/images/${img3}" alt="Third slide">
                            <div class="carousel-caption">微信难下神坛</div>
                        </div>
                    </div>
                    <!-- 轮播（Carousel）导航 -->
                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
            <div style="width:100%;float: right;height: 150px;position: fixed;padding-right: 5%;padding-left: 50%">
                <h3 style="padding-top: 4%;padding-left: 30%;"><font color="blue">博客达人</font></h3>
                <div style="float: left;width: 70%;padding-left: 5%">
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img11}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username1}&page=1">${nickname1}</a>
                        <label>等级：${grade1}</label>
                    </div>
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img22}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username2}&page=1">${nickname2}</a>
                        <label>等级：${grade2}</label>
                    </div>
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img33}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username3}&page=1">${nickname3}</a>
                        <label>等级：${grade3}</label>
                    </div>
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img4}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username4}&page=1">${nickname4}</a>
                        <label>等级：${grade4}</label>
                    </div>
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img5}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username5}&page=1">${nickname5}</a>
                        <label>等级：${grade5}</label>
                    </div>
                    <div style="padding-left: 10%;padding-top: 5%">
                        <img src="<%=basePath%>/photo/${img6}" class="layui-nav-img">
                        <label>推荐博主：</label>
                        <a href="<%=basePath%>/Blog/view_User?username=${username6}&page=1">${nickname6}</a>
                        <label>等级：${grade6}</label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div style="padding-top: 330px;height: auto">
    <div style="padding-top: 110px;">
        <section class="content">
        <div style="padding-left: 21.5%;padding-right: 27%">
            <table class="table table-hover table-responsive table-striped table-bordered" border="1">
                <thead>
                <th>博主</th>
                <th>文章名称</th>
                <th>文章类型</th>
                <th>创建时间</th>
                <th></th>
                </thead>
                <c:forEach items="${users}" var="li">
                    <tr id="${li.user.username}">
                        <td>${li.user.nickname}</td>
                        <td><a href="<%=basePath%>/Blog/view_blog?id=${li.id}&username=${li.user.username}">${li.article_name}</a></td>
                        <td>${li.blog_sort}</td>
                        <td><fmt:formatDate type="both" value="${li.write_time}" /></td>
                        <td>
                            <c:if test="${li.follow_type=='0'}">
                                <button id="follow"
                                        class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">关注一下
                                </button>
                            </c:if>
                            <c:if test="${li.follow_type=='1'}">
                                <button id="followcal" class="layui-btn layui-btn-lg layui-btn-primary layui-btn-radius">取消关注
                                </button>
                            </c:if>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <hr>
        </div>
    </section>
    </div>
</div>

</body>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>

<script>
    $(function () {
        $(".content").delegate("#follow", "click", function () {
            var pa = $(this).parents("tr");
            var parvalue = pa.attr("id");
            window.location.href="<%=basePath%>/Blog/follow.do?page=1&username="+parvalue;
        });
        $(".content").delegate("#followcal", "click", function () {
            var pa = $(this).parents("tr");
            var parvalue = pa.attr("id");
            window.location.href="<%=basePath%>/Blog/followcal.do?username="+parvalue;
        });
    })
</script>
</html>
