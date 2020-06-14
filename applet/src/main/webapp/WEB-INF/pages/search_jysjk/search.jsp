<%@ page language="java" import="java.util.*,java.io.*,javax.servlet.*" contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>研究院经验数据库搜索</title>
    <link href="${pageContext.request.contextPath }/css/public_home.css" rel="stylesheet" type="text/css" />
</head>
<script>
    document.onkeydown = function (e) {
        var ev = document.all ? window.event : e;
        if (ev.keyCode == 13) {
            $('#search').click();
        }
    }
</script>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="hlhead">
        <jsp:include page="head.jsp"/>
        <div class="col-lg-5">
            <div class="input-group">
				 <span class="input-group-addon" id="search">
				 	<i class="glyphicon glyphicon-globe"></i>
					</span>
                <input class="form-control" type="text" id="keywords" name="keywords"
                       placeholder="请输入要搜索的关键字……" value="${keywords}"/>
                <span class="input-group-btn">
						<button id="search_btn" class="btn btn-default btn-primary" type="button">Go!</button>
					</span>
            </div>
        </div>
    </div>
</nav>
<div class="ssjg">
    <c:forEach items="${list}" var="ed">
        <li class="ssjgli">
            <a href="${pageContext.request.contextPath }/show/${ed.id}" target="_blank" title="点击查看详情">${ed.title}</a>
            <br/><br/>
            <p>产品类别：${ed.productClass}&nbsp;产品型号： ${ed.productModel}&nbsp; 主凶件： ${ed.primePiece} &nbsp;
                主凶类别： ${ed.primeCategory} </p>
            <p>失效模式：${ed.failureMode}&nbsp; 发生日期： ${ed.dateString}&nbsp; 录入人：${ed.entryPerson} &nbsp;
                录入时间：<fmt:formatDate value="${ed.entryDate}" pattern="YYYY-MM-dd HH:ss:mm"/></p>

        </li>
    </c:forEach>
</div>
<!--
<div class="ssjg_R">
<div style="float:left;width: 1px;height: 650px; margin-top: 28px; margin-right: 40px;background: #ccc;"></div>
<ul>
<li class="tjli">
<a href="#">推荐经验数据库 </a>
<p>PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否成品
</p>
</li>
<li class="tjli">
<a href="#">推荐经验数据库 </a>
<p>PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否成品
</p>
</li>
<li class="tjli">
<a href="#">推荐经验数据库 </a>
<p>PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否PLM系统，上传至今已3月有余，ERP编码在创建部件时就已生成。影响ERP编码生成的条件有以下几种，第一，选择是否成品
</p>
</li>
</ul>
</div>
-->
<div class="page">
    <span>共${page.total}条 &nbsp;&nbsp;每页${page.pageSize}条&nbsp;&nbsp;
         共${page.pages}页&nbsp;&nbsp;
            当前第${page.pageNum}页&nbsp;&nbsp;
        <a href="search?keywords=${keywords}&pageNum=${page.pageNum-1}">上一页</a>&nbsp;
        <a href="search?keywords=${keywords}&pageNum=${page.pageNum+1}">下一页</a>
    </span>
</div>
<jsp:include page="foot.jsp"/>
<script>
    $("#search_btn").click(function () {
        var keywords = $('#keywords').val().trim().replace(/\s/g, "");
        $(window).attr('location', '${pageContext.request.contextPath }/search?keywords=' + keywords);
    });
    $("#search").click(function () {
        var keywords = $('#keywords').val().trim().replace(/\s/g, "");
        $(window).attr('location', '${pageContext.request.contextPath }/search?keywords=' + keywords);
    });
</script>
