<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<head>
    <title>添加客户功能</title>
    <link rel="stylesheet" href="<%=basePath%>/resources/layui/css/layui.css"/>
    <script src="<%=basePath%>/resources/layui/layui.js"></script>
</head>
<body>

<div class="container">
    <h2 class="text-center" style="color: #1D9D73;font-family:Microsoft YaHei;margin-top: 66px;">商品类别添加</h2>
    <hr/>
    <br/>
    <form class="form-inline text-center"  name="form1"     action="<%=basePath%>/admin_save.do" method="post"  onSubmit="return myCheck()">
        <div hidden="hidden">
            <!-- 这个id值默认中数据库中查询 -->
            <input type="text" name="c_id" class="form-control" value="${newId}"/>
        </div>
        <div class="form-group form-inline">
            <label>文学类书籍：</label>
            <input type="text" name="c_name" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>哲学类书籍：</label>
            <input type="text" name="c_telephone" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>计算机语言：</label>
            <input type="text" name="c_address" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>小说类书籍：</label>
            <input type="text" name="c_remark" class="form-control"/>
        </div>
        <br/>
        <br/>
        <div class="form-group form-inline">
            <label>其他类书籍：</label>
            <input type="text" name="c_remark" class="form-control"/>
        </div>
        <br/>
        <br/>
        <br/>
        <input type="submit" class="btn btn-success text-center" value="添加"/>&nbsp;&nbsp;&nbsp;
        <input type="reset" class="btn btn-danger text-center" value="重置"/>
    </form>
</div>



<%--检测输入表单输入值是否为空--%>
<script type="text/javascript">
    function myCheck()
    {
        for(var i=0;i<document.form1.elements.length-1;i++)
        {
            if(document.form1.elements[i].value=="")
            {

                layui.use('layer', function(){
                    var layer = layui.layer;

                    layer.msg('当前输入不能有空项');
                });
                /*  alert("当前输入框不能有空项");*/
                document.form1.elements[i].focus();
                return false;
            }
        }
        return true;

    }
</script>

</body>
</html>
