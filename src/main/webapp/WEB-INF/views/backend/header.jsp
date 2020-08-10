<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<title>Director | Simple Tables</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<meta name="description" content="Developed By M Abdur Rokib Promy">
<meta name="keywords"
	content="Admin, Bootstrap 3, Template, Theme, Responsive">
<!-- jQuery 2.0.2 -->
<!-- <script
		src="http://ajax.googleapis.com/ajax/libs/jquery/2.0.2/jquery.min.js"></script> -->
<script src="${basepath}/static/backend/js/jquery.min.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${basepath}/static/backend/js/ajaxupload.js"></script>
<script src="${basepath}/static/backend/js/jquery.nicescroll.js"
	type="text/javascript"></script>
<!-- Bootstrap -->
<script src="${basepath}/static/backend/js/bootstrap.min.js"
	type="text/javascript"></script>
<!-- Director App -->
<script src="${basepath}/static/backend/js/Director/app.js"
	type="text/javascript"></script>
<!-- bootstrap 3.0.2 -->
<link href="${basepath}/static/backend/css/bootstrap.min.css"
	rel="stylesheet" type="text/css" />
<!-- font Awesome -->
<link href="${basepath}/static/backend/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link href="${basepath}/static/backend/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- google font -->
<link href='http://fonts.googleapis.com/css?family=Lato'
	rel='stylesheet' type='text/css'>
<!-- Theme style -->
<link href="${basepath}/static/backend/css/style.css" rel="stylesheet"
	type="text/css" />

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
          <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
        <![endif]-->
</head>
<body class="skin-black">
	<!-- header logo: style can be found in header.less -->
	<header class="header"> <a href="javascript:void(0)" class="logo">
		<!-- Add the class icon to your logo image or logo icon to add the margining -->
		Director
	</a> <!-- Header Navbar: style can be found in header.less --> <nav
		class="navbar navbar-static-top" role="navigation"> <!-- Sidebar toggle button-->
	<a href="#" class="navbar-btn sidebar-toggle" data-toggle="offcanvas"
		role="button"> <span class="sr-only">Toggle navigation</span> <span
		class="icon-bar"></span> <span class="icon-bar"></span> <span
		class="icon-bar"></span>
	</a>
	<div class="navbar-right">
		<ul class="nav navbar-nav">
			<!-- Messages: style can be found in dropdown.less-->

			<!-- User Account: style can be found in dropdown.less -->
			<li class="dropdown user user-menu"><a href="#"
				class="dropdown-toggle" data-toggle="dropdown"> <i
					class="fa fa-user"></i> <span>${user.username} <i
						class="caret"></i></span>
			</a>
				<ul class="dropdown-menu dropdown-custom dropdown-menu-right">
					<li class="dropdown-header text-center">Account</li>


					<li><a href="${basepath}/loginout"><i
							class="fa fa-ban fa-fw pull-right"></i> Logout</a></li>
				</ul></li>
		</ul>
	</div>
	</nav> </header>