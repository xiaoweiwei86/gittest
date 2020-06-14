<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>


<!-- Mirrored from admindesigns.com/demos/absolute/1.1/pages_login.html by HTTrack Website Copier/3.x [XR&CO'2014], Thu, 06 Aug 2015 02:55:38 GMT -->
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>恒隆集团小程序用户注册</title>
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

                    <form method="post" action="${pageContext.request.contextPath }/register" id="contact" onsubmit="return register()">
                        <div class="panel-body bg-light p25 pb15">
                            <label class="switch ib switch-primary mt10">
                                <span style="color: red" id="msg">${msg}</span>
                            </label>
                            <!-- Username Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">用户名</label>
                                <label for="username" class="field prepend-icon">
                                    <input type="text" name="username" id="username" class="gui-input" required placeholder="请输入用户名...">
                                    <label for="username" class="field-icon">
                                        <i class="fa fa-user"></i>
                                    </label>
                                </label>
                            </div>

                            <!-- Password Input -->
                            <div class="section">
                                <label for="username" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password" class="field prepend-icon">
                                    <input type="password" name="password" id="password" class="gui-input" required placeholder="请输入密码...">
                                    <label for="password" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <!-- Password Input -->
                            <div class="section">
                                <label for="password1" class="field-label text-muted fs18 mb10">密码</label>
                                <label for="password1" class="field prepend-icon">
                                    <input type="password" name="password1" id="password1" class="gui-input" required placeholder="请确认密码...">
                                    <label for="password1" class="field-icon">
                                        <i class="fa fa-lock"></i>
                                    </label>
                                </label>
                            </div>
                            <!-- 工号 Input -->
                            <div class="section">
                                <label for="userId" class="field-label text-muted fs18 mb10">工号</label>
                                <label for="userId" class="field prepend-icon">
                                    <input type="text" name="userId" id="userId" class="gui-input" required placeholder="请输入工号...">
                                    <label for="userId" class="field-icon">
                                        <i class="glyphicon glyphicon-asterisk"></i>
                                    </label>
                                </label>
                            </div>
                            <!-- 部门 Input -->
                            <div class="section">
                                <label for="teamId" class="field-label text-muted fs18 mb10">部门</label>
                                <label for="teamId" class="field prepend-icon">
                                    <select id="teamId" name="teamId" class="form-control" required>
                                        <c:forEach items="${teams}" var="team" >
                                            <option value="${team.teamId}">${team.teamName}</option>
                                        </c:forEach>
                                    </select>
                                </label>
                            </div>
                            <!-- realName Input -->
                            <div class="section">
                                <label for="realName" class="field-label text-muted fs18 mb10">姓名</label>
                                <label for="realName" class="field prepend-icon">
                                    <input type="text" name="realName" id="realName" class="gui-input" required placeholder="请输入真实姓名...">
                                    <label for="realName" class="field-icon">
                                        <i class="glyphicon glyphicon-user"></i>
                                    </label>
                                </label>
                            </div>

                            <div class="section">
                                <label for="email" class="field-label text-muted fs18 mb10">邮箱</label>
                                <label for="email" class="field prepend-icon">
                                    <input type="text" name="email" id="email" required class="gui-input" placeholder="请输入邮箱地址...">
                                    <label for="email" class="field-icon">
                                        <i class="glyphicon glyphicon-envelope"></i>
                                    </label>
                                </label>
                            </div>

                            <div class="section">
                                <label for="phone" class="field-label text-muted fs18 mb10">手机</label>
                                <label for="phone" class="field prepend-icon">
                                    <input type="text" name="phone" id="phone" class="gui-input" placeholder="请输入手机号码...">
                                    <label for="phone" class="field-icon">
                                        <i class="glyphicon glyphicon-phone"></i>
                                    </label>
                                </label>
                            </div>
                        </div>

                        <div class="panel-footer clearfix">
                            <button type="submit" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" >注册</button>
                            <button type="button" class="btn btn-block btn-primary btn-lg font-weight-medium auth-form-btn" onclick="javascript:history.back(-1);">返回</button>
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
    var isUsername;
    var isPassword;
    function  checkUser(user){
        $.ajax({
            "type"    :   "post",
            "url"     :   "isUsername",
            "data"    :   {"username":user},
            "dataType":   "json",
            "success" : function (flag) {
                if(flag==1){
                    isUsername=1;
                }else if(flag==0){
                    isUsername=0;
                }
            }
        });
    }

    $("#username").blur(function () {
        checkUser($("#username").val());
        if(isUsername==1){
            layer.msg("用户已存在...",{icon:2});
        }
    });

    $("#userId").blur(function () {
        checkUser($("#userId").val());
        if(isUsername==1){
            layer.msg("工号已存在...",{icon:2});
        }
    });
    function checkPWD () {
        var password=$("#password").val();
        var password1=$("#password1").val();
        if(password!=password1){
            layer.msg("两次输入密码不一致...",{icon:2});
            isPassword=1;
        }else {
            isPassword=0;
        }
    }
    $("#password1").blur(function(){
        checkPWD();
    });

   function register() {
       if(isUsername==1){
           layer.msg("用户名已存在...",{icon:2});
           return false;
       }
       if(isPassword==1){
           layer.msg("两次输入密码不一致...",{icon:2})
           return false;
       }
    }

</script>
</body>

</html>
