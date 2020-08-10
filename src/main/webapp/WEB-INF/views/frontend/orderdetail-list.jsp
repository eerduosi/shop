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
		<h3 class="heading-style-3">订单详情</h3>
		</section>
		<section class="boxed-sm">
		<div class="container">
			<div class="woocommerce">
				<form class="woocommerce-cart-form">
					<table class="woocommerce-cart-table">
						<thead>
							<tr>
								<tr>
									<th>订单编号</th>
									<th>商品</th>
									<th>商品价格</th>
									<th>购买数量</th>
									<th>价格小计</th>
								</tr>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${pageInfo.list}" var="item">
								<tr>
									<td data-title="订单编号">${item.orderno}</a></td>
									<td data-title="商品名">${item.product.productname}</td>
									<td data-title="商品单价">${item.productcurrentprice}</td>
									<td data-title="商品数量">${item.productquantity}</td>
									<td data-title="商品总价">${item.producttotalprice}</td>
								</tr>
							</c:forEach>

						</tbody>
						
					</table>
				</form>

			</div>
		</div>
			<!-- 显示分页信息 -->
				<div class="row col-md-offset-2">
					<!-- 分页文字信息 -->
					<div class="col-md-6" id="page_info_area">当前
						${pageInfo.pageNum }页,总${pageInfo.pages } 页,总 ${pageInfo.total }
						条记录</div>
					<!-- 分页条信息 -->
					<div class="col-md-6" id="page_nav_area">
						<nav aria-label="Page navigation">
							<ul class="pagination">
								<c:if test="${pageInfo.hasPreviousPage==false}">
									<li class="disabled"><a href="javascript:void(0)">首页</a></li>
									<li class="disabled"><a href="javascript:void(0)"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</c:if>
								<c:if test="${pageInfo.hasPreviousPage}">
									<li><a href="${basepath}/order/view?pagenumber=1">首页</a></li>
									<li><a
										href="${basepath}/order/view?pagenumber=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/order/view?pagenumber=${page_Num}">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/order/view?pagenumber=${pageInfo.pageNum+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/order/view?pagenumber=${pageInfo.pages}">末页</a></li>
								</c:if>
								<c:if test="${pageInfo.hasNextPage==false}">
									<li class="disabled"><a href="javascript:void(0)"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li class="disabled"><a href="javascript:void(0)">末页</a></li>
								</c:if>
							</ul>
						</nav>
					</div>
			</div>
		</section>
	</div>




<!-- footer -->
<jsp:include page="./footer.jsp" />


<script type="text/javascript">
	

	

</script>