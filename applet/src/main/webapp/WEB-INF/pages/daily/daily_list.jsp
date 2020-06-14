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
                <h2>日志列表</h2>
                <p class="lead">部门员工日志信息</p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block">
                <form action="${pageContext.request.contextPath}/daily/search" method="post">
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
                </form>
                <div class="panel  heading-border">
                    <!-- message listings table -->
                    <div class="panel-body pn">
                        <table id="message-table" class="table table-striped table-hover">
                            <thead>
                            <tr class="">
                                <th class="hidden-xs">&nbsp;</th>
                                <th class="hidden-xs">姓名</th>
                                <th class="hidden-xs">事项</th>
                                <th class="hidden-xs">完成情况</th>
                                <th class="hidden-xs">创建时间</th>
                                <th>查看</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="daily" varStatus="status">
                                <tr class="message-unread">
                                    <td class="">
                                        <img src="${daily.user.userImg}" alt="avatar" class="mw30 br64">
                                    </td>
                                    <td class="">${daily.user.realName}</td>
                                    <td class="" width="35%">
                                        <textarea name="textarea" class="form-control" rows="6" readonly="readonly"
                                                  style="resize:none;border: none;">${daily.items}</textarea>
                                    </td>
                                    <td class="" width="35%">
                                        <textarea name="textarea" class="form-control" rows="6" readonly="readonly"
                                                  style="resize:none;border: none;">${daily.performance}</textarea>
                                    </td>
                                    <td class=""><fmt:formatDate value="${daily.createTime}"
                                                                 pattern="yyyy-MM-dd"/></td>
                                    <td class=""><a class="btn btn-primary" onclick="show(${daily.id})">查看</a>&nbsp;
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
                                        <a href="${pageContext.request.contextPath}/daily/list?pageNum=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/list?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/list?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/daily/list?pageNum=${page.pages}"><span>尾页</span></a>
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
        var realName= $("#realName").val();
        var startTime= $("#startTime").val();
        var endTime=$("#endTime").val();
        window.location.href="${pageContext.request.contextPath}/dailySearch?realName="+realName+"&startTime="+startTime+"&endTime="+endTime;
    });

    function show(id) {
        layer.open({
            type: 2,
            title: '日志查看',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['800px', '600px'],
            content: '${pageContext.request.contextPath}/daily/find_one?id='+id
        });
    }

</script>