<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 日志 </h2>
                <p class="lead" style="margin-top: 20px">
                    <span style="color: #1c7393">${USER.realName}</span>您好，您正在修改日志！
                </p>
            </div>
            <div class="admin-form theme-primary mw800 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/daily/edit"
                          method="post">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 日志内容 </span>
                            </div>
                            <div class="form-group">
                                <label for="items" class="field-label text fs15 mb10">工作事项</label>
                                <textarea id="items" name="items" class="form-control"  style="resize:none" rows="10">${daily.items}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="performance" class="field-label text fs15 mb10">完成情况</label>
                                <textarea id="performance" name="performance" class="form-control"  style="resize:none"  rows="10">${daily.performance}</textarea>
                            </div>
                            <input type="hidden" name="id" value="${daily.id}"/>
                            <div class="panel-footer text-right">
                                <button type="submit" class="button">提交</button>
                                <button type="button" class="button" onclick="javascript:history.go(-1)">返回</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>