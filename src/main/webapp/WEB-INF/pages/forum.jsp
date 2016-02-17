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
    <title>Spring BBS</title>

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

<div class="pic-change">
    <ul>
        <li><img src="../public/images/01.jpg" alt="1"/></li>
        <li><img src="../public/images/02.jpg" alt="2"/></li>
        <li><img src="../public/images/03.jpg" alt="3"/></li>
        <li><img src="../public/images/04.jpg" alt="4"/></li>
        <li><img src="../public/images/05.jpg" alt="5"/></li>
    </ul>
    <ol>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
        <li></li>
    </ol>
</div>
<div style="text-align: center;">
    <img src="../public/images/adv.jpg" />
</div>

<div class="container forum">
    <div style="margin-left:70px;margin-right: 40px;">

        <div style="float:left;"><h3 style="font-size: 16px;">${username},欢迎您使用本论坛!</h3></div>
        <div style="text-align: right;">
            <form id="addTopic" name="addReply" method="post" action="/addTopic">
                <input id="userid1" name="userid1" type="hidden" value="${userid}" />
                <label>当前本论坛共有${count}个主题帖.</label>
                <button type="submit" class="btn btn-sm btn-warning">发帖</button>
            </form>
        </div>
        <hr style="width: 100%;" />
        <!-- 如果帖子列表为空 -->
        <c:if test="${empty topicList}">
            <p class="bg-warning">
                <br/>
                当前没有帖子! <a href="/addUser" type="button" class="btn btn-sm btm-info">发帖</a>
                <br/>
                <br/>
            </p>
        </c:if>

        <!-- 如果用户列表非空 -->
        <c:if test="${!empty topicList}">
            <table class="table table-striped">
                <tr>
                    <th width="30%" style="background-color: #34ab46;">帖子标题</th>
                    <th style="background-color: #34ab46;"></th>
                    <th style="background-color: #34ab46;"></th>
                </tr>

                <c:forEach items="${topicList}" var="topic">
                    <tr>
                        <td class="forum-td" style="width: 70%;">${topic.title}</td>
                        <td class="forum-td" style="text-align: right;">
                            <form id="choseTopic" name="choseTopic" method="post" action="/showTopicDetail">
                                <input id="userid" name="userid" type="hidden" value="${userid}" />
                                <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                                <button type="submit" class="btn btn-sm btn-primary">帖子详情</button>
                            </form>
                        </td>
                        <td class="forum-td" style="text-align: right;">
                            <form id="deleteTopic" name="choseTopic" method="post" action="/deleteTopic">
                                <input id="deleteUserid" name="deleteUserid" type="hidden" value="${userid}" />
                                <input id="deleteTopicid" name="deleteTopicid" type="hidden" value="${topic.topicid}" />
                                <button type="submit" class="btn btn-sm btn-danger">删除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>


            </table>
        </c:if>
    </div>
    <div class="footer">
        2016 &copy; WangYunchao. XuanJinli YinXinglu LiuSha ZhaoMin.
    </div>
</div>

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../public/js/jquery-1.10.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../public/js/bootstrap.min.js"></script>

<script src="../public/js/jquery.luara.0.0.1.min.js"></script>
</body>
</html>
<script>
    $(function(){
        <!--调用Luara示例-->
        $(".pic-change").luara({width:"1100",height:"304",interval:3000,selected:"seleted",deriction:"left"});

    });
</script>