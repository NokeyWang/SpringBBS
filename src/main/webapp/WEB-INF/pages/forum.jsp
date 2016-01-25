<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>论坛主页面</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>
<html>
<head>
    <title>论坛主页面</title>
</head>
<body>


<div class="container">

    <h3>${username},欢迎您使用本论坛!</h3>
    <hr/>
    <h3>帖子列表: </h3>
    <form id="addTopic" name="addReply" method="post" action="/addTopic">
        <input id="userid1" name="userid1" type="hidden" value="${userid}" />
        <button type="submit" class="btn btn-sm btn-warning">发帖</button>
    </form>

    <!-- 如果帖子列表为空 -->
    <c:if test="${empty topicList}">
        <p class="bg-warning">
            <br/>
            当前没有帖子! <a href="/addUser" type="button" class="btn btn-default btn-sm">发帖</a>
            <br/>
            <br/>
        </p>
    </c:if>

    <!-- 如果用户列表非空 -->
    <c:if test="${!empty topicList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th width="30%">帖子标题</th>
                <th></th>
            </tr>

            <c:forEach items="${topicList}" var="topic">
                <tr>
                    <td>${topic.title}</td>
                    <td>
                        <form id="choseTopic" name="choseTopic" method="post" action="/showTopicDetail">
                            <input id="userid" name="userid" type="hidden" value="${userid}" />
                            <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                            <button type="submit" class="btn btn-sm btn-success">帖子详情</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
</html>