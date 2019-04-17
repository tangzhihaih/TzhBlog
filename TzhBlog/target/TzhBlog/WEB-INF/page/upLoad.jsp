<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>Title</title>
</head>
<link href="<%=basePath%>/layui/css/layui.css" media="all">
<link href="<%=basePath%>/layui/dist/css/layui.css">
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/js/dist/jquery.min.js"></script>
<script src="<%=basePath%>/js/dist/jquery.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
<body>
<div>
    <p style="padding-left: 3%;padding-top: 2%">上传头像</p>
    <div class="vicp-drop-area">
        <input type="file" id="file_upload"  onchange="preview(this)" style="padding-left: 20%">
    </div>
    <div class="image_container" style="padding-left: 20%;padding-top: 2%;padding-bottom: 3%">
        <img id="preview" style="height:130px;width:117px;border-width:0px;"/>
    </div>
    <p style="padding-left: 20%;font-weight: lighter">图片宽度*至少为150*150像素，大小不超过2MB</p>
    <div style="padding-left: 30%;padding-right: 4%;padding-top: auto">
        <button style="background-color: #DDDDDD;border-radius: 5px;width: 25%;height: 12%;outline: none" id="can">
            取消
        </button>
        <button style="background-color: #f22e07;border-radius: 5px;width: 25%;height: 12%;outline: none" id="upLoadImage">
            确认上传
        </button>
    </div>
</div>
</body>
<script src="<%=basePath%>/layui/dist/layui.js"></script>
<script>
    $("#can").click(function () {
        var index=parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
</script>
<script>
    $("#upLoadImage").click(function () {
        var file_path=$("#file_upload").val();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>/User/upLoadImage",
            dataType:"json",
            data:{
                "file_path":file_path
            },
            success:function (data) {
                if(data['success']){
                    layer.msg("上传图片成功",{
                        time:6000,
                    });
                    var par=parent.layer.getFrameIndex(window.name);
                    parent.layer.close(par);
                    parent.location.reload();
                }

            }
        })
    });
</script>
<script>
    $(function () {
        $("#file_upload").change(function () {
            var $file = $(this);
            var fileObj = $file[0];
            var windowURL = window.URL || window.webkitURL;
            var dataURL;
            var $img = $("#preview");
            if (fileObj && fileObj.files && fileObj.files[0]) {
                dataURL = windowURL.createObjectURL(fileObj.files[0]);
                $img.attr('src', dataURL);
            } else {
                dataURL = $file.val();
                var imgObj = document.getElementById("preview");
                // 两个坑:
                // 1、在设置filter属性时，元素必须已经存在在DOM树中，动态创建的Node，也需要在设置属性前加入到DOM中，先设置属性在加入，无效；
                // 2、src属性需要像下面的方式添加，上面的两种方式添加，无效；
                imgObj.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(sizingMethod=scale)";
                imgObj.filters.item("DXImageTransform.Microsoft.AlphaImageLoader").src = dataURL;
            }
        });
    });
</script>
</html>
