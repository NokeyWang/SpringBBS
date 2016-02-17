<%--
  Created by IntelliJ IDEA.
  User: CHester
  Date: 16/1/15
  Time: 下午5:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>发帖</title>

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
        <form:form action="/addTopicPost" method="post" role="form">
            <div class="topic">
            <div class="form-group">
                <input id="userid" name="userid" type="hidden" value="${userid}" />
                <label for="title">标题:</label>
                <input type="text" class="form-control" id="title" name="title" placeholder="请输入标题..." style="width: 100%;" />
            </div>
            <div class="form-group">
                <label for="topiccontent">内容:</label>
                <textarea rows="5" class="form-control" id="topiccontent" name="topiccontent" style="width:100%;height: 200px;"></textarea>
            </div>
            <div class="form-group" style="text-align: right;">
                <button type="submit" class="btn btn-sm btn-success">提交</button>
            </div>
        </form:form>
        </div>
    </div>
    <div class="footer3">
        2016 &copy; WangYunchao. XuanJinli YinXinglu LiuSha ZhaoMin.
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../public/js/jquery-1.10.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../public/js/bootstrap.min.js"></script>
</body>
</html>
