
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <title>修改信息</title>
    <link href="<%=basePath%>/layui/css/layui.css" media="all">
    <link href="<%=basePath%>/layui/dist/css/layui.css">
</head>
<body>
<script src="<%=basePath%>/layui/layui.all.js"></script>
<script src="<%=basePath%>/js/dist/jquery.min.js"></script>
<script src="<%=basePath%>/js/dist/jquery.js"></script>
<script src="<%=basePath%>/layer/layer.js"></script>
    <div style="padding-left: 0%;padding-top:0px;">
        <p><span>昵称：</span>
            <input type="text" autocomplete="off" minlength="2" maxlength="20" value="${name}" id="name" readonly="readonly">
        </p>
        <p><span>实名：</span>
            <input type="text" autocomplete="off" minlength="2" maxlength="10" value="${truename}" id="truename">
        </p>
        <p><span>职位：</span>
            <input type="text" autocomplete="off" maxlength="20" value="${job}" id="job">
        </p>
        <div>
            <div>
                <div>
                    <span>性别：</span>
                    <input type="radio" checked="checked" name="2" value="sex1">男
                    <input type="radio" name="2" value="sex2">女
                    <span>
                    <span><i></i>
                    </span>
                </span>

                </div>
                <div style="display: none; min-width: 96px;">
                    <div>
                        <ul>
                                <option><span>男</span></option>
                                <option><span>女</span></option>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <p>
        <div>
            <span>生日：</span>
            <input type="text" class="layui-input" id="test1" placeholder="yyyy-MM-dd" value="${birthday}">

        </div>
        <h3></h3>
        <div>
            <div>
                <span>行业：</span>
                <select  style="width: 160px;" id="work">
                    <option><span>请选择</span></option>
                    <option><span>电子·微电子</span></option>
                    <option><span>通信(设备·运营·增值服务)</span></option>
                    <option><span>批发·零售</span></option>
                    <option><span>贸易·进出口</span></option>
                    <option><span>广告·会展·公关</span></option>
                    <option><span>专业服务(咨询·财会·法律等)</span></option>
                    <option><span>房地产开发·建筑与工程</span></option>
                    <option><span>娱乐·运动·休闲</span></option>
                    <option><span>快速消费品(食品·饮料·日化·烟酒等)</span></option>
                    <option><span>家电业</span></option>
                    <option><span>家居·室内设计·装潢</span></option>
                    <option><span>旅游·酒店·餐饮服务</span></option>
                    <option><span>交通·运输·物流</span></option>
                    <option><span>办公设备·用品</span></option>
                    <option><span>医疗设备·器械</span></option>
                    <option><span>汽车·摩托车(制造·维护·配件·销售·服务)</span></option>
                    <option><span>制药·生物工程</span></option>
                    <option><span>环保</span></option>
                    <option><span>印刷·包装·造纸</span></option>
                    <option><span>中介服务(人才·商标专利)</span></option>
                    <option><span>教育·培训·科研·院校</span></option>
                    <option><span>医疗·保健·美容·卫生服务</span></option>
                    <option><span>互联网·电子商务</span></option>
                    <option><span>仪器·仪表·工业自动化·电气</span></option>
                    <option><span>计算机软件</span></option>
                    <option><span>计算机硬件·网络设备</span></option>
                    <option><span>IT服务·系统集成</span></option>
                    <option><span>银行</span></option>
                    <option><span>保险</span></option>
                    <option><span>基金·证券·期货·投资</span></option>
                    <option><span>耐用消费品(服饰·纺织·家具）</span></option>
                    <option><span>机械制造·机电·重工</span></option>
                    <option><span>原材料及加工（金属·木材·橡胶·塑料·玻璃·陶瓷·建材）</span></option>
                    <option><span>政府·非营利机构</span></option>
                    <option><span>房地产服务(中介·物业管理·监理、设计院)</span></option>
                    <option><span>媒体·出版·文化传播</span></option>
                    <option><span>化工</span></option>
                    <option><span>采掘·冶炼</span></option>
                    <option><span>其他</span></option>
                    <option><span>能源（电力·石油）·水利</span></option>
                    <option><span>软件外包</span></option>
                    <option><span>网络游戏</span></option>
                    <option><span>嵌入式</span></option>
                    <option><span>国防/军队</span></option>
                </select>
            </div>
        </div>
        </p>
        <div>
            <div>
                <div>
                    <span>地区：</span>
                    <select style="width: 160px;" id="place">
                        <option><span>请选择</span></option>
                        <option><span>中国</span></option>
                        <option><span>美国</span></option>
                        <option><span>英国</span></option>
                        <option><span>法国</span></option>
                        <option><span>俄罗斯</span></option>
                        <option><span>加拿大</span></option>
                        <option><span>巴西</span></option>
                        <option><span>澳大利亚</span></option>
                        <option><span>印尼</span></option>
                        <option><span>泰国</span></option>
                        <option><span>马来西亚</span></option>
                        <option><span>新加坡</span></option>
                        <option><span>菲律宾</span></option>
                        <option><span>越南</span></option>
                        <option><span>印度</span></option>
                        <option><span>日本</span></option>
                    </select>
                </div>
            </div>
        </div>
        <div style="width: 400px;height: 100px;" >
            <div style="font-weight: 400;width: 50px;float: left">
                <h4 >简介：</h4>
            </div>
            <div style="width: 350px;height: 100px;float: left;margin-top: 20px;">
                <textarea maxlength="300" placeholder="300字以内" style="width: 300px;height: 100px;" id="remark">
                </textarea>
            </div>
        </div>
        <div style="margin-top:20px;margin-left: 30%;float: left">
            <button type="button" id="close_window">取消</button>
            <button type="button" id="message">确定</button>
        </div>
    </div>
</body>
<script src="<%=basePath%>/layui/dist/layui.js"></script>

<script>
    layui.use('laydate', function() {
        var laydate = layui.laydate;
        laydate.render({
            elem: '#test1'
        });
    });
    $("#close_window").click(function () {
        var index=parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);
    });
    $("#message").click(function () {
        var name=$("#name").val();
        var truename=$("#truename").val();
        var job=$("#job").val();
        var sex=$("#sex").val();
        var birthday=$("#test1").val();
        var place=$("#place option:selected").val();
        var work=$("#work option:selected").val();
        var remark=$("#remark").val();
        $.ajax({
            type:"POST",
            url:"<%=basePath%>/User/updateMessage",
            dateType:"JSON",
            data:{
                "name":name,
                "truename":truename,
                "job":job,
                "work":work,
                "sex":truename,
                "birthday":birthday,
                "place":place,
                "remark":remark
            },
            success:function (ms) {
                if(ms['success']){
                    layer.msg('修改成功！！！',{
                        time:2000
                    });
                    var index=parent.layer.getFrameIndex(window.name);
                    parent.layer.close(index);
                }
            },
        });
    });
</script>
</html>
