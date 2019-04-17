<!DOCTYPE html>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
<body>
<jsp:include page="#{basePath}/header.jsp"/>
<div style="background-color: #FFFAFA;width: 100%">
    <div style="padding-left: 16%;padding-right: 16%;">
        <div style="width: 100%;height: 800px;background-color: white">
            <form  action="<%=basePath%>/Blog/Note"  method="post">
                <div class="layui-form-item">
                    <div class="layui-input-block" style="width: 70%;padding-right: 10%;float: left;font-size: larger">
                        <label >请输入文章标题：</label>
                        <input type="text" name="title"  autocomplete="off"  id="title">
                        <div style="width: 20%;height: 30px;float: right">
                            <div style="float: left">
                                <div class="layui-inline">
                                    <div class="layui-input-inline">
                                        <select name="modules" lay-verify="required" lay-search="" style="height: 30px;padding-left: 10%">
                                            <option value="0">0</option>
                                            <option value="20">20</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                            <option value="150">150</option>
                                            <option value="200">200</option>
                                            <option value="250">250</option>
                                            <option value="300">300</option>
                                            <option value="350">350</option>
                                            <option value="400">400</option>
                                            <option value="450">450</option>
                                        </select>
                                        <div style="float: right">
                                            可用分：${can_use_scores}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content-editormd" class="form-group" style="padding-left: 0%;padding-right: 0%">
                    <textarea style="display:none;"  class="form-control" id="content-editormd-markdown-doc" name="content-editormd-markdown-doc">
                        [TOC]
                        #### Disabled options
                            editor.md/
                                    lib/
                                    css/
                                    scss/
                                    tests/
                                    fonts/
                                    images/
                                    plugins/
                                    ...
                        ```
                    </textarea>
                </div>
                <div style="font-size: 20px;padding-top: 10px">
                    <label style="padding-left: 20%">主题板块：</label>
                    <select id="province" onChange="set_city(this, this.form.city);" style="width: 20%;height: 30px" name="province">
                    <option value="0">选择大板块</option>
                    <option value="java">java</option>
                    <option value="C/C++">C/C++</option>
                    <option value="Mobile">移动开发</option>
                    <option value="WebDevelop">Web 开发</option>
                    <option value="PHP">PHP</option>
                    <option value="Linux">Linux/Unix社区</option>
                    </select>
                    <select id="city" id="citys" style="width: 20%;height: 30px" name="city">
                        <option value="0">选择小板块</option>
                    </select>
                    <button type="submit" class="btn btn-danger">发表帖子</button>
                </div>
            </form>
        </div>
    </div>
</div>
<div style="padding-top: 5px;">
    <img src="<%=basePath%>/images/footer.png" style="height: 190px;width: 100%;">
</div>
</body>
<script>
    cities = new Object();
    cities['java']=new Array('JavaEE', 'JavaSE', 'Java相关', 'Eclipse', 'J2ME', '非技术区', 'web开发');
    cities['C/C++']=new Array('工具平台和程序库', 'C++语言', '新手乐园', '模式及实现', '其他技术问题', '非技术区', 'C语言');
    cities['Mobile']=new Array('Windows客户端开发', 'IOS', '移动开发其他问题', '英特尔技术', 'Android', '移动广告', 'Swift', '微信开发');
    cities['WebDevelop']=new Array('HTML(CSS)', 'ASP', 'IIS', 'Ajax', '非技术区', 'Html5', 'Apache', '应用服务区');
    cities['PHP']=new Array('开源资源', '基础编程', 'Framework');
    cities['Linux']=new Array('专题技术讨论区', '内核源代码研究区', 'IBM AIX', '系统维护与使用区', '应用程序开发区', '驱动程序开发区');

    function set_city(province, city)
    {
        var pv, cv;
        var i, ii;

        pv=province.value;
        cv=city.value;

        city.length=1;

        if(pv=='0') return;
        if(typeof(cities[pv])=='undefined') return;

        for(i=0; i<cities[pv].length; i++)
        {
            ii = i+1;
            city.options[ii] = new Option();
            city.options[ii].text = cities[pv][i];
            city.options[ii].value = cities[pv][i];
        }

    }
</script>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<script type="text/javascript">
    var testEditor;
    $(function() {
        testEditor = editormd("content-editormd", {
            width   : "90%",
            height  : 580,
            syncScrolling : "single",
            path    : "<%=request.getContextPath()%>/lib/",
            imageUpload : true,
            // 图片上传
            imageFormats : ["jpg", "jpeg", "gif", "png", "bmp", "webp"],
            imageUploadURL : "/uploadfile",
            saveHTMLToTextarea : true,
            previewTheme : "dark"
        });
    });
    //editor.md期望得到一个json格式的上传后的返回值，格式是这样的：
    /*
     {
     success : 0 | 1,           // 0 表示上传失败，1 表示上传成功
     message : "提示的信息，上传成功或上传失败及错误信息等。",
     url     : "图片地址"        // 上传成功时才返回
     }
     */
</script>
<script>
    layui.use(['layer', 'laypage', 'element'], function() {
    });
</script>
</html>

