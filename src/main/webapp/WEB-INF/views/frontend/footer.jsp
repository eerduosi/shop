<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<footer class="footer-style-1">
	<div class="container">
		<div class="row">
			<div class="footer-style-1-inner">
				<div class="widget-footer widget-text col-first col-small">
					<a href="javascript:void(0)"> <img class="logo-footer"
						src="${basepath}/static/frontend/images/logo.png"
						alt="Logo Organic" />
					</a>
					<div class="widget-link">
						<ul>
							<li><span class="lnr lnr-map-marker icon"></span> <span>内蒙古师范大学盛乐校区</span>
							</li>
							<li><span class="lnr lnr-phone-handset icon"></span> <a
								href="tel:0123456789">(+86) 138xxxx3863</a></li>
							<li><span class="lnr lnr-envelope icon"></span> <a
								href="mailto: contact@site.com">138xxxx3863@imnu.edu.cn </a></li>
						</ul>
					</div>
				</div>
				<div class="widget-footer widget-link col-second col-medium">
					<div class="list-link">
						<h4 class="h4 heading">商店</h4>
						<ul>
							<li><a href="javascript:void(0)">食物</a></li>
							<li><a href="javascript:void(0)">种植园</a></li>
							<li><a href="javascript:void(0)">健康</a></li>
							<li><a href="javascript:void(0)">有机</a></li>
						</ul>
					</div>
					<div class="list-link">
						<h4 class="h4 heading">帮助</h4>
						<ul>
							<li><a href="javascript:void(0)">联系我们</a></li>
							<li><a href="javascript:void(0)">问与答</a></li>
							<li><a href="javascript:void(0)">隐私政策</a></li>
							<li><a href="javascript:void(0)">日志</a></li>
						</ul>
					</div>
					<div class="list-link">
						<h4 class="h4 heading">我的账户</h4>
						<ul>

							<li><a href="javascript:void(0)"
								onclick="window.location.href='${basepath}/user/view'">个人中心</a>
							</li>
							<li><a href="javascript:void(0)"
								onclick="window.location.href='${basepath}/cart/view'">购物车</a></li>
							<li><a href="javascript:void(0)"
								onclick="window.location.href='${basepath}/favorite/view'">心愿单</a>
							</li>
							<li><a href="javascript:void(0)"
								onclick="window.location.href='${basepath}/orders/view'">查看订单</a>
							</li>

						</ul>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="copy-right style-1">
		<div class="container">
			<div class="row">
				<div class="copy-right-inner">
					<p>Copyright © 2020 Designed by Bxy. All rights reserved.</p>

				</div>
			</div>
		</div>
	</div>
</footer>

<script src="${basepath}/static/frontend/js/library/jquery.min.js"></script>
<script src="${basepath}/static/frontend/js/library/bootstrap.min.js"></script>
<script src="${basepath}/static/frontend/js/function-check-viewport.js"></script>
<script src="${basepath}/static/frontend/js/library/slick.min.js"></script>
<script src="${basepath}/static/frontend/js/library/select2.full.min.js"></script>
<script
	src="${basepath}/static/frontend/js/library/imagesloaded.pkgd.min.js"></script>
<script
	src="${basepath}/static/frontend/js/library/jquery.mmenu.all.min.js"></script>
<script src="${basepath}/static/frontend/js/library/rellax.min.js"></script>
<script src="${basepath}/static/frontend/js/library/isotope.pkgd.min.js"></script>
<script
	src="${basepath}/static/frontend/js/library/bootstrap-notify.min.js"></script>
<script src="${basepath}/static/frontend/js/library/bootstrap-slider.js"></script>
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
<script src="${basepath}/static/frontend/js/config-set-bg-blog-thumb.js"></script>
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