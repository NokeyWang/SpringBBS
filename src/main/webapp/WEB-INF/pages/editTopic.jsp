<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>回帖</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="../public/css/mystyle.css" rel="stylesheet" type="text/css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
<div class="container reply">
    <div style="margin-left:70px;margin-right: 40px;">
        <div><img src="../public/images/reply.jpg" /></div>
        <form:form action="/editTopicPost" method="post" role="form">
            <div class="form-group">
                <input id="userid" name="userid" type="hidden" value="${userid}" />
                <input id="topicid" name="topicid" type="hidden" value="${topicid}" />
            </div>
            <div class="form-group" style="text-align: center;">
                <label for="editTitle" style="padding-left: 14%;text-align: left;">标题:</label>
                <input id="editTitle" name="editTitle"  style="width:500px" value="${title}" />
            </div>
            <div class="form-group" style="text-align: center;">
                <label for="editContent" style="padding-left: 14%;text-align: left;">回帖内容:</label>
                <textarea rows="20" class="form-control reply-textarea" id="editContent" name="editContent">${content}</textarea>
            </div>
            <div class="form-group" style="padding-right: 14%; text-align: right;">
                <button type="submit" class="btn btn-sm btn-success">提交</button>
            </div>
        </form:form>

    </div>
    <div class="footer2">
        2016 &copy; WangYunchao. XuanJinli YinXinglu LiuSha ZhaoMin.
    </div>
</div>
</body>
</html>
