<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>

<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content" class="table-layout animated fadeIn">
        <!-- begin: .tray-center -->
        <div class="tray tray-center">
            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>待审核交接单</h2>
                <p class="lead">集团研究院资产交接清单</p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1000 center-block">
                <%--<form action="${pageContext.request.contextPath}/daily/search" method="post">
                    <div class="section">
                        <div class="section row center-block">
                            <div class="col-md-3">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="realName" name="realName"
                                               placeholder="输入姓名搜索..." style="width:120%" value="${realName}">
                                    </div>
                                </div>
                            </div>
                            <div class='col-md-3'>
                                <div class="form-group">
                                    <div class='input-group date' id='date1'>
                                        <input type='text' class="form-control" id="startTime" name="startTime"
                                               placeholder="选择开始日期..." value="${startTime}"/>
                                        <span class="input-group-addon">
                                         <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                            <div class='col-md-3'>
                                <div class="form-group">
                                    <div class='input-group date' id='date2'>
                                        <input type='text' class="form-control" id="endTime" name="endTime"
                                               placeholder="选择结束日期..." value="${endTime}"/>
                                        <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar"></span>
                                    </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class='input-group'>
                                    <button type="submit" class="btn btn-default btn-lg" id="search">
                                        <span class="glyphicon glyphicon-search"></span> Go！
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class='input-group'>
                                    <button type="button" class="btn btn-default btn-lg" id="excel" title="点击导出Excel">
                                        <span class="glyphicon glyphicon-download-alt"></span> 导出
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>--%>
                <div class="panel  heading-border">
                    <!-- message listings table -->
                    <div class="panel-body pn">
                        <table id="message-table" class="table table-striped table-hover" style="min-height: 150px;">
                            <c:if test="${list.size()==0}">
                                <tr class="message-unread">
                                    <td class="text-center">
                                        <h3><span class="glyphicon glyphicon-thumbs-up"></span> 真棒！您已经处理完全部交接单！</h3>
                                    </td>
                                </tr>
                            </c:if>
                            <c:if test="${list.size()!=0}">
                                <thead>
                                <tr class="">
                                    <th class="hidden-xs">序号</th>
                                    <th class="hidden-xs">资产编号</th>
                                    <th class="hidden-xs">移交单位</th>
                                    <th class="hidden-xs">接收单位</th>
                                    <th class="hidden-xs">移交时间</th>
                                    <th class="hidden-xs">状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${USER.role.nickName=='超级管理员'}">
                                    <c:forEach items="${list}" var="handoverOrder" varStatus="status">
                                        <tr class="message-unread">
                                            <td class="">${status.index+1}</td>
                                            <td class="">
                                                <c:forEach items="${handoverOrder.assets}" var="asset">
                                                    <a href="#" onclick="showAsset(${asset.id})"
                                                       title="${asset.categoryAsset.name},${asset.model},${asset.specification}">${asset.number}</a>
                                                </c:forEach>
                                            </td>
                                            <td class="">${handoverOrder.transferTeam}</td>
                                            <td class="">${handoverOrder.acceptTeam}</td>
                                            <td class="">${handoverOrder.transferDate}</td>
                                            <td class="">
                                                <c:choose>
                                                    <c:when test="${handoverOrder.statusNo==4}">
                                                        已完成
                                                    </c:when>
                                                    <c:when test="${handoverOrder.statusNo==3}">
                                                        接收审核中
                                                    </c:when>
                                                    <c:when test="${handoverOrder.statusNo==2}">
                                                        移交审核中
                                                    </c:when>
                                                    <c:when test="${handoverOrder.statusNo==1}">
                                                        驳回
                                                    </c:when>
                                                    <c:when test="${handoverOrder.statusNo==0}">
                                                        新建
                                                    </c:when>
                                                </c:choose>
                                            </td>
                                            <td class="">
                                                <a class="btn btn-primary"
                                                   href="${pageContext.request.contextPath}/handover_order/to_check?id=${handoverOrder.id}">审核</a>&nbsp;
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                <c:if test="${USER.role.nickName=='部长'}">
                                    <c:forEach items="${list}" var="handoverOrder" varStatus="status">
                                        <tr class="message-unread">
                                            <c:if test="${(handoverOrder.acceptTeam==USER.team && handoverOrder.statusNo==3)||(handoverOrder.transferTeam==USER.team && handoverOrder.statusNo==2)}">
                                                <td class="">${status.index+1}</td>
                                                <td class="">
                                                    <c:forEach items="${handoverOrder.assets}" var="asset">
                                                        <a href="#" onclick="showAsset(${asset.id})"
                                                           title="${asset.categoryAsset.name},${asset.model},${asset.specification}">${asset.number}</a>
                                                    </c:forEach>
                                                </td>
                                                <td class="">${handoverOrder.transferTeam}</td>
                                                <td class="">${handoverOrder.acceptTeam}</td>
                                                <td class="">${handoverOrder.transferDate}</td>
                                                <td class="">
                                                    <c:choose>
                                                        <c:when test="${handoverOrder.statusNo==4}">
                                                            已完成
                                                        </c:when>
                                                        <c:when test="${handoverOrder.statusNo==3}">
                                                            接收审核中
                                                        </c:when>
                                                        <c:when test="${handoverOrder.statusNo==2}">
                                                            移交审核中
                                                        </c:when>
                                                        <c:when test="${handoverOrder.statusNo==1}">
                                                            驳回
                                                        </c:when>
                                                        <c:when test="${handoverOrder.statusNo==0}">
                                                            新建
                                                        </c:when>
                                                    </c:choose>
                                                </td>
                                                <td class="">
                                                    <a class="btn btn-primary"
                                                       href="${pageContext.request.contextPath}/handover_order/to_check?id=${handoverOrder.id}">审核</a>&nbsp;
                                                </td>
                                            </c:if>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </c:if>
                        </table>
                    </div>
                    <c:if test="${list.size()!=0}">
                        <c:if test="${flag!=1}">
                            <nav aria-label="Page navigation">
                                <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                    <!-- Pager -->
                                    <ul class="pagination">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/handover_order/list?pageNum=1"><span>首页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/handover_order/list?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/handover_order/list?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/handover_order/list?pageNum=${page.pages}"><span>尾页</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </c:if>
                        <c:if test="${flag==1}">
                            <nav aria-label="Page navigation">
                                <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                    <!-- Pager -->
                                    <ul class="pagination">
                                        <li>
                                            <a href="${pageContext.request.contextPath}/daily/search?pageNum=1&realName=${realName}&startTime=${startTime}&endTime=${endTime}"><span>首页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/daily/search?pageNum=${page.pageNum-1}&realName=${realName}&startTime=${startTime}&endTime=${endTime}"><span>上一页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/daily/search?pageNum=${page.pageNum+1}&realName=${realName}&startTime=${startTime}&endTime=${endTime}"><span>下一页</span></a>
                                        </li>
                                        <li>
                                            <a href="${pageContext.request.contextPath}/daily/search?pageNum=${page.pages}&realName=${realName}&startTime=${startTime}&endTime=${endTime}"><span>尾页</span></a>
                                        </li>
                                    </ul>
                                </div>
                            </nav>
                        </c:if>
                    </c:if>
                </div>

            </div>
            <!-- end: .admin-form -->
        </div>
        <!-- end: .tray-center -->
    </section>
    <!-- End: Content -->
</section>
<!-- End: Content-Wrapper -->

<jsp:include page="../footer.jsp"/>

<script>

    $(function () {
        $('#date1').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            locale: moment.locale('zh-cn')
        });
        $('#date2').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:ss',
            locale: moment.locale('zh-cn')
        });
    });
    $("#excel").click(function () {
        var realName = $("#realName").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        window.location.href = "${pageContext.request.contextPath}/dailySearch?realName=" + realName + "&startTime=" + startTime + "&endTime=" + endTime;
    });

    function showAsset(id) {
        layer.open({
            type: 2,
            title: name,
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['1000px', '650px'],
            content: '${pageContext.request.contextPath}/asset/find_one?id=' + id
        });
    }

</script>