<!-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: CHester
  Date: 16/1/15
  Time: 下午5:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %> -->
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>帖子详情</title>

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
<div class="container detail">
    <div style="margin-left:70px;margin-right: 40px;">
        <img src="../public/images/detail.jpg" />
        <h3>标题:${topic.title}</h3>
        <hr/>

        ${topic.content}

        <hr/>
        <c:if test="${!empty replyInfoList}">
            <table class="table table-striped">
                <tr>
                    <th width="10%" style="background-color: #34ab46;">回帖人</th>
                    <th width="70%" style="background-color: #34ab46;">回帖内容</th>
                    <th width="10%" style="background-color: #34ab46;">操作</th>
                    <th width="10%" style="background-color: #34ab46;"></th>
                </tr>

                <c:forEach items="${replyInfoList}" var="replyinfo">
                    <tr>
                        <td class="forum-td">${replyinfo.name}</td>
                        <td class="forum-td">${replyinfo.replyEntity.content}</td>
                        <td class="forum-td" style="text-align: right;">
                            <form id="editReply" name="editReply" method="post" action="/editReply">
                                <input id="userid" name="userid" type="hidden" value="${userid}" />
                                <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                                <input id="replyid" name="replyid" type="hidden" value="${replyinfo.replyEntity.replyid}" />
                                <button type="submit" class="btn btn-sm btn-primary">编辑</button>
                            </form>
                        </td>
                        <td class="forum-td" style="text-align: right;">
                            <form id="deleteReply" name="deleteReply" method="post" action="/deleteReply">
                                <input id="userid" name="userid" type="hidden" value="${userid}" />
                                <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                                <input id="replyid" name="replyid" type="hidden" value="${replyinfo.replyEntity.replyid}" />
                                <button type="submit" class="btn btn-sm btn-danger">删除</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>

            </table>

        </c:if>
        <table>
            <tr>
                <th>
                    <form id="editTopic" name="editTopic" method="post" action="/editTopic" style="text-align: right;">
                        <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                        <input id="userid" name="userid" type="hidden" value="${userid}" />
                        <button type="submit" class="btn btn-sm btn-info">修改</button>
                    </form>
                </th>
                <th>
                    <form id="addReply" name="addReply" method="post" action="/addReply" style="text-align: right;">
                        <input id="topicid" name="topicid" type="hidden" value="${topic.topicid}" />
                        <input id="userid" name="userid" type="hidden" value="${userid}" />
                        <button type="submit" class="btn btn-sm btn-success">回帖</button>
                    </form>
                </th>
                <th>
                    <form id="showTopics" name="showTopics" method="post" action="/showTopics" style="text-align: right">
                        <input id="userid" name="userid" type="hidden" value="${userid}" />
                        <button type="submit" class="btn btn-sm btn-warning">返回</button>
                    </form>
                </th>
            </tr>
        </table>


    </div>
    <div class="footer">
        2016 &copy; WangYunchao. XuanJinli YinXinglu LiuSha ZhaoMin.
    </div>
</div>


<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="../public/js/jquery-1.10.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../public/js/bootstrap.min.js"></script>

</body>
</html>

