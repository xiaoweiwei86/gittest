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
                <h2>角色信息</h2>
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
                                <th class="hidden-xs">姓名</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${roles}" var="role" varStatus="status">
                                <tr class="message-unread">
                                    <td class="">
                                            ${status.index+1}
                                    </td>
                                    <td class="">${role.nickName}</td>
                                    <td class="">
                                        <a href="${pageContext.request.contextPath}/role/to_edit?id=${role.id}">修改</a>&nbsp;
                                        <a href="${pageContext.request.contextPath}/role/remove?id=${role.id}">删除</a>&nbsp;
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
