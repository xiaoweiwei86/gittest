<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../head.jsp"/>

<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content" class="table-layout animated fadeIn">
        <!-- begin: .tray-center -->
        <div class="tray tray-center">

            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>交接单</h2>
                <p class="lead">集团研究院资产交接清单</p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1000 center-block">
                <div class="panel  heading-border">
                    <!-- message listings table -->
                    <div class="panel-body pn">
                        <table id="message-table" class="table table-striped table-hover" style="min-height: 150px;">
                            <c:if test="${list.size()==0}">
                                <tr class="message-unread">
                                    <td class="text-center">
                                        <h3>没有交接记录哦！</h3>
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
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
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
                                            <a class="btn btn-primary" onclick="show(${handoverOrder.id})">查看</a>&nbsp;
                                        </td>
                                    </tr>
                                </c:forEach>
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

    function show(id) {
        layer.open({
            type: 2,
            title: name,
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['1000px', '650px'],
            content: '${pageContext.request.contextPath}/handover_order/find_one?id=' + id
        });
    }

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

    function confirm(id) {
        layer.confirm('您确定要删除？', {
            btn: ['确定', '取消'] //按钮
        }, function () {
            location.href = "${pageContext.request.contextPath}/asset/remove?id=" + id
        }, function () {
            parent.layer.closeAll();
        });
    }
</script>