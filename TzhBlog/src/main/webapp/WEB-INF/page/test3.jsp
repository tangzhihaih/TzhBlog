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
<div>
    <div style="width: 20%;float: left">
        <div style="width: 10%;float: left;background-color:black ">
        </div>
        <div style="float: right">
            <img src="<%=basePath%>/images/headC.jpg" style="height: 60px;width: 100%;">
        </div>

    </div>
    <div style="width: 80%;float: right">
        <ul class="layui-nav" style="padding-left: 20%" >
            <li class="layui-nav-item" >
                <a href="<%=basePath%>/Blog/HomePage">HomePage</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Blog/Community">BlogCommunity</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/User/writeBlog">WriteBlog</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Blog/writeNote">WriteNote</a>
            </li>
            <li class="layui-nav-item">
                <a href="<%=basePath%>/Markdown/index.jsp">markdown使用教程</a>
            </li>
            <li class="layui-nav-item" lay-unselect="">
                <a href="javascript:;"><img src="<%=basePath%>/photo/${img_name}" class="layui-nav-img">
                    <span class="layui-nav-more"></span></a>
                <dl class="layui-nav-child">
                    <dd ><a href="<%=basePath%>/Blog/storage?page=1">我的收藏</a></dd>
                    <dd ><a href="<%=basePath%>/Blog/attention?page=1">我的关注</a></dd>
                    <dd ><a href="<%=basePath%>/User/leftModel">个人中心</a></dd>
                    <dd ><a href="<%=basePath%>/Blog/default?page=1">我的博客</a></dd>
                    <dd ><a href="<%=basePath%>/Blog/MyAllNote?page=1">我的帖子</a></dd>
                    <dd ><a href="<%=basePath%>/User/account">账号设置</a></dd>
                    <dd ><a href="<%=basePath%>/Admin/exit">退出</a></dd>
                </dl>

            </li>
        </ul>
    </div>

</div>
<form action="<%=basePath%>/User/publishArticle">
    <div id="layout">
        <div style="padding:0.5% 5% 1% 5%;">
            <div style="float: left;width: 27%">
                <label>文章标题：</label>
                <input maxlength="100" name="article_name" class="layui-input">
            </div>
            <div style="float: right;width: 68%">
                <div style="font-weight: 300">
                    <div style="float: left">
                        <div style="padding-bottom: 5%;padding-top: 7%">
                            <div>
                                <div>
                                    <input type="hidden" name="tags">
                                    <div>
                                        <label style="font-weight: 300">文章标签：</label>
                                        <input type="radio" name="java" value="java">java
                                        <input type="radio" name="mysql" value="mysql">mysql
                                        <input type="radio" name="linux" value="linux">linux
                                        <input type="radio" name="c" value="c++">c++
                                        <input type="radio" name="php" value="php">php
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div style="float:right">
                        <div style="font-weight: 300">
                            <label style="font-weight: 300">文章类型：</label>
                            <select style="border-radius: 6px" name="article_type">
                                <option value="0" selected="selected">请选择</option>
                                <option value="原创">原创</option>
                                <option value="转载">转载</option>
                                <option value="翻译">翻译</option>
                            </select>
                            <span style="color: #9d1e15">*必填项</span>&nbsp;
                            <label style="font-weight: 300">博客分类：</label>
                            <select style="border-radius: 6px" name="blog_sort">
                                <option value="选择分类" selected="selected">选择分类</option>
                                <option value="人工智能">
                                    人工智能
                                </option>
                                <option value="移动开发">
                                    移动开发
                                </option>
                                <option value="物联网">
                                    物联网
                                </option>
                                <option value="架构">
                                    架构
                                </option>
                                <option value="云计算/大数据">
                                    云计算/大数据
                                </option>
                                <option value="互联网">
                                    互联网
                                </option>
                                <option value="游戏开发">
                                    游戏开发
                                </option>
                                <option value="运维">
                                    运维
                                </option>
                                <option value="数据库">
                                    数据库
                                </option>
                                <option value="前端">
                                    前端
                                </option>
                                <option value="后端">
                                    后端
                                </option>
                                <option value="编程语言">
                                    编程语言
                                </option>
                                <option value="研发管理">
                                    研发管理
                                </option>
                                <option value="安全">
                                    安全
                                </option>
                                <option value="程序人生">
                                    程序人生
                                </option>
                                <option value="区块链">
                                    区块链
                                </option>
                                <option value="音视频开发">
                                    音视频开发
                                </option>
                                <option value="资讯">
                                    资讯
                                </option>
                                <option value="计算机理论与基础">
                                    计算机理论与基础
                                </option>
                            </select>
                            <span style="color: #9d1e15">*必填项</span>
                        </div>
                        <h3></h3>
                        <div style="font-weight: 300">
                            <label style="font-weight: 300">私密文章：</label>
                            <select style="border-radius: 6px" name="is_private">
                                <option value="公开">公开</option>
                                <option value="私密">私密</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div style="padding-left: 73%;padding-bottom: 1%">
                    <button style="color: #2C7EEA;border: none;background-color: white">保存为草稿</button>&nbsp;&nbsp;
                    <button  class="btn btn-danger " type="submit">发布文章</button>
                </div>
            </div>
        </div>

    </div>
        <div id="content-editormd" class="form-group" style="background-color: black">
                    <textarea style="display:none;"  class="form-control" id="content-editormd-markdown-doc" name="content-editormd-markdown-doc">
                        [TOC]
                        #### Disabled options

                        - TeX (Based on KaTeX);
                        - Emoji;
                        - Task lists;
                        - HTML tags decode;
                        - Flowchart and Sequence Diagram;

                        #### Editor.md directory

                            editor.md/
                                    lib/
                                    css/
                                    scss/
                                    tests/
                                    fonts/
                                    images/
                                    plugins/
                                    examples/
                                    languages/
                                    editormd.js
                                    ...

                        ```html
                        &lt;!-- English --&gt;
                        &lt;script src="../dist/js/languages/en.js"&gt;&lt;/script&gt;

                        &lt;!-- 繁體中文 --&gt;
                        &lt;script src="../dist/js/languages/zh-tw.js"&gt;&lt;/script&gt;
                        ```
                    </textarea>
        </div>
    </div>
</form>
<script src="<%=basePath%>/layui/dist/layui.js" charset="utf-8"></script>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/layui/layui.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<script>
    layui.use('element', function(){
        var element = layui.element; //导航的hover效果、二级菜单等功能，需要依赖element模块
        //监听导航点击
        element.on('nav(demo)', function(elem){
            //console.log(elem)
            layer.msg(elem.text());
        });
    });
</script>
<script>
    $('input:radio').click(function(){
        //alert(this.checked);
        //
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

<script type="text/javascript">
    var testEditor;
    $(function() {
        testEditor = editormd("content-editormd", {
            width   : "90%",
            height  : 640,
            syncScrolling : "single",
            path    : "<%=request.getContextPath()%>/lib/",
            imageUpload : true,
            emoji: true,
            taskList: true,
            tocm: true,         // Using [TOCM]
            tex: true,                   // 开启科学公式TeX语言支持，默认关闭
            flowChart: true,             // 开启流程图支持，默认关闭
            sequenceDiagram: true,       // 开启时序/序列图支持，默认关闭
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
</body>
</html>
