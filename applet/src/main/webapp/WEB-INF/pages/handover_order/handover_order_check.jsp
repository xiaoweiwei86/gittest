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
                <h2>审核资产交接单</h2>
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
                            <div class="section row center-block">
                                <div class="col-md-2">
                                    <label class="field-label text fs14 mb10">资产编号：</label>
                                </div>
                                <div class="col-md-3">
                                    <label class="field-label text fs14 mb10">资产名称：</label>
                                </div>
                                <div class="col-md-4">
                                    <label class="field-label text fs14 mb10">规格/配置：</label>
                                </div>
                                <div class="col-md-2">
                                    <label class="field-label text fs14 mb10">使用部门：</label>
                                </div>
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
                            <input id="assetIds" type="hidden" name="assetIds" value="${handoverOrder.assetIds}"/>
                            <input name="userId" type="hidden" value="${handoverOrder.id}"/>
                        </div>
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
                                    <fmt:formatDate value="${handoverOrder.updateTime}"/>
                                </label>
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
                                                ${comment.user.realName} 于 <fmt:formatDate
                                                value="${comment.createTime}"
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
                    <c:if test="${handoverOrder.transferTeam==USER.team}">
                        <a type="submit" class="button"
                           href="/handover_order/transfer_check?id=${handoverOrder.id}"
                           onclick="javascript:layer.msg('后台正努力发送邮件中...')">
                            通过</a>
                    </c:if>
                    <c:if test="${handoverOrder.acceptTeam==USER.team}">
                        <a type="submit" class="button"
                           href="/handover_order/accept_check?id=${handoverOrder.id}"
                           onclick="javascript:layer.msg('后台正努力发送邮件中...')">
                            通过</a>
                    </c:if>
                    <c:if test="${handoverOrder.statusNo!=4}">
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
                                </div>
                                <!--body-->
                                <div class="modal-body">
                                    <form action="${pageContext.request.contextPath }/handover_order/add_comment"
                                          method="post">
                                        <div class="panel-body bg-light">
                                            <div class="section-divider mt20 mb40">
                                                <span>驳回意见</span>
                                            </div>
                                            <div class="form-group">
                                            <textarea name="content" id="content1" class="form-control" rows="6"
                                                      style="resize:none" required></textarea>
                                            </div>
                                            <input type="hidden" name="userId" value="${USER.id}"/>
                                            <input type="hidden" name="handoverOrderId"
                                                   value="${handoverOrder.id}"/>
                                            <div class="panel-footer text-right">
                                                <button type="submit" class="button" onclick="javascript:layer.msg('后台正努力发送邮件中...')">提交</button>
                                                <button type="reset" class="button">清除</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                        </c:if>
                        <c:if test="${handoverOrder.statusNo==4}">
                            <button type="button" class="button" onclick="javascript:window.history.go(-1);">返回
                            </button>
                        </c:if>
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