<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta charset="utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/frontend/css/main.css" />
</head>
<body class="animsition animsition">
	<div class="home-1" id="page">
		<nav id="menu">
		<ul>
			<li><a href="${basepath}/index/view">首页</a></li>

			<li><a href="${basepath}/product/view">商品列表</a></li>
			<li><a href="${basepath}/user/view">个人中心</a>
			<li>
			<li><a href="${basepath}/favorite/view">心愿单</a></li>
			<li><a href="${basepath}/cart/view">购物车</a></li>
			<li><a href="${basepath}/orders/view">查看订单</a></li>
			<c:if test="${user !=null}">
				<li><a href="${basepath}/loginout">退出登录</a></li>
			</c:if>
			<c:if test="${user ==null}">
				<li><a href="${basepath}/login/view">登录/注册</a></li>
			</c:if>

		</ul>
		</nav>
		<header class="header-style-1">
		<div class="container">
			<div class="row">
				<div class="header-1-inner">
					<a class="brand-logo animsition-link" href="${basepath}/index/view"> <img
						class="img-responsive"
						src="${basepath}/static/frontend/images/logo.png" alt="" />
					</a>
					<nav>
					<ul class="menu hidden-xs">
						<li><a href="${basepath}/index/view">首页</a></li>
						<li><a href="${basepath}/product/view">商品列表</a></li>
						<li><a href="${basepath}/user/view">个人中心</a>
						<li>
						<li><a href="${basepath}/favorite/view">心愿单</a></li>
						<li><a href="${basepath}/cart/view">购物车</a></li>
						<li><a href="${basepath}/orders/view">查看订单</a></li>
						<c:if test="${user !=null}">
							<li><a href="${basepath}/loginout">退出登录</a></li>
						</c:if>
						<c:if test="${user ==null}">
							<li><a href="${basepath}/login/view">登录/注册</a></li>
						</c:if>

					</ul>
					</nav>
					<aside class="right">



					<div
						class="widget widget-control-header hidden-lg hidden-md hidden-sm">
						<a class="navbar-toggle js-offcanvas-has-events" type="button"
							href="#menu"> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
						</a>
					</div>
					</aside>
				</div>
			</div>
		</div>
		</header>


		<!-- index -->
		<div class="banner banner-image-fit-screen">
			<div class="rev_slider slider-home-1" id="slider_1">
				<ul>
					<li><img class="rev-slidebg"
						src="${basepath}/static/frontend/images/slider/1.jpg" alt="demo"
						data-bgposition="center center" data-bgfit="cover"
						data-bgrepeat="no-repeat" data-bgparallax="10"></li>
				</ul>
			</div>
		</div>




		<script src="${basepath}/static/frontend/js/library/jquery.min.js"></script>
		<script src="${basepath}/static/frontend/js/library/bootstrap.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/function-check-viewport.js"></script>
		<script src="${basepath}/static/frontend/js/library/slick.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/select2.full.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/imagesloaded.pkgd.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/jquery.mmenu.all.min.js"></script>
		<script src="${basepath}/static/frontend/js/library/rellax.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/isotope.pkgd.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/bootstrap-notify.min.js"></script>
		<script
			src="${basepath}/static/frontend/js/library/bootstrap-slider.js"></script>
		<script src="${basepath}/static/frontend/js/library/in-view.min.js"></script>
		<script src="${basepath}/static/frontend/js/library/countUp.js"></script>
		<script src="${basepath}/static/frontend/js/library/animsition.min.js"></script>
		<link rel="stylesheet" type="text/css"
			href="${basepath}/static/frontend/revolution/css/settings.css" />
		<link rel="stylesheet" type="text/css"
			href="${basepath}/static/frontend/revolution/css/layers.css" />
		<link rel="stylesheet" type="text/css"
			href="${basepath}/static/frontend/revolution/css/navigation.css" />
		<script
			src="${basepath}/static/frontend/revolution/js/jquery.themepunch.tools.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/jquery.themepunch.revolution.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.actions.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.carousel.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.kenburn.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.layeranimation.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.migration.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.navigation.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.parallax.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.slideanims.min.js"></script>
		<script
			src="${basepath}/static/frontend/revolution/js/extensions/revolution.extension.video.min.js"></script>
		<script src="${basepath}/static/frontend/js/config-mm-menu.js"></script>
		<script
			src="${basepath}/static/frontend/js/config-set-bg-blog-thumb.js"></script>
		<script
			src="${basepath}/static/frontend/js/config-isotope-product-home-1.js">
			
		</script>
		<script src="${basepath}/static/frontend/js/config-carousel.js"></script>
		<script
			src="${basepath}/static/frontend/js/config-carousel-thumbnail.js"></script>
		<script
			src="${basepath}/static/frontend/js/config-carousel-product-quickview.js"></script>
		<script src="${basepath}/static/frontend/js/global.js"></script>
		<script src="${basepath}/static/frontend/js/config-banner-home-1.js"></script>
		<!-- Demo Only-->
		<script src="${basepath}/static/frontend/js/demo-add-to-cart.js"></script>
</body>
</html>