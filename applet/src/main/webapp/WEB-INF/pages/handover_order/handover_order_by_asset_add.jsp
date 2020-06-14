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
                <h2><span style="color: #1c7393">${asset.number}</span>正在交接</h2>
                <p class="lead">恒隆集团研究院资产交接单</p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm"
                          action="${pageContext.request.contextPath }/handover_order/add" onsubmit="return checkTeam()">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 交接信息 </span>
                            </div>
                            <div class="section row center-block">
                                <div class="col-md-4">
                                    <label for="transferDate"
                                           class="field-label text fs14 mb10">交接日期：</label>
                                    <input id="transferDate" name="transferDate"  required class="form-control"/>
                                </div>
                                <div class="col-md-4">
                                    <label for="transferTeam"
                                           class="field-label text fs14 mb10">移交单位：</label>
                                    <input id="transferTeam" name="transferTeam" class="form-control" readonly
                                           value="${USER.team}"/>
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
                                    <select id="acceptTeam" name="acceptTeam" class="form-control" required>
                                        <option value="" selected="selected">请选择...</option>
                                        <c:forEach items="${teams}" var="team">
                                            <option value="${team.teamName}">${team.teamName}</option>
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
                                <div class="section row center-block">
                                    <div class="col-md-2">
                                        <label for="number"
                                               class="field-label text fs14 mb10">资产编号：</label>
                                        <input id="number" class="form-control" readonly value="${asset.number}"/>
                                    </div>
                                    <div class="col-md-3">
                                        <label for="name"
                                               class="field-label text fs14 mb10">资产名称：</label>
                                        <input id="name" class="form-control" readonly value="${asset.name}"/>
                                    </div>
                                    <div class="col-md-4">
                                        <label for="specification"
                                               class="field-label text fs14 mb10">规格/配置：</label>
                                        <input id="specification" class="form-control" readonly
                                               value="${asset.specification}"/>
                                    </div>
                                    <div class="col-md-2">
                                        <label for="usingTeam"
                                               class="field-label text fs14 mb10">使用部门：</label>
                                        <input id="usingTeam" class="form-control" readonly value="${asset.usingTeam}"/>
                                    </div>
                                </div>
                            </div>
                            <input id="assetIds" type="hidden" name="assetIds" value="${asset.id}"/>
                            <input name="userId" type="hidden" value="${USER.id}"/>
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
                            <button type="submit" class="button" onclick="javascript:parent.layer.closeAll();" >提交</button>
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);"> 返回
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <jsp:include page="../footer.jsp"/>

    <script>
        $(function () {
            $('#transferDate').datetimepicker({
                format: 'YYYY-MM-DD',
                locale: moment.locale('zh-cn')
            });
        });

        function checkTeam() {
            var transferTeam=$("#transferTeam").val();
            var usingTeam=$("#usingTeam").val();
            if(transferTeam!=usingTeam){
                layer.msg("移交单位与使用单位不一致，不能移交！");
                return false;
            }
        }
    </script>