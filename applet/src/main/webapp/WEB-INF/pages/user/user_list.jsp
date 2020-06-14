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
                <h2>用户管理</h2>
                <p class="lead"></p>
            </div>
            <!-- message listing panel -->
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <form action="${pageContext.request.contextPath}/user/search" method="post">
                    <div class="section">
                        <div class="section row center-block">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="key" name="key"
                                               placeholder="输入姓名/用户名/工号搜索..." style="width:130%" >
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <div class="input-group">
                                        <select id="teamId" name="teamId" class="form-control" style="width:200%">
                                            <option value="" selected="selected">按部门搜索...</option>
                                            <c:forEach items="${teams}" var="team">
                                                <option value="${team.teamId}">${team.teamName}</option>
                                            </c:forEach>
                                        </select>
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
                                <th class="hidden-xs">工号</th>
                                <th class="hidden-xs">用户名</th>
                                <th class="hidden-xs">姓名</th>
                                <th class="hidden-xs">部门</th>
                                <th class="hidden-xs">角色</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${list}" var="user" varStatus="status">
                                <tr class="message-unread">
                                    <td class="text-left">${status.index+1}</td>
                                    <td class="">${user.userId}</td>
                                    <td class="">${user.username}</td>
                                    <td class="">${user.realName}</td>
                                    <td class="">${user.team}</td>
                                    <td class="">${user.role.nickName}</td>
                                    <td class="">
                                        <a class="btn btn-primary" onclick="confirm(${user.id})">删除</a>&nbsp;
                                        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/user/to_edit?id=${user.id}">编辑</a>
                                        <a type="button" class="btn btn-primary" href="${pageContext.request.contextPath}/user/to_editPwd?id=${user.id}">改密码</a>
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
                                <li><a href="${pageContext.request.contextPath}/user/list?pageNum=1"><span>首页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/list?pageNum=${page.pageNum-1}"><span>上一页</span></a>
                                </li>
                                <li>
                                    <a href="${pageContext.request.contextPath}/user/list?pageNum=${page.pageNum+1}"><span>下一页</span></a>
                                </li>
                                <li><a href="${pageContext.request.contextPath}/user/list?pageNum=${page.pages}"><span>尾页</span></a>
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
                                    <li><a href="${pageContext.request.contextPath}/user/search?pageNum=1&key=${key}&teamId=${teamId}"><span>首页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/search?pageNum=${page.pageNum-1}&key=${key}&teamId=${teamId}"><span>上一页</span></a>
                                    </li>
                                    <li>
                                        <a href="${pageContext.request.contextPath}/user/search?pageNum=${page.pageNum+1}&key=${key}&teamId=${teamId}"><span>下一页</span></a>
                                    </li>
                                    <li><a href="${pageContext.request.contextPath}/user/search?pageNum=${page.pages}&key=${key}&teamId=${teamId}"><span>尾页</span></a>
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
</div
<jsp:include page="../footer.jsp"/>
<script>
    function confirm(id) {
        layer.confirm('您确定要删除？', {
            btn: ['确定','取消'] //按钮
        }, function(){
            location.href="${pageContext.request.contextPath}/user/remove?id="+id
        }, function(){
            parent.layer.closeAll();
        });
    }
</script>