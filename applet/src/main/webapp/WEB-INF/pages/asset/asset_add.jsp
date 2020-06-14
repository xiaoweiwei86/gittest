<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2><span style="color: #1c7393">${USER.realName}</span>您好，您正在添加固定资产！ </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw900 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/asset/add"
                          method="post" onsubmit="return checkNumber('${USER.team}','${USER.role.nickName}')">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb20">
                                <span> 添加固定资产 </span>
                            </div>
                            <div class="section row ">
                                <div class="col-md-4">
                                    <label for="number" class="field-label text-muted fs14 mb10">编号</label>
                                    <input type="text" name="number" id="number" class="form-control"
                                           required="required">
                                </div>

                                <div class="col-md-4">
                                    <label for="name" class="field-label text-muted fs14 mb10">名称</label>
                                    <input type="text" name="name" id="name" class="form-control"
                                           required="required">
                                </div>
                                <div class="col-md-4">
                                    <label for="categoryId" class="field-label text-muted fs14 mb10">分类</label>
                                    <select type="text" name="categoryId" id="categoryId" class="form-control"
                                            required="required">
                                        <option value="" selected="selected">请选择...</option>
                                        <c:forEach var="category" items="${category}">
                                            <option value="${category.id}">${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-4">
                                    <label for="model" class="field-label text-muted fs14 mb10">型号</label>
                                    <input type="text" name="model" id="model" class="form-control" required="required">
                                </div>
                                <div class="col-md-4">
                                    <label for="specification" class="field-label text-muted fs14 mb10">规格/配置</label>
                                    <input type="text" name="specification" id="specification" class="form-control"
                                           required="required">
                                </div>
                                <div class="col-md-4">
                                    <label for="originalValue" class="field-label text-muted fs14 mb10">原值（元）</label>
                                    <input name="originalValue" id="originalValue" type="text" class="form-control"
                                           required="required"/>
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-4">
                                    <label for="manufacturerCountry"
                                           class="field-label text-muted fs14 mb10">厂家/国别</label>
                                    <input name="manufacturerCountry" id="manufacturerCountry" type="text"
                                           class="form-control" required="required"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="startUsingDate" class="field-label text-muted fs14 mb10">启用年月</label>
                                    <input name="startUsingDate" id="startUsingDate" type="text" class="form-control"
                                           required="required"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="paymentReceivingDate"
                                           class="field-label text-muted fs14 mb10">入账时间</label>
                                    <input name="paymentReceivingDate" id="paymentReceivingDate" type="text"
                                           class="form-control" required="required"/>
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-4">
                                    <label for="manufacturingNumber"
                                           class="field-label text-muted fs14 mb10">出厂编号</label>
                                    <input name="manufacturingNumber" id="manufacturingNumber" type="text"
                                           class="form-control" required="required"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="controlledState" class="field-label text-muted fs14 mb10">管理状态</label>
                                    <input name="controlledState" id="controlledState" type="text" class="form-control"
                                           required="required"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="custodian" class="field-label text-muted fs14 mb10">使用人/管理人</label>
                                    <input name="custodian" id="custodian" type="text" class="form-control"
                                           required="required"/>
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-4">
                                    <label for="qualitySituation" class="field-label text-muted fs14 mb10">质量情况</label>
                                    <select class="form-control" name="qualitySituation" id="qualitySituation" required>
                                        <option value="OK" selected="selected">OK</option>
                                        <option value="NO">NO</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label for="affiliation" class="field-label text-muted fs14 mb10">设备归属</label>
                                    <input name="affiliation" id="affiliation" type="text" class="form-control"
                                           required="required"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="usingTeam" class="field-label text-muted fs14 mb10">使用部门</label>
                                    <select id="usingTeam" name="usingTeam" class="form-control" required>
                                        <option value="" selected="selected">请选择...</option>
                                        <c:forEach items="${teams}" var="team">
                                            <option value="${team.teamName}">${team.teamName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-12">
                                    <label for="abnormal" class="field-label text-muted fs14 mb10">异动情况</label>
                                    <textarea class="form-control" id="abnormal" name="abnormal" rows="3"
                                              style="resize:none"></textarea>
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-12">
                                    <label for="remarks" class="field-label text-muted fs14 mb10">备注</label>
                                    <textarea class="form-control" id="remarks" name="remarks" rows="3"
                                              style="resize:none"></textarea>
                                </div>
                            </div>
                            <input value="${USER.id}" name="userId" type="hidden"/>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button">添加</button>
                            <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>
<script>
    $(function () {
        $('#startUsingDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $('#paymentReceivingDate').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
    });
    var isNUmber = 0;
    $("#number").blur(function () {
        var number = $("#number").val();
        $.ajax({
            "type": "POST",
            "url": "${pageContext.request.contextPath }/asset/find_number",
            "data": {"number": number},
            "dataType": "json",
            "success": function (asset) {
                if (asset != null || asset != "") {
                    isNUmber = 1;
                    layer.msg("编号已存在...", {icon: 5});
                    console.log(isNUmber);
                }
            },
            "error":function () {
                isNUmber=0;
                console.log(isNUmber);
            }
        });
    });

    function checkNumber(team,role) {
        var usingTeam = $("#usingTeam").val();
        if (isNUmber == 1) {
            layer.msg("编号已存在...", {icon: 5});
            return false;
        }
        if (role!= '超级管理员') {
            if (team != usingTeam) {
                layer.msg("不允许添加其他部门资产...", {icon: 5});
                return false;
            }
        }
    }
</script>