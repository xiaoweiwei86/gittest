<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 编辑用户信息 </h2>
                <p class="lead" style="margin-top: 20px"></p>
            </div>
            <div class="admin-form theme-primary mw1000 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <div class="panel-body bg-light">
                        <div class="section-divider mt20 mb40">
                            <span> 基本信息 </span>
                        </div>
                        <div class="section row">
                            <div class="col-md-12">
                                <img src="${pageContext.request.contextPath }/${USER.userImg}"
                                     class="img-circle img-thumbnail" style="width:100px;height:100px"/>
                            </div>
                        </div>
                        <div class="section row">
                            <div class="col-md-1">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">上传头像
                                </button>
                            </div>
                        </div>
                        <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
                             aria-labelledby="myModalLabel"
                             aria-hidden="true">
                            <div class="modal-dialog">
                                <!--content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal"
                                                aria-hidden="true">
                                            &times;
                                        </button>
                                    </div>
                                    <!--body-->
                                    <div class="modal-body">
                                        <form action="${pageContext.request.contextPath }/user/upload" method="post" enctype="multipart/form-data">
                                            <div class="row">
                                                <input type="file" name="file"/><br/>
                                                <input type="submit" value="文件上传" class="btn btn-primary"/><br/>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>