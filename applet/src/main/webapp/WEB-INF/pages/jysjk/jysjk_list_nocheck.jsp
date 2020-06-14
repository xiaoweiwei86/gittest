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
                <h2>待审核</h2>
                <p class="lead"></p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block" style="padding-bottom: 175px;">

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
                                <c:if test="${ed.audit!=0}">
                                    <tr class="message-unread">
                                        <td class="text-left">${status.index+1}</td>
                                        <td class="">${ed.title}</td>
                                        <td class="">${ed.productClass}</td>
                                        <td class="">${ed.productModel}</td>
                                        <td class="">${ed.primePiece}</td>
                                        <td class="">${ed.entryPerson}</td>
                                        <td class=""><fmt:formatDate value="${ed.entryDate}"
                                                                     pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                        <c:if test="${ed.audit==1}">
                                            <td class=""><span class="glyphicon glyphicon-ok" title="已审核"
                                                               aria-hidden="true"></span>
                                            </td>
                                            <td class="">
                                                <a href="${pageContext.request.contextPath}/ed/view?id=${ed.id}">查看</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${ed.audit==2}">
                                            <td class=""><span class="glyphicon glyphicon-time" title="审核中"
                                                               aria-hidden="true"></span>
                                            </td>
                                            <td class="">
                                                <a href="${pageContext.request.contextPath}/ed/to_check?id=${ed.id}">审核</a>
                                            </td>
                                        </c:if>
                                        <c:if test="${ed.audit==3}">
                                            <td class=""><span class="glyphicon glyphicon-question-sign" title="被驳回"
                                                               aria-hidden="true"></span>
                                            </td>
                                            <td class="">
                                                <a href="${pageContext.request.contextPath}/ed/view?id=${ed.id}">查看</a>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:if>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <nav aria-label="Page navigation">
                        <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                            <!-- Pager -->
                            <ul class="pagination">
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/nocheck?pageNum=1&teamId=${USER.teamId}"><span>首页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/nocheck?pageNum=${page.pageNum-1}&teamId=${USER.teamId}"><span>上一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/nocheck?pageNum=${page.pageNum+1}&teamId=${USER.teamId}"><span>下一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/nocheck?pageNum=${page.pages}&teamId=${USER.teamId}"><span>尾页</span></a>
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