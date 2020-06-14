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
                <h2>${USER.team}资产</h2>
                <p class="lead">集团研究院资产信息</p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block">
                <form action="${pageContext.request.contextPath}/asset/search" method="post">
                    <div class="section">
                        <div class="section row center-block">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="keywords" name="keywords"
                                               placeholder="输入关键字搜索..." style="width:150%" value="${keywords}">
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <select type="text" name="categoryId" id="categoryId" class="form-control"
                                            style="width:90%">
                                        <option value="" selected="selected">请选择类型搜索...</option>
                                        <c:forEach var="category" items="${category}">
                                            <option value="${category.id}"
                                                    <c:if test="${category.id==categoryId}"> selected="selected" </c:if> > ${category.name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <input type="hidden" name="flag" value="1"/>
                            <div class="col-md-1">
                                <div class='input-group'>
                                    <button type="submit" class="btn btn-default btn-lg" id="search">
                                        <span class="glyphicon glyphicon-search"></span> Go！
                                    </button>
                                </div>
                            </div>
                           <%-- <div class="col-md-1">
                                <div class='input-group'>
                                    <button type="button" class="btn btn-default btn-lg" id="excel" title="点击导出Excel">
                                        <span class="glyphicon glyphicon-download-alt"></span> 导出
                                    </button>
                                </div>
                            </div>--%>
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
                                <th class="hidden-xs">编号</th>
                                <th class="hidden-xs">类型</th>
                                <th class="hidden-xs">型号</th>
                                <th class="hidden-xs">使用人</th>
                                <th class="hidden-xs">启用年月</th>
                                <th class="hidden-xs">使用部门</th>
                                <th class="hidden-xs">管理状态</th>
                                <th class="hidden-xs">质量情况</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="asset" varStatus="status">
                                <tr class="message-unread">
                                    <td class="">${status.index+1}</td>
                                    <td class="">${asset.number}</td>
                                    <td class="">${asset.categoryAsset.name}</td>
                                    <td class="">${asset.model}</td>
                                    <td class="">${asset.custodian}</td>
                                    <td class="">${asset.startUsingDate}</td>
                                    <td class="">${asset.usingTeam}</td>
                                    <td class="">${asset.controlledState}</td>
                                    <td class="">${asset.qualitySituation}</td>
                                    <td class=""><a class="btn btn-primary" onclick="show(${asset.id},'${asset.name}')">查看</a>&nbsp;
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/asset/to_edit?id=${asset.id}">修改</a>&nbsp;
                                        <%--<a class="btn btn-primary" onclick="confirm(${asset.id})">删除</a>&nbsp;--%>
                                        <a class="btn btn-primary" href="${pageContext.request.contextPath}/handover_order/to_add_by_asset?assetId=${asset.id}">交接</a>
                                        <a class="btn btn-primary" onclick="showChange(${asset.id})">查交接</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${isSearch!=1}">
                        <nav aria-label="Page navigation">
                            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                <!-- Pager -->
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/team_list/?pageNum=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/team_list?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/team_list?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/team_list?pageNum=${page.pages}"><span>尾页</span></a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </c:if>
                    <c:if test="${isSearch==1}">
                        <nav aria-label="Page navigation">
                            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                <!-- Pager -->
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/search?pageNum=1&keywords=${keywords}&categoryId=${categoryId}&flag=1"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/search?pageNum=${page.pageNum-1}&keywords=${keywords}&categoryId=${categoryId}&flag=1"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/search?pageNum=${page.pageNum+1}&keywords=${keywords}&categoryId=${categoryId}&flag=1"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/asset/search?pageNum=${page.pages}&keywords=${keywords}&categoryId=${categoryId}&flag=1"><span>尾页</span></a>
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
        var realName = $("#realName").val();
        var startTime = $("#startTime").val();
        var endTime = $("#endTime").val();
        window.location.href = "${pageContext.request.contextPath}/dailySearch?realName=" + realName + "&startTime=" + startTime + "&endTime=" + endTime;
    });

    function show(id,name) {
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

    function showChange(id) {
        layer.open({
            type: 2,
            title: name,
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['1000px', '650px'],
            content: '${pageContext.request.contextPath}/handover_order/find_asset_id?assetId=' + id
        });
    }

    function confirm(id) {
        layer.confirm('您确定要删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href="${pageContext.request.contextPath}/asset/remove?id="+id
        }, function(){
            parent.layer.closeAll();
        });
    }
</script>