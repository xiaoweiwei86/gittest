<%@ page language="java" import="java.util.*,java.io.*,javax.servlet.*"
         contentType="text/html; charset=utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/public.css"/>
    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicon.ico">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
</head>
<body>
<ul>
    <li class="headli">
        <c:if test="${USER==null}">
         <a href="#" id="to_login" title="登录">登录</a>&nbsp;|
        </c:if>
        <c:if test="${USER!=null}">
            <div class="btn-group">
                <a  href data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        ${USER.realName} <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="${pageContext.request.contextPath}/user/self?id=${USER.id}" target="_blank">个人信息</a></li>
                    <li role="separator" class="divider"></li>
                    <li><a href="${pageContext.request.contextPath}/search_quit" >退出</a></li>
                </ul>
            </div>
            |
        </c:if>

        <a href="http://plm.chl.com.cn/Windchill" title="Windchill" target="_blank">WindChill</a>&nbsp;|
        <a href="http://oa.chl.com.cn" title="OA" target="_blank">OA办公</a>&nbsp;|
        <a href="${pageContext.request.contextPath}/to_login" title="app" target="_blank">应用中心</a>&nbsp;|
        <a href="${pageContext.request.contextPath}/search_home" title="经验数据库" target="_blank">经验数据库</a>&nbsp;|
        <a href="http://www.chl.com.cn" title="集团主页" target="_blank">集团主页</a>
    </li>
</ul>
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
<script type="text/javascript">
    $("#to_login").click(function () {
        layer.open({
            type: 2,
            title: '登录',
            shadeClose: true,
            shade: false,
            maxmin: true, //开启最大化最小化按钮
            area: ['600px', '560px'],
            content: '${pageContext.request.contextPath }/to_search_login/',
            end:function () {
                location.reload();
            }
        });
    });
</script>