
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<link rel="stylesheet" href="<%=basePath%>/resources/bootstrap.min.css">

<html>
<head>
    <title>添加分类</title>
</head>
<body style="padding-left: 4%">
<div style="float: left;font-weight: 300">
    <div>
        <div>
            <div>
                <input type="hidden" name="tags">
                <div>
                    <label style="font-weight: 300">文章标签：</label>
                    <button style="color: #2C7EEA;border: none;background-color: white"><img
                            src="<%=basePath%>/images/label.png" style="width: 30px;height: 30px">添加标签
                    </button>
                </div>
                <p style="padding-left: 15%">最多添加5个标签</p>
            </div>
        </div>
    </div>
    <div style="font-weight: 300">
        <div>
            <input type="hidden" name="categories">

            <div>
                <div>
                    <label style="font-weight: 300">个人分类：</label>
                    <button style="color: #2C7EEA;border: none;background-color: white"><img
                            src="<%=basePath%>/images/label.png" style="width: 30px;height: 30px">添加新分类
                    </button>
                </div>
            </div>
        </div>
    </div>
    <h3></h3>
    <div style="font-weight: 300">
        <label style="font-weight: 300">文章类型：</label>
        <select style="border-radius: 6px">
            <option value="0" selected="selected">请选择</option>
            <option value="original">原创</option>
            <option value="repost">转载</option>
            <option value="translated">翻译</option>
        </select>
        <span style="color: #9d1e15">*必填项</span>&nbsp;
        <label style="font-weight: 300">博客分类：</label>
        <select style="border-radius: 6px">
            <option value="0" selected="selected">选择分类</option>
            <option value="28">
                人工智能
            </option>
            <option value="1">
                移动开发
            </option>
            <option value="29">
                物联网
            </option>
            <option value="15">
                架构
            </option>
            <option value="2">
                云计算/大数据
            </option>
            <option value="17">
                互联网
            </option>
            <option value="30">
                游戏开发
            </option>
            <option value="12">
                运维
            </option>
            <option value="6">
                数据库
            </option>
            <option value="14">
                前端
            </option>
            <option value="31">
                后端
            </option>
            <option value="16">
                编程语言
            </option>
            <option value="3">
                研发管理
            </option>
            <option value="32">
                安全
            </option>
            <option value="33">
                程序人生
            </option>
            <option value="34">
                区块链
            </option>
            <option value="35">
                音视频开发
            </option>
            <option value="36">
                资讯
            </option>
            <option value="37">
                计算机理论与基础
            </option>
        </select>
        <span style="color: #9d1e15">*必填项</span>
    </div>
    <h3></h3>
    <div style="font-weight: 300">
        <label style="font-weight: 300">私密文章：</label>
        <select style="border-radius: 6px">
            <option>公开</option>
            <option>私密</option>
        </select>
    </div>

</div>
<div style="padding-left: 60%;padding-top: 50%">
    <button style="color: #2C7EEA;border: none;background-color: white">取消</button>&nbsp;&nbsp;
    <button style="color: #2C7EEA;border: none;background-color: white">保存为草稿</button>&nbsp;&nbsp;
    <button style="color: #2C7EEA;border: none;background-color: white">发布文章</button>
</div>
</div>
</body>
</html>
