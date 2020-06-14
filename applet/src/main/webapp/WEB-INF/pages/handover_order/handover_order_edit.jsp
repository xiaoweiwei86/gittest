<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content">
        <!-- begin: .tray-center -->
        <div class="tray tray-center" style="margin: auto">
            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>创建资产交接单</h2>
                <p class="lead">恒隆集团研究院资产交接单</p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm"
                          action="${pageContext.request.contextPath }/handover_order/edit">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 交接信息 </span>
                            </div>
                            <div class="section row center-block">
                                <div class="col-md-4">
                                    <label for="transferDate"
                                           class="field-label text fs14 mb10">交接日期：</label>
                                    <input id="transferDate" name="transferDate" class="form-control"
                                           value="${handoverOrder.transferDate}"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="transferTeam"
                                           class="field-label text fs14 mb10">移交单位：</label>
                                    <input id="transferTeam" name="transferTeam" class="form-control" readonly
                                           value="${handoverOrder.transferTeam}"/>
                                    <%--<select id="transferTeam" name="transferTeam" class="form-control">
                                        <option value="" selected="selected">请选择...</option>
                                        <c:forEach items="${teams}" var="team">
                                            <option value="${team.teamName}">${team.teamName}</option>
                                        </c:forEach>
                                    </select>--%>
                                </div>
                                <div class="col-md-4">
                                    <label for="acceptTeam"
                                           class="field-label text fs14 mb10">接收单位：</label>
                                    <select id="acceptTeam" name="acceptTeam" class="form-control">
                                        <option value="${handoverOrder.acceptTeam}"
                                                selected="selected">${handoverOrder.acceptTeam}</option>
                                        <c:forEach items="${teams}" var="team">
                                            <c:if test="${team.teamName!=handoverOrder.acceptTeam}">
                                                <option value="${team.teamName}">${team.teamName}</option>
                                            </c:if>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 添加资产 </span>
                            </div>
                            <div class="section row" id="asset">
                                <c:forEach items="${handoverOrder.assets}" var="asset" varStatus="status">
                                    <div class="section row center-block">
                                        <div class="col-md-2">
                                            <input id="number_${status.index}" class="form-control"
                                                   onblur="getAsset(this,'${USER.team}')"
                                                   placeholder="资产编号" value="${asset.number}"/>
                                        </div>
                                        <div class="col-md-3">
                                            <input id="name_${status.index}" class="form-control" placeholder="资产型号"
                                                   value="${asset.name}"/>
                                        </div>
                                        <div class="col-md-4">
                                            <input id="specification_${status.index}" class="form-control"
                                                   placeholder="配置/规格" value="${asset.specification}"/>
                                        </div>
                                        <div class="col-md-2">
                                            <input id="usingTeam_${status.index}" class="form-control"
                                                   placeholder="使用部门" value="${asset.usingTeam}"/>
                                        </div>
                                        <div class="col-md-1" style="text-align:right;">
                                            <button type="button" id="remove_${asset.id}" onclick="remove(this)" class="button" value="${asset.id}">
                                                &times;
                                            </button>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                            <div class="section row center-block">
                                <div class="section row" style="text-align:right;">
                                    <div class="col-md-12">
                                        <button type="button" class="button" id="addButton">+</button>
                                    </div>
                                </div>
                            </div>
                            <input id="assetIds" type="hidden" name="assetIds" value="${handoverOrder.assetIds}"/>
                            <input name="userId" type="hidden" value="${handoverOrder.userId}"/>
                            <input name="id" type="hidden" value="${handoverOrder.id}"/>
                        </div>
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 签字栏 </span>
                            </div>
                            <div class="section row center-block">
                                <div class="col-md-4">
                                    <label class="field-label text fs14 mb10">移交单位：</label>
                                </div>
                                <div class="col-md-4">
                                    <label class="field-label text fs14 mb10">接收单位：</label>
                                </div>
                                <div class="col-md-4">
                                    <label class="field-label text fs14 mb10">经办人：</label>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button">修改</button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="../footer.jsp"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/items.js"></script>
    <script>
        $(function () {
            $('#transferDate').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
        });

        var assetIds = new Array();
        var assetIds_temp = $("#assetIds").val();
        assetIds = assetIds_temp.split(",");
        function getAsset(val, team) {
            var number = val.value;
            var id = val.id;
            var index = id.substr(id.length - 1, 1);
            $("input[id=name_" + index + "]").val("");
            $("input[id=specification_" + index + "]").val("");
            $("input[id=usingTeam_" + index + "]").val("");
            $.ajax({
                "type": "POST",
                "url": "${pageContext.request.contextPath }/asset/find_number",
                "data": {"number": number},
                "dataType": "json",
                "success": function (asset) {
                    if (team == asset.usingTeam) {
                        $("input[id=name_" + index + "]").val(asset.name);
                        $("input[id=specification_" + index + "]").val(asset.specification);
                        $("input[id=usingTeam_" + index + "]").val(asset.usingTeam);
                        $("button[id=remove_" + index + "]").val(asset.id);
                        assetIds[index] = asset.id.toString(); //转为为字符串
                        $("#assetIds").val(assetIds);
                    } else {
                        layer.msg("该资产不属于您部门，不能交接", {icon: 2});
                    }
                },
                "error": function () {
                    layer.msg("您输入的编号不存在", {icon: 5})
                }
            });
        }

        function remove(val) {
            var id=val.value;
            var index = assetIds.indexOf(id);
            if (index > -1) {
                assetIds.splice(index, 1); //移除数组元素
            }
            $("#assetIds").val(assetIds);
        }

    </script>