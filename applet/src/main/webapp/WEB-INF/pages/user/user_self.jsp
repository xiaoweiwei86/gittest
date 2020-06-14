<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> <span style="color: #1c7393">${user.realName}</span>的个人信息 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw600 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 基本信息 </span>
                            </div>
                            <div class="section row ">
                                <div class="col-md-3 center-block">&nbsp;&nbsp;
                                    <img src="${user.userImg}"
                                         class="img-circle img-thumbnail" style="width:100px;height:100px"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="username" class="field-label text-muted fs15 mb10">用户名</label>
                                        <input id="username" name="username" class="gui-input" placeholder="用户名..." type="text"
                                               value="${user.username}" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="userId" class="field-label text-muted fs15 mb10">工号</label>
                                        <input id="userId" name="userId" class="gui-input" placeholder="工号..."
                                                type="text" value="${user.userId}" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="realName" class="field-label text-muted fs15 mb10">姓名</label>
                                        <input id="realName" name="realName" class="gui-input" placeholder="姓名..." type="text"
                                               value="${user.realName}" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="phone" class="field-label text-muted fs15 mb10">电话</label>
                                        <input id="phone" name="phone" class="gui-input" placeholder="电话..." type="text"
                                               value="${user.phone}" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="email" class="field-label text-muted fs15 mb10">邮箱</label>
                                    <input id="email" name="email" class="gui-input" placeholder="邮箱..." type="text"
                                           value="${user.email}"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="team" class="field-label text-muted fs15 mb10">所属部门</label>
                                        <input id="team" name="team" class="gui-input" type="text"
                                               value="${user.team}" readonly="readonly"/>
                                </div>
                            </div>
                            <input type="hidden" name="id" value="${user.id}">
                            <div class="panel-footer text-right">
                                <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>