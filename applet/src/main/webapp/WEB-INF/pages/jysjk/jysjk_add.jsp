<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<body>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2><span style="color: #1c7393">${USER.realName}</span>您好，您正在添加经验数据库。 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw900 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form action="<%=basePath%>/ed/add" method="post" onsubmit="return isValid(this)">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb20">
                                <span> 添加经验数据库 </span>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="title" class="field-label text fs15 mb10">标题：</label>
                                    <input class="form-control" id="title" name="title"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-6">
                                    <label for="productModel" class="field-label text fs15 mb10">产品型号：</label>
                                    <input class="form-control" id="productModel" name="productModel"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="productClass" class="field-label text fs15 mb10">产品类别：</label>
                                    <input list="productClass" class="form-control" name="productClass"/>
                                    <datalist id="productClass">
                                        <option value="ECU">ECU</option>
                                        <option value="EPS">EPS</option>
                                        <option value="HPS">HPS</option>
                                        <option value="RCB">RCB</option>
                                        <option value="COL">COL</option>
                                        <option value="MSG">MSG</option>
                                        <option value="其他">其他</option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-6">
                                    <label for="primePiece" class="field-label text fs15 mb10">主凶件：</label>
                                    <input class="form-control" id="primePiece" name="primePiece"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="primeCategory" class="field-label text fs15 mb10">主凶类别：</label>
                                    <input list="primeCategory" name="primeCategory" class="form-control"/>
                                    <datalist id="primeCategory">
                                        <option value="设计">设计</option>
                                        <option value="过程">过程</option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-6">
                                    <label for="problemInput" class="field-label text fs15 mb10">问题输入：</label>
                                    <input list="problemInput" name="problemInput" class="form-control"/>
                                    <datalist id="problemInput">
                                        <option value="客户提出">客户提出</option>
                                        <option value="供应商提出">供应商提出</option>
                                        <option value="专业公司提出">专业公司提出</option>
                                        <option value="设计优化">设计优化</option>
                                        <option value="标准化统一">标准化统一</option>
                                        <option value="同步变更">同步变更</option>
                                        <option value="设计失误">设计失误</option>
                                    </datalist>
                                </div>
                                <div class="col-md-6">
                                    <label for="failureMode" class="field-label text fs15 mb10">失效模式：</label>
                                    <input list="failureMode" name="failureMode" class="form-control"/>
                                    <datalist id="failureMode">
                                        <option value="异响">异响</option>
                                        <option value="无助力">无助力</option>
                                        <option value="扭矩过大、过小">扭矩过大、过小</option>
                                        <option value="干涉">干涉</option>
                                        <option value="尺寸超差">尺寸超差</option>
                                        <option value="试验断裂">试验断裂</option>
                                        <option value="性能不合格">性能不合格</option>
                                        <option value="沉重">沉重</option>
                                        <option value="发卡">发卡</option>
                                        <option value="漏油">漏油</option>
                                    </datalist>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-6">
                                    <label for="positionPhase" class="field-label text fs15 mb10">故障阶段：</label>
                                    <input id="positionPhase" name="positionPhase" class="form-control"/>&nbsp;&nbsp;
                                </div>
                                <div class="col-md-6">
                                    <label for="positionFault" class="field-label text fs15 mb10">故障地点：</label>
                                    <input id="positionFault" name="positionFault" class="form-control"/>&nbsp;
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-6">
                                    <label for="amount" class="field-label text fs15 mb10">故障数量：</label>
                                    <input id="amount" name="amount" class="form-control"/>
                                </div>
                                <div class="col-md-6">
                                    <label for="dateString" class="field-label text fs15 mb10">发生日期：</label>
                                    <input id="dateString" name="dateString" class="form-control"/>&nbsp;
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="problemDescription" class="field-label text fs15 mb10">问题描述：</label>
                                    <div id="ed1"></div>
                                    <textarea id="problemDescription" style="display: none;"
                                              name="problemDescription"></textarea>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="reasonAnalysis" class="field-label text fs15 mb10">原因分析：</label>
                                    <div id="ed2"></div>
                                    <textarea id="reasonAnalysis" style="display: none;"
                                              name="reasonAnalysis"></textarea>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="temporaryImprovementMeasures"
                                           class="field-label text fs15 mb10">临时改进措施：</label>
                                    <div id="ed3"></div>
                                    <textarea id="temporaryImprovementMeasures" style="display: none;"
                                              name="temporaryImprovementMeasures"></textarea>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="formalImprovementMeasures"
                                           class="field-label text fs15 mb10">正式改进措施：</label>
                                    <div id="ed4"></div>
                                    <textarea id="formalImprovementMeasures" style="display: none;"
                                              name="formalImprovementMeasures"></textarea>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="summary" class="field-label text fs15 mb10">经验总结：</label>
                                    <div id="ed5"></div>
                                    <textarea id="summary" style="display: none;" name="summary"></textarea>
                                </div>
                            </div>
                            <input type="hidden" name="userId" value="${USER.id}"/>
                            <div class="panel-footer text-right">
                                <button type="submit" class="button" id="btn1">提交</button>
                                <button type="reset" class="button" onclick="clean()">清除</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>


</body>
</html>
<jsp:include page="../footer.jsp"/>
<!-- 修改.js目录位置 -->
<script type="text/javascript" src="<%=basePath%>/js/wangEditor.min.js"></script>
<script type="text/javascript">

    $("#dateString").datetimepicker({
        format: 'YYYY-MM-DD',
        locale: moment.locale('zh-cn')
    });
    var E = window.wangEditor;
    var editor1 = new E('#ed1');
    var editor2 = new E('#ed2');
    var editor3 = new E('#ed3');
    var editor4 = new E('#ed4');
    var editor5 = new E('#ed5');
    var problemDescription = $("#problemDescription");
    var reasonAnalysis = $("#reasonAnalysis");
    var temporaryImprovementMeasures = $("#temporaryImprovementMeasures");
    var formalImprovementMeasures = $("#formalImprovementMeasures");
    var summary = $("#summary");
    customConfig(editor1);
    customConfig(editor2);
    customConfig(editor3);
    customConfig(editor4);
    customConfig(editor5);
    textarea(editor1, problemDescription);
    textarea(editor2, reasonAnalysis);
    textarea(editor3, temporaryImprovementMeasures);
    textarea(editor4, formalImprovementMeasures);
    textarea(editor5, summary);
    // 必须放到有关于编辑器设置前面
    editor1.create();
    editor2.create();
    editor3.create();
    editor4.create();
    editor5.create();
    problemDescription.val(editor1.txt.html());
    reasonAnalysis.val(editor2.txt.html());
    temporaryImprovementMeasures.val(editor3.txt.html());
    formalImprovementMeasures.val(editor4.txt.html());
    summary.val(editor5.txt.html());

    function customConfig(editor) {
        editor.customConfig.zIndex = 100;
        //自定义菜单
        editor.customConfig.menus = [
            'head',  // 标题
            'bold',  // 粗体
            'fontSize',  // 字号
            'fontName',  // 字体
            'italic',  // 斜体
            'underline',  // 下划线
            'strikeThrough',  // 删除线
            'foreColor',  // 文字颜色
            'backColor',  // 背景颜色
            'link',  // 插入链接
            'list',  // 列表
            'justify',  // 对齐方式
            'image',  // 插入图片
            'table',  // 表格
            'undo',  // 撤销
            'redo'  // 重复
        ]
        /*editor.customConfig.uploadImgShowBase64 = true;// 使用 base64 保存图片*/
        // 配置服务器端地址
        editor.customConfig.uploadImgServer = '<%=basePath%>/de/upload';
        //隐藏网络图片
        editor.customConfig.showLinkImg = false;
        // 将图片大小限制为 3M
        editor.customConfig.uploadImgMaxSize = 3 * 1024 * 1024;
        // 自定义上传参数
        editor.customConfig.uploadFileName = 'file';
        editor.customConfig.uploadImgHooks = {
            // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
            // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
            customInsert: function (insertImg, result, editor) {
                // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
                // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果
                // 举例：假如上传图片成功后，服务器端返回的是 {url:'....'} 这种格式，即可这样插入图片：
                var url = result.url;
                insertImg(url)
                // result 必须是一个 JSON 格式字符串！！！否则报错
            }
        };
    }

    function textarea(editor, ids) {
        editor.customConfig.onchange = function (html) {
            // 监控变化，同步更新到 textarea
            ids.val(html)
        }
    }

    function clean() {
        editor1.txt.clear();
        editor2.txt.clear();
        editor3.txt.clear();
        editor4.txt.clear();
        editor5.txt.clear();
    }

    function isValid(form) {
        if (form.title.value == "") {
            layer.msg("标题不能为空！",{icon:2});
            return false;
        } else if (form.amount.value == "") {
            layer.msg("数量不能为空！",{icon:2});
            return false;
        } else if (form.prime_piece.value == "") {
            layer.msg("主凶件不能为空！",{icon:2});
            return false;
        } else if (form.problem_input.value == "") {
            layer.msg("问题输入不能为空！",{icon:2});
            return false;
        } else if (form.failure_mode.value == "") {
            layer.msg("失效模式不能为空！",{icon:2});
            return false;
        } else if (form.position_fault.value == "") {
            layer.msg("故障地点不能为空！",{icon:2});
            return false;
        } else if (form.reason_analysis.value == "") {
            layer.msg("原因分析不能为空！",{icon:2});
            return false;
        } else if (form.date_string.value == "") {
            layer.msg("发生日期不能为空！",{icon:2});
            return false;
        } else if (form.position_fault.value == "") {
            layer.msg("故障地点不能为空！",{icon:2});
            return false;
        } else if (form.product_class.value == "") {
            layer.msg("产品类别不能为空！",{icon:2});
            return false;
        } else if (form.problem_description.value == "") {
            layer.msg("描述不能为空！",{icon:2});
            return false;
        } else return true;
    }
</script>
