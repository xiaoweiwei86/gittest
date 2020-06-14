<%@ page language="java" import="java.util.*,java.io.*,javax.servlet.*"
         contentType="text/html; charset=utf-8" %>
<head>
    <title>研究院经验数据库</title>
    <link href="${pageContext.request.contextPath }/css/public_jy.css" rel="stylesheet" type="text/css" />
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
<div class="all">
    <div class="hlhead">
        <jsp:include page="head.jsp"/>
    </div>
    <div class="search">
        <div class="searchlogo">
            <img src="${pageContext.request.contextPath}/images/logo.png"/> <img
                src="${pageContext.request.contextPath}/images/wenzi.png"/>
        </div>
        <div class="searchall">
            <div class="input-group input-group-lg">
				 <span class="input-group-addon" id="search">
				 	<i class="glyphicon glyphicon-globe"></i>
					</span>
                <input class="form-control" type="text" id="keywords" name="keywords"
                       placeholder="请输入要搜索的关键字……"/>
                <span class="input-group-btn">
                    <button class="btn btn-primary" type="button" id="search_btn">Go!</button>
                </span>
            </div>
        </div>
    </div>
    <div class="hlfoot">
        <div class="bookimg">
            <img src="${pageContext.request.contextPath}/images/t7.png"/>
        </div>
        <br/>
        <p>恒隆集团研究院数据经验库 Copyright© 2018-2020 技术管理部 肖伟伟 All rights reserved</p>
    </div>
</div>
<script>
    $("#search").click(function () {
        var keywords = $('#keywords').val().trim().replace(/\s/g, "");
        $(window).attr('location', 'search?keywords=' + keywords);
    });
    $("#search_btn").click(function () {
        var keywords = $('#keywords').val().trim().replace(/\s/g, "");
        $(window).attr('location', 'search?keywords=' + keywords);
    });
</script>
</body>
</html>
