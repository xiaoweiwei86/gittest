<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/pages_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:55:38 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>恒隆集团小程序登录</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme" />
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/skin/default_skin/css/theme.css">

    <!-- Admin Forms CSS -->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/assets/admin-tools/admin-forms/css/admin-forms.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicon.ico">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <script src="${pageContext.request.contextPath }/js/html5shiv.js"></script>
    <script src="${pageContext.request.contextPath }/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="external-page external-alt sb-l-c sb-r-c">

<!-- Start: Main -->
<div id="main" class="animated fadeIn">

    <!-- Start: Content-Wrapper -->
    <section id="content_wrapper">

        <!-- Begin: Content -->
        <section id="content">

            <div class="admin-form theme-info mw500" id="login">

                <!-- Login Logo -->
                <div class="content-header">
                    <h1>研究院小程序</h1>
                    <p class="lead">欢迎使用恒隆集团小程序管理系统</p>
                </div>
                <!-- Login Panel/Form -->
                <div class="panel mt30 mb25">
                    <form method="post" action="${pageContext.request.contextPath }/login" id="contact">
                        <div class="panel-body bg-light p25 pb15">


                            <!-- Username Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">用户名</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" class="gui-input" placeholder="请输入用户名..." value="${username}">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                            <!-- Password Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input" placeholder="请输入密码..." value="${password}">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <span id="msg" style="color: red">${msg}</span>
                            <input id="edId"  type="hidden" name="edId" value="${edId}"/>
                        </div>
                        <div class="panel-footer clearfix">
                            <button type="button" id="register" class="button btn-primary mr10 pull-right">注册</button>
                            <button type="submit" class="button btn-primary mr10 pull-right">登录</button>
                            <label class="switch ib switch-primary mt10">
                                <input type="checkbox" name="remember" id="remember" checked>
                                <label for="remember" data-on="是" data-off="否"></label>
                                <span>记住我</span>
                            </label>
                        </div>
                    </form>
                </div>

            </div>

        </section>
        <!-- End: Content -->

    </section>
    <!-- End: Content-Wrapper -->

</div>
<!-- End: Main -->


<!-- BEGIN: PAGE SCRIPTS -->

<!-- jQuery -->
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath }/vendor/jquery/jquery_ui/jquery-ui.min.js"></script>
<!--layer js-->
<script src="${pageContext.request.contextPath }/layer/layer.js"></script>
<!-- Theme Javascript -->
<script src="${pageContext.request.contextPath }/assets/js/utility/utility.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/demo/demo.js"></script>
<script src="${pageContext.request.contextPath }/assets/js/main.js"></script>

<!-- END: PAGE SCRIPTS -->
<script type="text/javascript">
    var edId=$("#edId").val();
    if(edId!=0){
        layer.msg("请完成身份验证",{icon:5})
    }

    $("#register").click(function () {
        $(window).attr('location', 'to_register');
    });
    $("#username").click(function () {
        $("#msg").css({"display":"none"});
    });
    $("#password").click(function () {
        $("#msg").css({"display":"none"});
    });
</script>
</body>

</html>
