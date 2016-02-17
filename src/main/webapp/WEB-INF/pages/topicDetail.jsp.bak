<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CHester
  Date: 16/1/15
  Time: 下午5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>帖子详情</title>

    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1>帖子详情</h1>
    <hr/>

    <h3>标题:${topic.title}</h3>
    <hr/>

    ${topic.content}

    <hr/>
    <c:if test="${!empty replyInfoList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th width="30%">回帖人</th>
                <th>回帖内容</th>
            </tr>

            <c:forEach items="${replyInfoList}" var="replyinfo">
                <tr>
                    <td>${replyinfo.name}</td>
                    <td>${replyinfo.replyEntity.content}</td>
                </tr>
            </c:forEach>

        </table>

    </c:if>

    <form id="addReply" name="addReply" method="post" action="/addReply">
        <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
        <input id="userid" name="userid" type="hidden" value="${userid}" />
        <button type="submit" class="btn btn-sm btn-success">回帖</button>
    </form>


    <form id="addReply" name="addReply" method="post" action="/showTopics">
        <input id="userid" name="userid" type="hidden" value="${userid}" />
        <button type="submit" class="btn btn-sm btn-warning">返回</button>
    </form>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>

