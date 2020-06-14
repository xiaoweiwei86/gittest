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
                <h2><span style="color: #1c7393">${USER.realName}</span>的日志</h2>
                <p class="lead">
                    您好，欢迎管理您的日志。
                </p>
            </div>

            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block">
                <form method="post" action="${pageContext.request.contextPath}/daily/searchByTime">
                    <div class="section">
                        <div class="section row center-block">
                            <div class='col-md-4'>
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
                            <div class='col-md-4'>
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
                                    <button type="submit" class="btn btn-default btn-lg" id="searchByKeywords">
                                        <span class="glyphicon glyphicon-search"></span> Go！
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-1">
                                <div class='input-group'>
                                    <button type="button" class="btn btn-default btn-lg" id="excel" title="点击导出日志报表（Excel）">
                                        <span class="glyphicon glyphicon-download-alt"></span> 导出
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
                <div class="panel  heading-border">
                    <!-- message listings table -->
                    <div class="panel-body pn">
                        <table id="message-table" class="table table-striped table-hover">
                            <thead>
                            <tr class="">
                                <th class="hidden-xs">&nbsp;</th>
                                <th class="hidden-xs">事项</th>
                                <th class="hidden-xs">完成情况</th>
                                <th class="hidden-xs">创建时间</th>
                                <%-- <th class="hidden-xs">修改时间</th>--%>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="daily" varStatus="status">
                                <tr class="message-unread">
                                    <td class="">
                                        <img src="${daily.user.userImg}" alt="avatar" class="mw30 br64">
                                    </td>
                                    <td class="" width="35%">
                                        <textarea class="form-control" rows="6" readonly="readonly"
                                                  style="resize:none;border: none;">${daily.items}</textarea>
                                    </td>
                                    <td class="" width="35%">
                                        <textarea class="form-control" rows="6" readonly="readonly"
                                                  style="resize:none;border: none;">${daily.performance}</textarea>
                                    </td>
                                    <td class=""><fmt:formatDate value="${daily.createTime}" pattern="yyyy-MM-dd"/></td>
                                        <%--<td class=""><fmt:formatDate value="${daily.modificationTime}" pattern="yyyy-MM-dd"/></td>--%>
                                    <td class=""><a class="btn btn-primary" onclick="confirm(${daily.id})">删除</a>&nbsp;
                                        <a type="button" class="btn btn-primary"  href="${pageContext.request.contextPath}/daily/to_edit?id=${daily.id}">编辑</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${flag!=1}">
                        <nav aria-label="Page navigation">
                            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                <!-- Pager -->
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/myself?pageNum=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/myself?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/myself?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/myself?pageNum=${page.pages}"><span>尾页</span></a>
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
                                        <a href="${pageContext.request.contextPath}/daily/searchByTime?pageNum=1&startTime=${startTime}&endTime=${endTime}"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/searchByTime?pageNum=${page.pageNum-1}&startTime=${startTime}&endTime=${endTime}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/searchByTime?pageNum=${page.pageNum+1}&startTime=${startTime}&endTime=${endTime}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/searchByTime?pageNum=${page.pages}&startTime=${startTime}&endTime=${endTime}"><span>尾页</span></a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </c:if>
                </div>
            </div>
            <!-- end: .admin-form -->
        </div>
        <!-- end: .tray-center -->
        </div>
    </section>
    <!-- End: Content -->
</section>
<!-- End: Content-Wrapper -->
</div>


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
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        window.location.href = "${pageContext.request.contextPath}/dailyMyself?startTime=" + startTime + "&endTime=" + endTime;
    });
    function confirm(id) {
        layer.confirm('您确定要删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
           location.href="${pageContext.request.contextPath}/daily/remove?id="+id
        }, function(){
            parent.layer.closeAll();
        });
    }
</script>