<!DOCTYPE html>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->

<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->

<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->

<!-- BEGIN HEAD -->

<head>

	<meta charset="utf-8" />

	<title>Login</title>

	<meta content="width=device-width, initial-scale=1.0" name="viewport" />

	<meta content="" name="description" />

	<meta content="" name="author" />

	<!-- BEGIN GLOBAL MANDATORY STYLES -->

	<link href="../public/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/bootstrap-responsive.min.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/style-metro.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/style.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/style-responsive.css" rel="stylesheet" type="text/css"/>

	<link href="../public/css/default.css" rel="stylesheet" type="text/css" id="style_color"/>

	<link href="../public/css/uniform.default.css" rel="stylesheet" type="text/css"/>

	<!-- END GLOBAL MANDATORY STYLES -->

	<!-- BEGIN PAGE LEVEL STYLES -->

	<link href="../public/css/login.css" rel="stylesheet" type="text/css"/>

	<!-- END PAGE LEVEL STYLES -->

	<link rel="shortcut icon" href="media/image/favicon.ico" />

</head>

<!-- END HEAD -->

<!-- BEGIN BODY -->

<body class="login">

	<!-- BEGIN LOGO -->

	<div class="logo">

		<img src="../public/images/logo-big.png" alt="" /> 

	</div>

	<!-- END LOGO -->

	<!-- BEGIN LOGIN -->

	<div class="content">

		<!-- BEGIN LOGIN FORM -->

		<form:form action="/userLoginPost" method="post" commandName="user" role="form">
			<h3 class="form-title">Login to your account</h3>

			<div class="alert alert-error hide">

				<button class="close" data-dismiss="alert"></button>

				<span>Enter any username and password.</span>

			</div>

			<div class="control-group">


				<label class="control-label visible-ie8 visible-ie9">Username</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-user"></i>

						<input class="m-wrap placeholder-no-fix" type="text" placeholder="Username" name="name"/>

					</div>

				</div>

			</div>

			<div class="control-group">

				<label class="control-label visible-ie8 visible-ie9">Password</label>

				<div class="controls">

					<div class="input-icon left">

						<i class="icon-lock"></i>

						<input class="m-wrap placeholder-no-fix" type="password" placeholder="Password" name="password"/>

					</div>

				</div>

			</div>
			<div class="form-actions">

				<a href="/register" type="button" class="btn green pull-right btn-sm btn-danger">

				Register <i class="m-icon-swapright m-icon-white"></i>

				</a>

				<button type="submit" class="btn green pull-right btn-sm btn-success" style="margin-right: 10px;">

				Login <i class="m-icon-swapright m-icon-white"></i>

				</button>  

			</div>

		</form:form>


	</div>



	<div class="copyright">

		2016 &copy; WangYunchao. XuanJinli YinXinglu LiuSha ZhaoMin.

	</div>




   
<script src="../public/js/jquery-1.10.1.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="../public/js/bootstrap.min.js"></script>


</body>


</html>