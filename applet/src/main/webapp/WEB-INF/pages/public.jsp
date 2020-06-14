<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<!-- Mirrored from admindesigns.com/demos/absolute/1.1/admin_forms-validation.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:56:15 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>恒隆研究院应用中心</title>
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

<body class="admin-validation-page" data-spy="scroll" data-target="#nav-spy" data-offset="200">

<!-- Start: Main -->
<div id="main">

    <!-- Start: Header -->
    <header class="navbar navbar-fixed-top navbar-shadow">
        <div class="navbar-branding">
            <a class="navbar-brand" href="#">
                <b>研究院应用中心</b>
            </a>
            <span id="toggle_sidemenu_l" class="ad ad-lines"></span>
        </div>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown menu-merge">
                <a href="" class="dropdown-toggle fw600 p15" data-toggle="dropdown">
                    <c:if test="${USER.userImg!=null}">
                        <img src="${USER.userImg}" alt="avatar" class="mw30 br64">
                    </c:if>
                    <c:if test="${USER.userImg==null}">
                        <img src="${pageContext.request.contextPath }/assets/img/avatars/5.jpg" alt="avatar"
                             class="mw30 br64">
                    </c:if>
                    <span class="hidden-xs pl15"></span>
                    <span class="caret caret-tp hidden-xs"></span>
                </a>
                <ul class="dropdown-menu list-group dropdown-persist w250" role="menu">
                    <li class="list-group-item">
                        <a href="${pageContext.request.contextPath }/user/self?id=${USER.id}"
                           class="animated animated-short fadeInUp">
                            <span class="fa fa-user"></span> 个人信息
                            <span class="label label-warning"></span>
                        </a>
                    </li>
                    <li class="list-group-item">
                        <a href="${pageContext.request.contextPath }/user/to_editPwd?id=${USER.id}"
                           class="animated animated-short fadeInUp">
                            <span class="fa fa-gear"></span> 设置密码 </a>
                    </li>
                    <li class="dropdown-footer">
                        <a href="${pageContext.request.contextPath }/quit" class="">
                            <span class="fa fa-power-off pr5"></span> 退出 </a>
                    </li>
                </ul>
            </li>
        </ul>
    </header>
    <!-- End: Header -->

    <!-- Start: Sidebar -->
    <aside id="sidebar_left" class="nano nano-light affix">

        <!-- Start: Sidebar Left Content -->
        <div class="sidebar-left-content nano-content">

            <!-- Start: Sidebar Header -->
            <header class="sidebar-header">

                <!-- Sidebar Widget - Author -->
                <div class="sidebar-widget author-widget">
                    <div class="media">
                        <a class="media-left" href="${pageContext.request.contextPath }/user/self?id=${USER.id}">
                            <c:if test="${USER.userImg!=null}">
                                <img src="${USER.userImg}" alt="avatar" class="mw30 br64">
                            </c:if>
                            <c:if test="${USER.userImg==null}">
                                <img src="${pageContext.request.contextPath }/assets/img/avatars/5.jpg" alt="avatar"
                                     class="mw30 br64">
                            </c:if>
                        </a>
                        <div class="media-body">
                            <div class="media-author">${USER.realName}</div>
                            <div class="media-links">
                                <a href="${pageContext.request.contextPath }/quit">退出</a>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Sidebar Widget - Search (hidden) -->
                <div class="sidebar-widget search-widget hidden">
                    <div class="input-group">
              <span class="input-group-addon">
                <i class="fa fa-search"></i>
              </span>
                        <input type="text" id="sidebar-search" class="form-control" placeholder="Search..."/>
                    </div>
                </div>

            </header>
            <!-- End: Sidebar Header -->

            <!-- Start: Sidebar Menu -->
            <ul class="nav sidebar-menu">
                <c:if test="${USER.roleId==1}">
                    <li class="sidebar-label pt20">用户及角色管理</li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/user/list">
                            <span class="glyphicon glyphicon-th-list"></span>
                            <span class="sidebar-title">用户列表</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/role/to_add">
                            <span class="glyphicon glyphicon-user"></span>
                            <span class="sidebar-title">添加角色</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/role/list">
                            <span class="glyphicon glyphicon-list-alt"></span>
                            <span class="sidebar-title">角色列表</span>
                        </a>
                    </li>
                </c:if>
                <%--<li class="active">
                    <a href="${pageContext.request.contextPath }/user/self?id=${USER.id}">
                        <span class="glyphicon glyphicon-user"></span>
                        <span class="sidebar-title">个人信息</span>
                    </a>
                </li>--%>
                <li class="sidebar-label pt20">日常管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/user/to_edit?id=${USER.id}">
                        <span class="glyphicon glyphicon-wrench"></span>
                        <span class="sidebar-title">修改信息</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/user/to_editPwd?id=${USER.id}">
                        <span class="glyphicon glyphicon-lock"></span>
                        <span class="sidebar-title">修改密码</span>
                    </a>
                </li>
                <li class="sidebar-label pt20">日志管理</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/daily/to_add">
                        <span class="glyphicon glyphicon-pencil"></span>
                        <span class="sidebar-title">写日志</span>
                    </a>
                </li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/daily/myself">
                        <span class="glyphicon glyphicon-eye-open"></span>
                        <span class="sidebar-title">看日志</span>
                    </a>
                </li>
                <c:if test="${USER.roleId==1||USER.roleId==4}">
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/daily/list">
                            <span class="glyphicon glyphicon-list"></span>
                            <span class="sidebar-title">查日志</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER.role.nickName=='资产管理员'}">
                    <li class="sidebar-label pt20">资产管理</li>
                    <li>
                        <a href="${pageContext.request.contextPath }/asset/to_add">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span class="sidebar-title">新建</span>
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-primary">New</span>
                        </span>
                        </a>
                    </li>

                    <li class="active">
                        <a href="${pageContext.request.contextPath }/asset/team_list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">部门资产</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/to_add">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">新建交接单</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/team_list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">部门交接单</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/myself_list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">我的交接单</span>
                        </a>
                    </li>
                </c:if>

                <c:if test="${USER.role.nickName=='部长'}">
                    <li class="sidebar-label pt20">资产管理</li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/asset/team_list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">部门资产</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/team_list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">部门交接单</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/checking_list">
                            <span class="glyphicon glyphicon-check"></span>
                            <span class="sidebar-title">待审核交接单</span>
                            <c:if test="${NUM!=0}">
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-danger"></span>
                            </span>
                            </c:if>
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER.role.nickName=='超级管理员'||USER.realName=='刘璋'}">
                    <li class="sidebar-label pt20">资产管理</li>
                    <li>
                        <a href="${pageContext.request.contextPath }/asset/to_add">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span class="sidebar-title">新建</span>
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-primary">New</span>
                        </span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/asset/list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">资产总表</span>
                        </a>
                    </li>

                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/to_add">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">新建交接单</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/myself_list?userId=${USER.id}">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">我的交接单</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/list">
                            <span class="glyphicon glyphicon-tasks"></span>
                            <span class="sidebar-title">交接单总表</span>
                        </a>
                    </li>

                    <li class="active">
                        <a href="${pageContext.request.contextPath }/handover_order/checking_list">
                            <span class="glyphicon glyphicon-check"></span>
                            <span class="sidebar-title">待审核交接单</span>
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-danger"></span>
                            </span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/category/to_add">
                            <span class="glyphicon glyphicon-tags"></span>
                            <span class="sidebar-title">添加分类</span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/category/list">
                            <span class="glyphicon glyphicon-th-list"></span>
                            <span class="sidebar-title">查看分类</span>
                        </a>
                    </li>
                </c:if>

                <li class="sidebar-label pt20">计算程序</li>
                <li class="active">
                    <a href="${pageContext.request.contextPath }/cal/to_dimension_chain">
                        <span class="glyphicon glyphicon-calendar"></span>
                        <span class="sidebar-title">尺寸链</span>
                    </a>
                </li>
                <c:if test="${USER.roleId!=2}">
                    <li class="sidebar-label pt20">经验数据库管理</li>
                </c:if>
                <c:if test="${USER.roleId==3||USER.roleId==1}">
                    <li>
                        <a href="${pageContext.request.contextPath }/ed/to_add">
                            <span class="glyphicon glyphicon-plus"></span>
                            <span class="sidebar-title">新建</span>
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-primary">New</span>
                        </span>
                        </a>
                    </li>
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/ed/myself?userId=${USER.id}">
                            <span class="glyphicon glyphicon-book"></span>
                            <span class="sidebar-title">我的</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER.roleId==1}">
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/ed/list">
                            <span class="glyphicon glyphicon-th-list"></span>
                            <span class="sidebar-title">全部</span>
                        </a>
                    </li>
                </c:if>
                <c:if test="${USER.roleId==1||USER.roleId==4}">
                    <li class="active">
                        <a href="${pageContext.request.contextPath }/ed/nocheck">
                            <span class="glyphicon glyphicon-check"></span>
                            <span class="sidebar-title">待审核</span>
                            <c:if test="${NUM!=0}">
                            <span class="sidebar-title-tray">
                            <span class="label label-xs bg-danger">${NUM}</span>
                            </span>
                            </c:if>
                        </a>
                    </li>
                    <li class="active">
                        <a class="avatar pull-left"
                           href="${pageContext.request.contextPath }/ed/checked">
                            <span class="glyphicon glyphicon-ok"></span>
                            <span class="sidebar-title">已审核</span>
                        </a>
                    </li>
                </c:if>
            </ul>
            <!-- End: Sidebar Menu -->

            <!-- Start: Sidebar Collapse Button -->
            <div class="sidebar-toggle-mini">
                <a href="#">
                    <span class="fa fa-sign-out"></span>
                </a>
            </div>
            <!-- End: Sidebar Collapse Button -->
        </div>
        <!-- End: Sidebar Left Content -->
    </aside>