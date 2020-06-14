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
                <h2>分类列表</h2>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw600 center-block">
                <div class="panel  heading-border">
                    <!-- message listings table -->
                    <div class="panel-body pn">
                        <table id="message-table" class="table table-striped table-hover">
                            <thead>
                            <tr class="">
                                <th class="hidden-xs">序号</th>
                                <th class="hidden-xs">分类名称</th>
                                <th class="hidden-xs">分类类型</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="category" varStatus="status">
                                <tr class="message-unread">
                                    <td class="">
                                            ${status.index+1}
                                    </td>
                                    <td class="">${category.name}</td>
                                    <td class="">${category.type}</td>
                                    <td class="">
                                        <a  class="btn btn-primary" href="${pageContext.request.contextPath}/category/to_edit?id=${category.id}">修改</a>&nbsp;
                                        <a class="btn btn-primary" onclick="confirm(${category.id})"> 删除</a>&nbsp;
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation">
                        <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                            <!-- Pager -->
                            <ul class="pagination">
                                <li>
                                    <a href="${pageContext.request.contextPath}/role/list?pageNum=1"><span>首页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/role/list?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/role/list?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/role/list?pageNum=${page.pages}"><span>尾页</span></a>
                                </li>
                            </ul>
                        </div>
                    </nav>
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
    function confirm(id) {
        layer.confirm('您确定要删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href="${pageContext.request.contextPath}/category/remove?id="+id
        }, function(){
            parent.layer.closeAll();
        });
    }
</script>