<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/pages_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:55:38 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>恒隆集团小程序登录</title>
    <meta name="keywords" content="HTML5 Bootstrap 3 Admin Template UI Theme"/>
    <meta name="description" content="AbsoluteAdmin - A Responsive HTML5 Admin UI Framework">
    <meta name="author" content="AbsoluteAdmin">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/skin/default_skin/css/theme.css">

    <!-- Admin Forms CSS -->
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath }/assets/admin-tools/admin-forms/css/admin-forms.css">

    <!-- Favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/assets/img/favicon.ico">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
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
                    <div class="panel-body bg-light p25 pb15">
                        <!-- Username Input -->
                        <div class="section">
                            <label for="username" class="field-label text-muted fs18 mb10">用户名</label>
                            <label for="username" class="field prepend-icon">
                                <input type="text" name="username" id="username" class="gui-input"
                                       placeholder="请输入用户名..." >
                                <label for="username" class="field-icon">
                                    <i class="fa fa-user"></i>
                                </label>
                            </label>
                        </div>
                        <!-- Password Input -->
                        <div class="section">
                            <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                            <label for="password" class="field prepend-icon">
                                <input type="password" name="password" id="password" class="gui-input"
                                       placeholder="请输入密码..." >
                                <label for="password" class="field-icon">
                                    <i class="fa fa-lock"></i>
                                </label>
                            </label>
                        </div>
                        <span id="msg" style="color: red">${msg}</span>
                    </div>
                    <div class="panel-footer clearfix">
                        <button type="button" id="register" class="button btn-primary mr10 pull-right">注册</button>
                        <button type="button" id="search_login"  onclick="login()" class="button btn-primary mr10 pull-right">登录</button>
                        <label class="switch ib switch-primary mt10">
                            <input type="checkbox" name="remember" id="remember" checked>
                            <label for="remember" data-on="是" data-off="否"></label>
                            <span>记住我</span>
                        </label>
                    </div>
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

<script type="text/javascript">
    $("#register").click(function () {
        $(window).attr('location', '${pageContext.request.contextPath }/to_register');
    });
    $("#username").click(function () {
        $("#msg").css({"display": "none"});
    });
    $("#password").click(function () {
        $("#msg").css({"display": "none"});
    });
    function login() {
       var username=$("#username").val();
       var password=$("#password").val();
       $.ajax({
           type: "post",
           url: "${pageContext.request.contextPath }/search_login",
           async: true,
           data: {
               'username': username,
               'password': password
           },
           dataType: "text",
           success: function(data){
               console.log(data);
               if(data=="OK"){
                   layer.msg("登录成功",{icon:1});
                   setTimeout(function () {
                       parent.layer.closeAll(); // 关闭layer
                   },1000);
               }else if(data=="NO_PWD") {
                   layer.msg("密码错误",{icon:2});
               }else if(data=="NO_USER"){
                   layer.msg("用户不存在",{icon:2});
               }
           }
       });
   }

</script>
</body>

</html>
