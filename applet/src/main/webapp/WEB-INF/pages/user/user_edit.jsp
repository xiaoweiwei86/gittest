<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 修改信息 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw600 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row ">
                            <div class="col-md-3 center-block">&nbsp;&nbsp;
                                <img src="${user.userImg}"
                                     class="img-circle img-thumbnail" style="width:100px;height:100px"/>
                            </div>
                        </div>
                        <div class="section row ">
                            <div class="col-md-2 center-block">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">更换头像
                                </button>
                            </div>
                        </div>
                        <div class="modal fade " id="myModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <!--content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" aria-label="Close" data-dismiss="modal"
                                                aria-hidden="true">
                                            <span aria-hidden="true">X</span>
                                        </button>
                                    </div>
                                    <!--body-->
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath }/user/upload" method="post"
                                              enctype="multipart/form-data" onsubmit="return check()">
                                            <div class="section row">
                                                <div class="col-md-12">
                                                    <input type="file" name="file" id="file"
                                                           accept="image/png, image/jpeg, image/gif, image/jpg,image/bmp"
                                                           class="fileupload-controls"
                                                           onchange="verificationPicFile(this)"/> <br/>
                                                    <input type="submit" value="更改头像" class="btn btn-primary"/>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/user/edit"
                              method="post">
                            <div class="section row">
                                <input type="hidden" name="userImg" value="${user.userImg}"/>
                                <div class="col-md-12">
                                    <label for="username" class="field-label text-muted fs15 mb10">用户名</label>
                                    <input id="username" name="username" class="gui-input" placeholder="用户名..."
                                           type="text"
                                           value="${user.username}" readonly="readonly"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="userId" class="field-label text-muted fs15 mb10">工号</label>
                                    <input id="userId" name="userId" class="gui-input" placeholder="工号..."
                                           type="text" value="${user.userId}"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="realName" class="field-label text-muted fs15 mb10">姓名</label>
                                    <input id="realName" name="realName" class="gui-input" placeholder="姓名..."
                                           type="text"
                                           value="${user.realName}"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="phone" class="field-label text-muted fs15 mb10">电话</label>
                                    <input id="phone" name="phone" class="gui-input" placeholder="电话..." type="text"
                                           value="${user.phone}"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="email" class="field-label text-muted fs15 mb10">邮箱</label>
                                    <input id="email" name="email" class="gui-input" placeholder="邮箱..." type="text"
                                           value="${user.email}"/>
                                </div>
                            </div>
                            <div class="section row">
                                <div class="col-md-12">
                                    <label for="team" class="field-label text-muted fs15 mb10">所属部门</label>
                                    <label for="team" class="field select">
                                        <select id="team" name="team" class="gui-input"
                                                placeholder="所属部门...">
                                            <c:forEach items="${teams}" var="team">
                                                <option value="${team.teamName}"
                                                        <c:if test="${team.teamId==user.teamId}">selected="selected"</c:if>>${team.teamName}</option>
                                            </c:forEach>
                                        </select>
                                        <i class="arrow double"></i>
                                    </label>
                                </div>
                            </div>
                            <c:if test="${USER.roleId==1}">
                                <div class="section row">
                                    <div class="col-md-12">
                                        <label for="role" class="field-label text-muted fs15 mb10">设置角色</label>
                                        <label for="role" class="field select">
                                            <select id="role" name="roleId" class="gui-input"
                                                    placeholder="设置角色...">
                                                <c:forEach items="${roles}" var="role">
                                                    <option value="${role.id}"
                                                            <c:if test="${user.roleId==role.id}">selected="selected"</c:if>>${role.nickName}</option>
                                                </c:forEach>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${USER.roleId!=1}">
                                <div class="section row">
                                    <div class="col-md-12">
                                        <label for="roleId" class="field-label text-muted fs15 mb10">角色</label>
                                        <label for="roleId" class="field select">
                                            <select id="roleId" name="roleId" class="gui-input"
                                                    placeholder="设置角色..." required>
                                                    <option value="${user.role.id}" selected="selected">${user.role.nickName}</option>
                                            </select>
                                            <i class="arrow double"></i>
                                        </label>
                                    </div>
                                </div>
                            </c:if>
                            <input type="hidden" name="id" value="${user.id}"/>
                            <div class="panel-footer text-right">
                                <button type="submit" class="button">保存</button>
                                <button type="button" class="button" onclick="javascript:history.back(-1);">返回</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>
<script type="text/javascript">
    function check() {
        var file = $("#file").val();
        if (file == "") {
            layer.msg("您还没上传文件！",{icon:2});
            return false;
        }
    }

    function verificationPicFile(file) {
        //图片大小验证
        var fileSize = 0;
        var fileMaxSize = 1024;//1M
        var filePath = file.value;
        if (filePath) {
            fileSize = file.files[0].size;
            var size = fileSize / 1024;
            if (size > fileMaxSize) {
                layer.msg("文件大小不能大于1M！",{icon:2});
                file.value = "";
                return false;
            } else if (size <= 0) {
                layer.msg("文件大小不能为0M！",{icon:2});
                file.value = "";
                return false;
            }
        } else {
            return false;
        }
        //图片类型验证
        var fileTypes = [".jpg", ".png", ".gif", ".jpeg"];
        //当括号里面的值为0、空字符、false 、null 、undefined的时候就相当于false
        if (filePath) {
            var isNext = false;
            var fileEnd = filePath.substring(filePath.indexOf("."));
            for (var i = 0; i < fileTypes.length; i++) {
                if (fileTypes[i] == fileEnd) {
                    isNext = true;
                    break;
                }
            }
            if (!isNext) {
                layer.msg('不接受此文件类型！',{icon:2});
                file.value = "";
                return false;
            }
        } else {
            return false;
        }

        /*
        //图片尺寸验证
        if(filePath){
            //读取图片数据
            var filePic = file.files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                var data = e.target.result;
                //加载图片获取图片真实宽度和高度
                var image = new Image();
                image.οnlοad=function(){
                    var width = image.width;
                    var height = image.height;
                    if (width == 720 | height == 1280){
                        alert("文件尺寸符合！");
                    }else {
                        alert("文件尺寸应为：720*1280！");
                        file.value = "";
                        return false;
                    }
                };
                image.src= data;
            };
            reader.readAsDataURL(filePic);
        }else{
            return false;
        }*/
    }
</script>