<%@ page import="com.chl.applet.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    User user = (User) request.getSession().getAttribute("USER");
    Integer num =(Integer) request.getSession().getAttribute("NUM");
%>
<jsp:include page="../public.jsp"/>

<section id="content_wrapper">
    <!-- Begin: Content -->
    <section id="content" class="table-layout animated fadeIn">
        <!-- begin: .tray-center -->
        <div class="tray tray-center">

            <!-- Begin: Content Header -->
            <div class="content-header">
                <h2>我的经验数据库</h2>
                <p class="lead"></p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1200 center-block" style="padding-bottom: 175px;">
                <form action="${pageContext.request.contextPath}/ed/search" method="post">
                    <div class="section">
                        <div class="section row center-block">
                            <div class="col-md-3">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="keywords" name="keywords"
                                           placeholder="输入关键字搜索..." style="width:140%" value="${keywords}">
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
                            <input type="hidden" name="flag" value="1"/>
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
                                    <td class=""><fmt:formatDate value="${ed.entryDate}"
                                                                 pattern="YYYY-MM-dd HH:mm:ss"/></td>
                                    <c:if test="${ed.audit==1}">
                                        <td class="">
                                            <span class="glyphicon glyphicon-ok" title="已审核" aria-hidden="true"></span>
                                        </td>
                                        <td class="">
                                            <a href="${pageContext.request.contextPath}/ed/view?id=${ed.id}">查看</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${ed.audit==0}">
                                        <td class="">
                                            <span class="glyphicon glyphicon-check" title="待审核" aria-hidden="true">
                                            </span>
                                        </td>
                                        <td class="">
                                            <a href="${pageContext.request.contextPath}/ed/delete?id=${ed.id}&pageNum=${page.pageNum}"
                                               onclick="return confirm('确定删除吗？')">删除</a>&nbsp;
                                            <a href="${pageContext.request.contextPath}/ed/to_edit?id=${ed.id}">编辑</a>&nbsp;
                                           <a  href="#" onclick="sendCheck(${ed.id})">提交审核</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${ed.audit==2}">
                                        <td class="">
                                            <span class="glyphicon glyphicon-time" title="审核中" aria-hidden="true"></span>
                                        </td>
                                        <td class="">
                                            <a href="${pageContext.request.contextPath}/ed/view?id=${ed.id}">查看</a>
                                        </td>
                                    </c:if>
                                    <c:if test="${ed.audit==3}">
                                        <td class="">
                                            <span class="glyphicon glyphicon-question-sign" title="被驳回" aria-hidden="true"></span>
                                        </td>
                                        <td class="">
                                            <a href="${pageContext.request.contextPath}/ed/delete?id=${ed.id}&pageNum=${page.pageNum}"
                                               onclick="return confirm('确定删除吗？')">删除</a>
                                            <a href="${pageContext.request.contextPath}/ed/to_edit?id=${ed.id}">编辑</a>
                                        </td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <c:if test="${isSearch==1}">
                        <nav aria-label="Page navigation">
                            <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                                <!-- Pager -->
                                <ul class="pagination">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/search?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=1&userId=${USER.id}&flag=${flag}"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/search?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pageNum-1}&userId=${USER.id}&flag=${flag}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/search?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pageNum+1}&userId=${USER.id}&flag=${flag}"><span>下一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/ed/search?keywords=${keywords}&startTime=${startTime}&endTime=${endTime}&pageNum=${page.pages}&userId=${USER.id}&flag=${flag}"><span>尾页</span></a>
                                    </li>
                                </ul>
                            </div>
                        </nav>
                    </c:if>
                <c:if test="${isSearch!=1}">
                    <nav aria-label="Page navigation">
                        <div class="panel-footer text-right remove-padding-horizontal pager-footer">
                            <!-- Pager -->
                            <ul class="pagination">
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/myself?pageNum=1&userId=${USER.id}"><span>首页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/myself?pageNum=${page.pageNum-1}&userId=${USER.id}"><span>上一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/myself?pageNum=${page.pageNum+1}&userId=${USER.id}"><span>下一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/ed/myself?pageNum=${page.pages}&userId=${USER.id}"><span>尾页</span></a>
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
    function sendCheck(edId) {
        layer.msg("后台正在努力发送邮件中,请勿重复点击！",{icon:6});
        var userId = <%=user.getId()%>;
        $.ajax({
            type: "post",//type：请求的类型
            url: "${pageContext.request.contextPath}/ed/sendCheck",//url：请求的路径
            async: true,//是否自动提交
            data: {
                'userId': userId,
                'edId': edId
            },
            dataType: "text",	//数据类型
            success: function () {
                window.location.reload();
                },
            error:function () {
                window.location.reload();
            }
        });

    }
</script>