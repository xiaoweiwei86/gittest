<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme"/>
<meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
<meta name="author" content="AbsoluteAdmin">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/skin/default_skin/css/theme.css">

<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/css/bootstrap-datetimepicker.min.css">

<!-- Admin Forms CSS -->
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath }/assets/admin-tools/admin-forms/css/admin-forms.css">

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css">
<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicon.ico">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
<script src="${pageContext.request.contextPath }/js/html5shiv.js"></script>
<script src="${pageContext.request.contextPath }/js/respond.min.js"></script>
<![endif]-->
</head>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 查看日志 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw800 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> <fmt:formatDate value="${daily.createTime}" pattern="yyyy-MM-dd"/> ${daily.user.realName}的工作日志</span>
                            </div>
                            <div class="form-group">
                                <label for="items" class="field-label text fs15 mb10">工作事项</label>
                                <textarea id="items" name="items" class="form-control" rows="10" disabled="disabled" style="resize:none">${daily.items}</textarea>
                            </div>
                            <div class="form-group">
                                <label for="performance" class="field-label text fs15 mb10">完成情况</label>
                                <textarea id="performance" name="performance" class="form-control" rows="10" disabled="disabled" style="resize:none">${daily.performance}</textarea>
                            </div>
                            <div class="panel-footer text-right">
                                <a type="button" class="button" onclick="javascript:parent.layer.closeAll();">返回</a>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>