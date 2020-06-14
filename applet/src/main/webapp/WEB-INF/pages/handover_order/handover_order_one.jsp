<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp"/>
<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content">
        <!-- begin: .tray-center -->
        <div class="tray tray-center" style="margin: auto">
            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>查看资产交接单</h2>
                <p class="lead">恒隆集团研究院资产交接单</p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 交接信息 </span>
                        </div>
                        <div class="section row center-block">
                            <div class="col-md-4">
                                <label for="transferDate"
                                       class="field-label text fs14 mb10">交接日期：</label>
                                <input id="transferDate" name="transferDate" class="form-control" readonly
                                       value="${handoverOrder.transferDate}"/>
                            </div>
                            <div class="col-md-4">
                                <label for="transferTeam"
                                       class="field-label text fs14 mb10">移交单位：</label>
                                <input id="transferTeam" name="transferTeam" class="form-control" readonly
                                       value="${handoverOrder.transferTeam}"/>
                            </div>
                            <div class="col-md-4">
                                <label for="acceptTeam"
                                       class="field-label text fs14 mb10">接收单位：</label>
                                <input id="acceptTeam" name="acceptTeam" class="form-control" readonly
                                       value="${handoverOrder.acceptTeam}"/>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 资产信息 </span>
                        </div>
                        <div class="section row" id="asset">
                            <c:forEach items="${handoverOrder.assets}" var="asset">
                                <div class="section row center-block">
                                    <div class="col-md-2">
                                        <input class="form-control" readonly value="${asset.number}"/>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" readonly value="${asset.name}"/>
                                    </div>
                                    <div class="col-md-4">
                                        <input class="form-control" readonly value="${asset.specification}"/>
                                    </div>
                                    <div class="col-md-3">
                                        <input class="form-control" readonly value="${asset.usingTeam}"/>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <input id="assetIds" type="hidden" name="assetIds"/>
                        <input name="userId" type="hidden" value="${USER.id}"/>
                    </div>
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 签字栏 </span>
                        </div>
                        <div class="section row center-block">
                            <div class="col-md-4">
                                <label class="field-label text fs14 mb10">移交单位：
                                    <c:if test="${transferComment!=null}">
                                        <c:if test="${transferComment.content==null}">
                                            ${transferComment.user.realName}&nbsp;<fmt:formatDate
                                                value="${transferComment.createTime}"/>
                                        </c:if>
                                    </c:if>
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="field-label text fs14 mb10">接收单位：
                                    <c:if test="${acceptComment!=null}">
                                        <c:if test="${acceptComment.content==null}">
                                            ${acceptComment.user.realName}&nbsp;<fmt:formatDate
                                                value="${acceptComment.createTime}"/>
                                        </c:if>
                                    </c:if>
                                </label>
                            </div>
                            <div class="col-md-4">
                                <label class="field-label text fs14 mb10">经办人：${handoverOrder.user.realName}&nbsp;
                                    <fmt:formatDate value="${handoverOrder.updateTime}"/></label>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 流程意见 </span>
                        </div>
                        <div class="section row center-block">
                            <c:forEach items="${commentList}" var="comment">
                                <div class="col-md-12">
                                    <c:if test="${comment.content!=null}">
                                        <label class="field-label text fs14 mb10">
                                                ${comment.user.realName} 于 <fmt:formatDate value="${comment.createTime}"
                                                                                           pattern="YYYY-MM-dd HH:mm:ss"/><br/>
                                                ${comment.content}
                                        </label>
                                    </c:if>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="panel-footer text-right">
                    <button type="button" class="button" onclick="javascript:parent.layer.closeAll();"> 返回
                    </button>
                </div>
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
    </script>