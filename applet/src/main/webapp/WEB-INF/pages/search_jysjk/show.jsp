<%@ page language="java"
         contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <title>研究院经验数据库</title>
    <link href="${pageContext.request.contextPath }/css/public_home.css" rel="stylesheet" type="text/css" />
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="showhead">
        <jsp:include page="head.jsp"/>
        <div class="showlogo">
            <div class="imglogo">
                <img src="${pageContext.request.contextPath}/images/logo1.png"/><img
                    src="${pageContext.request.contextPath}/images/wenzi.png"/>
            </div>
        </div>
    </div>
</nav>
<div class="show">
    <div class="showtitle">
        <h2>${ed.title}</h2>
        <br/>
        <p>录入人：${ed.entryPerson} &nbsp;
            录入时间：<fmt:formatDate value="${ed.entryDate}" pattern="YYYY-MM-dd HH:ss:mm"/></p>
    </div>
    <div class="showmatter">
        <div class="information">
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">基本信息</h2>
                </div>
                <table class="table">
                    <tr>
                        <th>产品类别：</th>
                        <td>${ed.productClass}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>产品型号：</th>
                        <td>${ed.productModel}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>失效模式：</th>
                        <td>${ed.failureMode}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>主凶件：</th>
                        <td>${ed.primePiece}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>主凶类别：</th>
                        <td>${ed.primeCategory}</td>
                    </tr>
                    <tr>
                        <th>问题输入：</th>
                        <td>${ed.problemInput}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>故障阶段：</th>
                        <td>${ed.positionPhase}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>故障地点：</th>
                        <td>${ed.positionFault}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>故障数量：</th>
                        <td>${ed.amount}&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <th>发生日期：</th>
                        <td>${ed.dateString}</td>
                        <td></td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">问题描述</h2>
                </div>
                <div class="panel-body">${ed.problemDescription}</div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">原因分析</h2>
                </div>
                <div class="panel-body">${ed.reasonAnalysis}</div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">临时改进措施</h2>
                </div>
                <div class="panel-body">
                        ${ed.temporaryImprovementMeasures}
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">正式改进措施</h2>
                </div>
                <div class="panel-body">
                        ${ed.formalImprovementMeasures}
                </div>
            </div>
            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h2 class="panel-title">经验总结</h2>
                </div>
                <div class="panel-body">
                        ${ed.summary}
                </div>
            </div>
    </div>
</div>
<jsp:include page="foot.jsp"/>
