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
                <h2>已审核</h2>
                <p class="lead"></p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block" style="padding-bottom: 175px;">
                <form action="${pageContext.request.contextPath}/ed/searchChecked" method="post">
                    <div class="section">
                        <div class="section row center-block">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="keywords" name="keywords"
                                           placeholder="输入关键字搜索..." style="width:140%" value="${keywords}"/>
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
                            <div class="col-md-2">
                                <div class='input-group'>
                                    <button type="submit" class="btn btn-default btn-lg" id="search">
                                        <span class="glyphicon glyphicon-search"></span> Go！
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
                                <th class="hidden-xs">序号</th>
                                <th class="hidden-xs">标题</th>
                                <th class="hidden-xs">产品类别</th>
                                <th class="hidden-xs">产品型号</th>
                                <th class="hidden-xs">主凶件</th>
                                <th class="text-left">录入人</th>
                                <th class="text-left">录入时间</th>
                                <th class="text-left">状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="ed" varStatus="status">
                                <tr class="message-unread">
                                    <td class="text-left">${status.index+1}</td>
                                    <td class="">${ed.title}</td>
                                    <td class="">${ed.productClass}</td>
                                    <td class="">${ed.productModel}</td>
                                    <td class="">${ed.primePiece}</td>
                                    <td class="">${ed.entryPerson}</td>
                                    <td class=""><fmt:formatDate value="${ed.entryDate}"
                                                                 pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                    <td class=""><span class="glyphicon glyphicon-ok" title="已审核"
                                                       aria-hidden="true"></span>
                                    </td>
                                    <td class="">
                                        <a href="${pageContext.request.contextPath}/ed/view?id=${ed.id}">查看</a>
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
                                        <a href="${pageContext.request.contextPath}/ed/checked?pageNum=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/checked?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/checked?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/checked?pageNum=${page.pages}"><span>尾页</span></a>
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
                                        <a href="${pageContext.request.contextPath}/ed/searchChecked?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/searchChecked?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/searchChecked?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/searchChecked?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pages}"><span>尾页</span></a>
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
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
        $('#date2').datetimepicker({
            format: 'YYYY-MM-DD',
            locale: moment.locale('zh-cn')
        });
    });
</script>