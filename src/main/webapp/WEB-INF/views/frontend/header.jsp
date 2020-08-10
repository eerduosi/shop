<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>


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
<header class="header-style-1 static">
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

					<!-- <div class="widget widget-control-header widget-search-header">
						<a class="control btn-open-search-form js-open-search-form-header"
							href="#"> <span class="lnr lnr-magnifier"></span>
						</a>
						<div class="form-outer">
							<button
								class="btn-close-form-search-header js-close-search-form-header">
								<span class="lnr lnr-cross"></span>
							</button>
							<form>
								<input placeholder="Search" />
								<button class="search">
									<span class="lnr lnr-magnifier"></span>
								</button>
							</form>
						</div>
					</div> -->

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