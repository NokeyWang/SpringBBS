<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户注册</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<style>
    body{text-align:center}
</style>
<html>
<head>
    <title>回复页面</title>
</head>
<body>
<div class="container">
    <h1>回复:</h1>
    <hr/>

    <form:form action="/addReplyPost" method="post" role="form">
        <div class="form-group">
            <input id="userid" name="userid" type="hidden" value="${userid}" />
            <input id="topicid" name="topicid" type="hidden" value="${topicid}" />
        </div>
        <div class="form-group">
            <label for="replycontent">回帖内容:</label>
            <textarea rows="5" class="form-control" id="replycontent" name="replycontent"></textarea>
        </div>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>


</div>
</body>
</html>
