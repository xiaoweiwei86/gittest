<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2><span style="color: #1c7393">${USER.realName}</span>您好，您正在添加资产分类！ </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw600 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/category/add"
                          method="post">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb20">
                                <span> 添加资产分类 </span>
                            </div>
                            <div class="section row ">
                                <div class="col-md-12">
                                    <label for="name" class="field-label text-muted fs18 mb10">分类名称</label>
                                    <input type="text" name="name" id="name" class="form-control" required="required"
                                           placeholder="请输入分类名...">
                                </div>
                            </div>
                            <div class="section row ">
                                <div class="col-md-12">
                                    <label for="type" class="field-label text-muted fs18 mb10">分类类型</label>
                                    <select class="form-control" name="type" id="type">
                                        <option value="固定资产">固定资产</option>
                                        <option value="生产物料">生产物料</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer text-right">
                            <button type="submit" class="button">添加</button>
                            <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>