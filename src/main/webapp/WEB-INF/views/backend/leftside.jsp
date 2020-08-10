<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<div class="wrapper row-offcanvas row-offcanvas-left">
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="left-side sidebar-offcanvas">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<!-- Sidebar user panel -->
			<div class="user-panel">
				<div class="pull-left image">
					<img src="${basepath}/static/backend/img/avatar3.png"
						class="img-circle" alt="User Image" />
				</div>
				<div class="pull-left info">
					<c:if test="${user.usertype==1}">
						<p>Hello, 管理员${user.username}</p>
					</c:if>
					<c:if test="${user.usertype==0}">
						<p>Hello, 用户${user.username}</p>
					</c:if>
					<a href="javascript:void(0)"><i class="fa fa-circle text-success"></i> Online</a>
				</div>
			</div>
			<!-- search form -->
			<!-- <form action="#" method="get" class="sidebar-form">
				<div class="input-group">
					<input type="text" name="q" class="form-control"
						placeholder="Search..." /> <span class="input-group-btn">
						<button type='submit' name='seach' id='search-btn'
							class="btn btn-flat">
							<i class="fa fa-search"></i>
						</button>
					</span>
				</div>
			</form> -->
			<ul class="sidebar-menu">
				<c:if test="${user.usertype==1}">
					<li><a href="${basepath}/user/view"> <i
							class="fa fa-dashboard"></i> <span>用户列表</span>
					</a></li>
					<li><a href="${basepath}/producttype/view"> <i
							class="fa fa-gavel"></i> <span>商品类型</span>
					</a></li>

					<li><a href="${basepath}/product/view"> <i
							class="fa fa-globe"></i> <span>商品列表</span>
					</a></li>

					<li><a href="${basepath}/productpicture/view"> <i
							class="fa fa-globe"></i> <span>图片列表</span>
					</a></li>

					<li><a href="${basepath}/orders/view"> <i
							class="fa fa-glass"></i> <span>全部订单</span>
					</a></li>

				</c:if>
				<c:if test="${user.usertype==0}">

					<li><a href="${basepath}/user/view"> <i
							class="fa fa-dashboard"></i> <span>个人资料</span>
					</a></li>

					<li><a href="${basepath}/product/view"> <i
							class="fa fa-globe"></i> <span>查看商品</span>
					</a></li>	
					
					<li><a href="${basepath}/cart/view"> <i
							class="fa fa-globe"></i> <span>购物车</span>
					</a></li>
					
					<li><a href="${basepath}/orders/view"> <i
							class="fa fa-gavel"></i> <span>全部订单</span>
					</a></li>

					<li><a href="${basepath}/address/view"> <i
							class="fa fa-globe"></i> <span>地址簿</span>
					</a></li>

					<li><a href="${basepath}/favorite/view"> <i
							class="fa fa-glass"></i> <span>心愿单</span>
					</a></li>

				</c:if>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside>