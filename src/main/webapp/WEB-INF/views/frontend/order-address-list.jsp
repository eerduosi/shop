<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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
<body class="animsition">
	<div class="shop-cart" id="page">
		<!-- header -->
		<jsp:include page="./header.jsp" />

		<!-- cart-list -->
		<section class="sub-header shop-detail-1"> <img
			class="rellax bg-overlay"
			src="${basepath}/static/frontend/images/sub-header/013.jpg" alt="">
		<div class="overlay-call-to-action"></div>
		<h3 class="heading-style-3">收货地址</h3>
		</section>
		<section class="boxed-sm">
		<div class="container">
			<div class="woocommerce">
				<form class="woocommerce-cart-form">
					<table class="woocommerce-cart-table">
						<thead>
							<tr>
								<tr>
									<th>收件人</th>
									<th>手机号</th>
									<th>地址</th>
									<th>邮编</th>
									
								</tr>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${pageInfo.list}" var="item">
								<tr>
									
									
									<td class="product-name" data-title="收货人"><a
										class="product-name" href="javascript:void(0)">${item.receivername}</a></td>
									
									<td class="product-price" data-title="手机号">${item.receiverphone}</td>
									<td class="product-subtotal" data-title="地址">${item.receiveraddress}</td>
									<td class="product-stock-status" data-title="邮编">${item.receiverzip}</td>
									
								</tr>
							</c:forEach>

						</tbody>
					
					</table>
				</form>

			</div>
		</div>
		</section>
	</div>






<!-- footer -->
<jsp:include page="./footer.jsp" />


<script type="text/javascript">

	

</script>