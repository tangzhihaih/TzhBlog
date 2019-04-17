<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/11/011
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    Date date = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String nowDate = sdf.format(date);
%>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/resources/font-awesome.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>



    <div class="container">
        <h2 class="text-center" style="color: #1D9D73;font-family:Microsoft YaHei;margin-top: 66px;">发布消息添加</h2>
        <hr/>
        <br/>
        <form class="form-inline text-center" name="form2" method="post" >
            <div class="form-control">
                <textarea class="form-control" rows="16" cols="100" name="textname" id="textname"></textarea>

            </div>
        </form>
        <br>
        <div style="padding-top: 35%;padding-left: 45%">
            <input type="submit" class="btn btn-success text-center" value="发布消息" onclick="MessageClick()">
        </div>
    </div>
<script>
    function MessageClick(nowDate) {
        location.href="<%=basePath%>/readmin/toPublishMessages";
    }
</script>



</body>
</html>
