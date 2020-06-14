<%@ page language="java" import="java.util.*" pageEncoding="utf-8" %>
<%@ page import="com.chl.applet.entity.User" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    User user =(User)request.getSession().getAttribute("USER");
%>
<html>
<body>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2><span style="color: #1c7393">${user.realName}</span>您好，您正在审核经验数据库。 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw900 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb20">
                            <span> 编辑经验数据库 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="title" class="field-label text fs15 mb10">标题：</label>
                                <input class="form-control" id="title" name="title" disabled="disabled"
                                       value="${experienceDatabase.title}"/>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="productModel" class="field-label text fs15 mb10">产品型号：</label>
                                <input class="form-control" id="productModel" name="productModel" disabled="disabled"
                                       value="${experienceDatabase.productModel}"/>
                            </div>
                            <div class="col-md-6">
                                <label for="productClass" class="field-label text fs15 mb10">产品类别：</label>
                                <input list="productClass" class="form-control" name="productClass" disabled="disabled"
                                       value="${experienceDatabase.productClass}"/>
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
                                <input class="form-control" id="primePiece" name="primePiece" disabled="disabled"
                                       value="${experienceDatabase.primePiece}"/>
                            </div>
                            <div class="col-md-6">
                                <label for="primeCategory" class="field-label text fs15 mb10">主凶类别：</label>
                                <input list="primeCategory" name="primeCategory" class="form-control"
                                       disabled="disabled" value="${experienceDatabase.primeCategory}"/>
                                <datalist id="primeCategory">
                                    <option value="设计">设计</option>
                                    <option value="过程">过程</option>
                                </datalist>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="problemInput" class="field-label text fs15 mb10">问题输入：</label>
                                <input list="problemInput" name="problemInput" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.problemInput}"/>
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
                                <input list="failureMode" name="failureMode" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.failureMode}"/>
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
                                <input id="positionPhase" name="positionPhase" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.positionPhase}"/>&nbsp;&nbsp;
                            </div>
                            <div class="col-md-6">
                                <label for="positionFault" class="field-label text fs15 mb10">故障地点：</label>
                                <input id="positionFault" name="positionFault" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.positionFault}"/>&nbsp;
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-6">
                                <label for="amount" class="field-label text fs15 mb10">故障数量：</label>
                                <input id="amount" name="amount" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.amount}"/>
                            </div>
                            <div class="col-md-6">
                                <label for="dateString" class="field-label text fs15 mb10">发生日期：</label>
                                <input id="dateString" name="dateString" class="form-control" disabled="disabled"
                                       value="${experienceDatabase.dateString}"/>&nbsp;
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="problemDescription" class="field-label text fs15 mb10">问题描述：</label>
                                <div id="ed1">${experienceDatabase.problemDescription}</div>
                                <textarea id="problemDescription" style="display: none;"
                                          name="problemDescription" disabled="disabled"></textarea>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="reasonAnalysis" class="field-label text fs15 mb10">原因分析：</label>
                                <div id="ed2">${experienceDatabase.reasonAnalysis}</div>
                                <textarea id="reasonAnalysis" style="display: none;"
                                          name="reasonAnalysis" disabled="disabled"></textarea>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="temporaryImprovementMeasures"
                                       class="field-label text fs15 mb10">临时改进措施：</label>
                                <div id="ed3">${experienceDatabase.temporaryImprovementMeasures}</div>
                                <textarea id="temporaryImprovementMeasures" style="display: none;"
                                          name="temporaryImprovementMeasures" disabled="disabled"></textarea>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="formalImprovementMeasures"
                                       class="field-label text fs15 mb10">正式改进措施：</label>
                                <div id="ed4">${experienceDatabase.formalImprovementMeasures}</div>
                                <textarea id="formalImprovementMeasures" style="display: none;"
                                          name="formalImprovementMeasures" disabled="disabled"></textarea>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <label for="summary" class="field-label text fs15 mb10">经验总结：</label>
                                <div id="ed5">${experienceDatabase.summary}</div>
                                <textarea id="summary" style="display: none;" name="summary"></textarea>
                            </div>
                        </div>
                        <div class="section row">
                            <c:forEach items="${comments}" var="comment" varStatus="status">
                                <div class="col-md-12">
                                    <label for="comment" class="field-label text fs15 mb10">
                                            ${comment.user.realName}于<fmt:formatDate value="${comment.createTime}"
                                                                                     pattern="YYYY-MM-dd HH:mm:ss"/>
                                    </label>
                                    <p id="comment" disabled="disabled">${comment.content}</p>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="button" class="button" id="btn1"
                                    onclick="javascript:window.location.href=('${pageContext.request.contextPath }/ed/approve?id=${experienceDatabase.id}')">
                                通过
                            </button>
                            <button type="button" class="button" data-toggle="modal" data-target="#myModal">驳回
                            </button>
                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                                 aria-labelledby="myModalLabel"
                                 aria-hidden="true">
                                <div class="modal-dialog">
                                    <!--content-->
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">X
                                            </button>
                                        </div>
                                        <!--body-->
                                        <div class="modal-body">
                                            <%--<form action="${pageContext.request.contextPath }/ed/comment?id=${experienceDatabase.id}"
                                                  method="post">--%>
                                                <div class="section-divider mt20 mb40">
                                                    <span>驳回意见</span>
                                                </div>
                                                <div class="form-group">
                                                            <textarea name="content" id="content1" class="form-control" rows="6"
                                                                      style="resize:none" required></textarea>
                                                </div>
                                                <div class="panel-footer text-right">
                                                    <button type="submit" class="button" onclick="comment(${experienceDatabase.id})">提交</button>
                                                    <button type="reset" class="button">清除</button>
                                                </div>
                                           <%-- </form>--%>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>


</body>
</html>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript" src="<%=basePath%>/js/wangEditor.min.js"></script>
<script type="text/javascript">
    function comment(id){
        layer.msg("正在努力的发送驳回邮件......",{icon: 6});
        var content =$("#content1").val();
        $.ajax({
            type: "post",//type：请求的类型
            url: "${pageContext.request.contextPath}/ed/comment",//url：请求的路径
            async: true,//是否自动提交
            data: {
                'id': id,
                'content':content
            },
            dataType: "text",	//数据类型
            success: function () {
                window.location.replace("${pageContext.request.contextPath}/ed/nocheck?teamId="+<%=user.getTeamId()%>);
            },
            error:function () {
                window.location.replace("${pageContext.request.contextPath}/ed/nocheck?teamId="+<%=user.getTeamId()%>);
            }
        });
    }

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
        editor.customConfig.zIndex = 1;
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

</script>
