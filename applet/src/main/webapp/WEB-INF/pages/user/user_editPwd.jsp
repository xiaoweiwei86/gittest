<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <c:if test="${admin==null}">
                <h2><span style="color: #1c7393">${user.realName}</span>您好，您正在修改您的密码！ </h2>
                </c:if>
                <c:if test="${admin!=null}">
                    <h2>您正在修改<span style="color: #1c7393">${user.realName}</span>的密码！ </h2>
                </c:if>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw600 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/user/editPwd"
                          method="post" onsubmit="return checkData()">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb20">
                                <span> 修改密码 </span>
                            </div>
                            <c:if test="${admin==null}">
                                <div class="section row ">
                                    <div class="col-md-12">
                                        <input id="password" name="password" class="gui-input" placeholder="请输入原始密码..."
                                               type="password" onblur="checkPWD()"/>
                                    </div>
                                    <label class="col-md-4" id="error1"></label>
                                </div>
                            </c:if>
                            <div class="section row">
                                <div class="col-md-12">
                                    <input id="password1" name="password1" class="gui-input" placeholder="请输入修改后的密码..."
                                           type="password" onblur="P1isP2()"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <input id="password2" name="password2" class="gui-input" placeholder="请确定修改后的密码..."
                                           type="password" onblur="P1isP2()"/>
                                </div>
                                <label class="col-md-4" id="error2"></label>
                            </div>
                            <input type="hidden" id="id" name="id" value="${user.id}">
                            <div class="panel-footer text-right">
                                <button type="submit" class="button">修改</button>
                                <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                            </div>
                            <label class="col-md-4" id="msg"></label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript">
    var check_PWD;
    var P1_P2;

    function checkPWD() {
        var password = $("#password").val();
        var id = $("#id").val();
        $.ajax({
            "type": "GET",
            "url": "isPwd",
            "data": {"password": password, "id": id},
            "dataType": "json",
            "success": function (flag) {
                if (!flag) {
                    $("#error1").css({"color": "red", "top": "11px"});
                    $("#error1").html("初始密码有误。");
                    check_PWD = 0;
                } else {
                    $("#error1").css({"color": "green", "top": "11px"});
                    $("#error1").html("密码验证通过。");
                    check_PWD = 1;
                }
            }
        });
    }

    function P1isP2() {
        var p1 = $("#password1").val();
        var p2 = $("#password2").val();
        if (p1 != p2) {
            if (p2 != "") {
                $("#error2").css({"color": "red", "top": "11px", "display": "block"});
                $("#error2").html("两次密码输入不一致！");
                P1_P2 = 0;
            }
        } else {
            $("#error2").css({"display": "none"});
            P1_P2 = 1;
        }
    }

    function checkData() {
        var password = $("#password").val();
        var p1 = $("#password1").val();
        var p2 = $("#password2").val();
        if (p1 == null || p1 == "") {
            $("#msg").css({"color": "red", "top": "11px"});
            $("#msg").html("密码不能为空！", {icon: 2});
            return false;
        }
        if (p2 == null || p2 == "") {
            $("#msg").css({"color": "red", "top": "11px"});
            $("#msg").html("密码不能为空！", {icon: 2});
            return false;
        }

        if (p1 == password) {
            layer.msg("输入密码与初始密码一致，请重新输入！", {icon: 2});
            return false;
        }
        if (check_PWD == 0) {
            $("#msg").css({"color": "red", "top": "11px"});
            $("#msg").html("输入初始密码不对！");
            return false;
        }
        if (P1_P2 == 0) {
            $("#msg").css({"color": "red", "top": "11px"});
            $("#msg").html("两次密码输入不一致！");
            return false;
        }
    }
</script>