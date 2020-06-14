<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="../public.jsp"/>
<section id="content_wrapper">
    <section id="content" class="table-layout animated fadeIn">
        <div class="tray tray-center">
            <div class="content-header">
                <h2> 写日志 </h2>
                <p class="lead" style="margin-top: 20px">
                    <span style="color: #1c7393">${USER.realName}</span>您好，请开始……
                </p>
            </div>
            <div class="admin-form theme-primary mw800 center-block" style="padding-bottom: 175px;">
                <div class="panel heading-border">
                    <form id="admin-form" name="addForm" action="${pageContext.request.contextPath }/daily/add"
                          method="post">
                        <div class="panel-body bg-light">
                            <div class="section-divider mt20 mb40">
                                <span> 日志内容 </span>
                            </div>
                            <div class="form-group">
                                <label for="items" class="field-label text fs15 mb10">工作事项</label>
                                <textarea id="items" name="items" class="form-control" rows="10"
                                          style="resize:none" required="required"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="performance" class="field-label text fs15 mb10">完成情况</label>
                                <textarea id="performance" name="performance" class="form-control" rows="10"
                                          style="resize:none"
                                ></textarea>
                            </div>
                            <input type="hidden" name="userId" id="userId" value="${USER.id}"/>
                            <div class="panel-footer text-right">
                                <span style="color:green;float: left;padding-top: 12px;" id="saveDate"></span>
                                <button type="submit" class="button">提交</button>
                                <button type="reset" class="button">清除</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
</section>
<jsp:include page="../footer.jsp"/>
<script>
    //打开写日志调用草稿箱
    $(function () {
        getText();
    });

    //自动写入草稿箱
    setInterval(autoSave, 90000);//设置计时器，每90秒执行一次

    //写入草稿箱
    function autoSave() {
        var items = $("#items").val();
        var performance = $("#performance").val();
        //先判断帖子标题和内容有没有值，有的话就提交保存草稿
        if (items != "" || performance != "") {
            $.ajax({
                type: "post",//type：请求的类型
                url: "${pageContext.request.contextPath }/drafts/add",//url：请求的路径
                async: true,//是否自动提交
                data: {//data：请求的参数
                    'items': items,
                    'performance': performance
                },
                dataType: "text",	//数据类型
                success: function(){
                    getText(); //调用查询草稿的方法
                }
            });
        }
    }

    //查询草稿
    function getText() {
        var items = $("#items").val();
        var performance = $("#performance").val();
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath }/drafts/find",
            async: true,
            dataType: "json",
            success: function (data) {
                if (data != null) {
                    //如果内容为空，就对其进行赋值
                    if (items == "") {
                        $("#items").val(data.items);
                    }
                    if (performance == "") {
                        $("#performance").val(data.performance);
                    }
                    //对保存时间进行赋值
                    $("#saveDate").html("*日志已保存至草稿箱，最近保存时间：" + data.createTime);
                }
            }
        });
    }

</script>