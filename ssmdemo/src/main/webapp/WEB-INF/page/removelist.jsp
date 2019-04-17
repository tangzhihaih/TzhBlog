<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/7/6/006
  Time: 12:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css"/>
<link rel="stylesheet" href="<%=basePath%>/resources/font-awesome.min.css"/>
<head>
    <title>商品列表页面</title>
</head>
<body>

<div class="container">
    <h2 class="text-center" style="color: #1D9D73;font-family:Microsoft YaHei;margin-top: 66px;">商品信息列表</h2>
    <hr/>
    <br/>
    <form class="form-inline" action="<%=basePath%>/.do" method="post">
        <div class="form-group">
            <label>商品编号</label>
            <input type="text" class="form-control" name="id"/>
        </div>
        &nbsp;&nbsp;
        &nbsp;&nbsp;
        <div class="form-group">
            <label>商品名称</label>
            <input type="text" class="form-control" name="name"/>
        </div>
        &nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;&nbsp;&nbsp;&nbsp;
        <div class="form-group">
            <input type="submit" value="查询" class="form-control btn btn-info"/>
            &nbsp;&nbsp;
            <input type="reset" value="重置" class="form-control btn btn-danger"/>
        </div>
    </form>
    <br/>
    <hr/>
    <div class="table-responsive">
        <table class="table table-hover table-striped">
            <thead>
            <tr>
                <th style="text-align: center;">商品编号</th>
                <th style="text-align: center;">商品名称</th>
                <th style="text-align: center;">商品价格</th>
                <th style="text-align: center;">商品描述</th>
                <th style="text-align: center;">商品库存</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${requestScope.removePage.beanList}" var="product">
                <tr class="text-center">
                    <td>${product.id}</td>
                    <td>${product.name}</td>
                    <td>${product.originaPrice}</td>
                    <td>${product.subTitle}</td>
                    <td>${product.stock}</td>
                    <td>
                        <a href="#" onclick="return edit(${product.id})" style="text-decoration: none;">
                            <span class="fa fa-edit fa-fw"></span>
                        </a>
                        <a href="#" onclick="return trash(${product.id})" style="text-decoration: none;" data-toggle="modal" data-target="#trashModal">
                            <span class="fa fa-trash-o fa-fw"></span>
                        </a>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <form class="listForm" method="post" action="<%=basePath%>/admin_findByPage.do">
        <div class="row">
            <div class="form-inline">
                <label style="font-size:14px;margin-top:22px;">
                    <strong>共<b>${requestScope.removePage.totalCount}</b>条记录，共<b>${requestScope.removePage.totalPage}</b>页</strong>
                    &nbsp;
                    &nbsp;
                    <strong>每页显示</strong>
                    <select class="form-control" name="pageSize">
                        <option value="2"
                                <c:if test="${requestScope.removePage.pageSize == 2}">selected</c:if> >2
                        </option>
                        <option value="3"
                                <c:if test="${requestScope.removePage.pageSize == 3}">selected</c:if> >3
                        </option>
                        <option value="4"
                                <c:if test="${requestScope.removePage.pageSize == 4}">selected</c:if> >4
                        </option>
                        <option value="5"
                                <c:if test="${requestScope.removePage.pageSize == 5}">selected</c:if> >5
                        </option>
                    </select>
                    <strong>条</strong>
                    &nbsp;
                    &nbsp;
                    <strong>到第</strong>&nbsp;<input type="text" size="3" id="page" name="pageCode"
                                                    class="form-control input-sm"
                                                    style="width:11%"/>&nbsp;<strong>页</strong>
                    &nbsp;
                    <button type="submit" class="btn btn-sm btn-info">GO!</button>
                </label>
                <ul class="pagination" style="float:right;">
                    <li>
                        <a href="<%=basePath%>/admin_findPage.do?pageCode=1"><strong>首页</strong></a>
                    </li>
                    <li>
                        <c:if test="${requestScope.removePage.pageCode > 2}">
                            <a href="<%=basePath%>/admin_findPage.do?pageCode=${requestScope.removePage.pageCode - 1}">&laquo;</a>
                        </c:if>
                    </li>

                    <!-- 写关于分页页码的逻辑 -->
                    <c:choose>
                        <c:when test="${requestScope.removePage.totalPage <= 5}">
                            <c:set var="begin" value="1"/>
                            <c:set var="end" value="${requestScope.removePage.totalPage}"/>
                        </c:when>
                        <c:otherwise>
                            <c:set var="begin" value="${requestScope.removePage.pageCode - 1}"/>
                            <c:set var="end" value="${requestScope.removePage.pageCode + 3}"/>

                            <!-- 头溢出 -->
                            <c:if test="${begin < 1}">
                                <c:set var="begin" value="1"/>
                                <c:set var="end" value="5"/>
                            </c:if>

                            <!-- 尾溢出 -->
                            <c:if test="${end > requestScope.removePage.totalPage}">
                                <c:set var="begin" value="${requestScope.removePage.totalPage -4}"/>
                                <c:set var="end" value="${requestScope.removePage.totalPage}"/>
                            </c:if>
                        </c:otherwise>
                    </c:choose>

                    <!-- 显示页码 -->
                    <c:forEach var="i" begin="${begin}" end="${end}">
                        <!-- 判断是否是当前页 -->
                        <c:if test="${i == requestScope.removePage.pageCode}">
                            <li class="active"><a href="javascript:void(0);">${i}</a></li>
                        </c:if>
                        <c:if test="${i != requestScope.removePage.pageCode}">
                            <li>
                                <a href="<%=basePath%>/admin_findByPage.do?pageCode=${i}">${i}</a>
                            </li>
                        </c:if>
                    </c:forEach>

                    <li>
                        <c:if test="${requestScope.removePage.pageCode < requestScope.removePage.totalPage}">
                            <a href="<%=basePath%>/customer/findPage.do?pageCode=${requestScope.removePage.pageCode + 1}">&raquo;</a>
                        </c:if>
                    </li>
                    <li>
                        <a href="<%=basePath%>/customer_findPage.do?pageCode=${requestScope.removePage.totalPage}"><strong>末页</strong></a>
                    </li>
                </ul>
            </div>
        </div>
    </form>

    <!-- 删除的模态框 -->
    <div class="modal fade" id="trashModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <!-- 模糊框头部 -->
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                    </button>
                    <h4 class="modal-title">提示！</h4>
                </div>
                <!-- 模糊框主体 -->
                <div class="modal-body">
                    <strong>您确定要下架该商品吗？</strong>
                </div>
                <!-- 模糊框底部 -->
                <div class="modal-footer">
                    <button type="button" class="delSure btn btn-info" data-dismiss="modal">确定</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                </div>
            </div>
        </div>
    </div>

    <!-- 编辑的模态框 -->
    <%--<form class="form-horizontal" role="form" method="post" action="<%=basePath%>/customer_update.do"
          id="form_edit">
        <div class="modal fade" id="editModal" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">修改客户信息</h4>
                    </div>
                    <div class="modal-body" style="margin-left: 80px;">
                        <div hidden="hidden">
                            <input type="text" name="c_id" class="form-control" id="c_id"/>
                        </div>
                        <div class="form-group form-inline">
                            <label>客户姓名：</label>
                            <input type="text" name="c_name" class="form-control" id="c_name"/>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group form-inline">
                            <label>客户电话：</label>
                            <input type="text" name="c_telephone" class="form-control" id="c_telephone"/>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group form-inline">
                            <label>客户住址：</label>
                            <input type="text" name="c_address" class="form-control" id="c_address"/>
                        </div>
                        <br/>
                        <br/>
                        <div class="form-group form-inline">
                            <label>客户备注：</label>
                            <input type="text" name="c_remark" class="form-control" id="c_remark"/>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="editSure btn btn-info" data-dismiss="modal">修改</button>
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
                    </div>
                </div>
            </div>
        </div>
    </form>--%>
</div>
</body>
<script src="<%=basePath%>/resources/jquery-3.3.1.min.js"></script>
<script src="<%=basePath%>/resources/bootstrap.min.js"></script>
<script type="text/javascript">
    // 下架该信息的方法
    function trash(cid){
        if(!cid){
            alert("error");
        }else{
            $(".delSure").click(function(){
                $.ajax({
                    url: '<%=basePath%>/customer_update.do?c_id='+cid,
                    type: 'POST',
                    success: function(data){
                        $("body").html(data);
                    }
                });
            });
        }
    }


    // 编辑信息的方法
    function edit(c_id){
        if(!c_id){
            alert("error");
        }else{
            // 先去查询数据
            $.ajax({
                url: '<%=basePath%>/customer_search.do?c_id='+c_id,
                type: 'POST',
                dataType: 'json',
                contentType: 'application/json;charset=UTF-8',
                data: {},
                success: function(data){
                    var d = eval("("+data+")");
                    $("#c_id").val(d.c_id);
                    $("#c_name").val(d.c_name);
                    $("#c_telephone").val(d.c_telephone);
                    $("#c_address").val(d.c_address);
                    $("#c_remark").val(d.c_remark);
                    $("#editModal").modal('show');
                },
                error: function(){
                    alert("错误");
                }
            });
        }
    }

    //提交表单的方法
    $(".editSure").click(function(){
        $("#form_edit").submit();
    });

</script>
</html>
