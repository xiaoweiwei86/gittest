<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2><span style="color: #1c7393">${USER.realName}</span>您好，您正在添加角色！ </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw600 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/role/add"
                          method="post">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb20">
                                <span> 添加角色 </span>
                            </div>
                            <div class="section row ">
                                <div class="col-md-12">
                                    <label for="nickName" class="field-label text-muted fs18 mb10">角色名</label>
                                    <input type="text" name="nickName" id="nickName" class="gui-input"
                                           required="required"
                                           placeholder="请输入角色名...">
                                    </label>
                                </div>
                            </div>
                            <input type="hidden" id="id" name="id" value="${USER.id}">
                            <div class="panel-footer text-right">
                                <button type="submit" class="button">添加</button>
                                <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>