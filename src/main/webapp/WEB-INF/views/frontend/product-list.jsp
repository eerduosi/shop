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
    <title>商品列表</title>
    <meta charset="utf-8" />
    <meta name="description" content="" />
    <meta name="keywords" content="" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${basepath}/static/frontend/css/main.css" />
  </head>
<body class="animsition">
    <div class="shop-layout-1" id="page">
      	
      	<!-- header -->
      	<jsp:include page="./header.jsp" />
      	

		<!-- product-list -->
		<section class="sub-header shop-layout-1">
			<img class="rellax bg-overlay"
				src="${basepath}/static/frontend/images/sub-header/01.jpg" alt="">
			<div class="overlay-call-to-action"></div>
			<h3 class="heading-style-3">商品</h3>
		</section>
		<div class="woocommerce-top-control wrapper">
			<section class="boxed-sm">
				<div class="container">
					<div class="row">
						<div class="woocommerce-top-control">
							<p class="woocommerce-result-count">当前 ${pageInfo.pageNum }页,总${pageInfo.pages }
								页,总 ${pageInfo.total} 个商品</p>
							
						</div>
					</div>
				</div>
			</section>
		</div>
		<section class="box-sm">
			<div class="container">
				<div class="row main">
					<div
						class="row product-grid-equal-height-wrapper product-equal-height-4-columns flex multi-row">
		
		
						<c:forEach items="${pageInfo.list}" var="item">
							<figure class="item">
								<div class="product product-style-1">
									<div class="img-wrapper">
										<a href="javascript:void(0)" onclick="window.location.href='${basepath}/product/detail?productid=${item.productid}'"> <img class="img-responsive"
											src="${item.productsrc}" alt="product thumbnail" />
										</a>
										<div class="product-control-wrapper bottom-right">
											<div class="wrapper-control-item item-wish-list">
												<a class="js-wish-list js-notify-add-wish-list animate-icon-wish-list" href="javascript:void(0)" productid="${item.productid}">
													<span class="lnr lnr-heart"></span>
												</a>
											</div>
											<div class="wrapper-control-item item-add-cart js-action-add-cart" >
												<a class="animate-icon-cart" href="javascript:void(0)" productid="${item.productid}"> <span
													class="lnr lnr-cart"></span>
												</a>
												<svg x="0px" y="0px" width="36px" height="32px"
													viewbox="0 0 36 32">
		                          <path stroke-dasharray="19.79 19.79"
														fill="none" ,="," stroke-width="2" stroke-linecap="square"
														stroke-miterlimit="10"
														d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
		                        </svg>
											</div>
										</div>
									</div>
									<figcaption class="desc text-center">
										<h3>
											<a class="product-name" href="javasrcipt:void(0)">${item.productname}</a>
										</h3>
										<span class="price">￥${item.productprice}元</span>
									</figcaption>
								</div>
							</figure>
		
						</c:forEach>
		
					</div>
					<div class="row">
						<div class="col-md-12 text-right">
							<nav>
								<ul class="pagination pagination-style-1">
									<c:if test="${pageInfo.hasPreviousPage==false}">
										<li class="disabled"><a href="javascript:void(0)">首页</a></li>
										<li class="disabled"><a href="javascript:void(0)"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</c:if>
									<c:if test="${pageInfo.hasPreviousPage}">
										<li><a
											href="${basepath}/product/view?pagenumber=1&producttypeid=${producttypeid}">首页</a></li>
										<li><a
											href="${basepath}/product/view?pagenumber=${pageInfo.pageNum-1}&producttypeid=${producttypeid}"
											aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
										</a></li>
									</c:if>
		
		
									<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
										<c:if test="${page_Num == pageInfo.pageNum }">
											<li class="current"><a href="javascript:void(0)">${page_Num }</a></li>
										</c:if>
										<c:if test="${page_Num != pageInfo.pageNum }">
											<li><a
												href="${basepath}/product/view?pagenumber=${page_Num}&producttypeid=${producttypeid}">${page_Num}</a></li>
										</c:if>
									</c:forEach>
									<c:if test="${pageInfo.hasNextPage}">
										<li><a
											href="${basepath}/product/view?pagenumber=${pageInfo.pageNum+1}&producttypeid=${producttypeid}"
											aria-label="Next"> <span aria-hidden="true">&raquo;</span>
										</a></li>
										<li><a
											href="${basepath}/product/view?pagenumber=${pageInfo.pages}&producttypeid=${producttypeid}">末页</a></li>
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
				</div>
			</div>
		</section>
	</div>


<!-- footer -->
<jsp:include page="./footer.jsp" />

<script type="text/javascript">

	//添加到购物车
	$(".animate-icon-cart").click(function() {
		var productid = $(this).attr("productid");
		var quantity = 1;
		//alert(productid);
		//alert(quantity);
		$.ajax({
			url : "${basepath}/cart/edit",
			type : "GET",
			data : {
				"productid" : productid,
				"quantity" : quantity,
			},
			success : function(result) {
				if (result.code == 100) {
					alert("添加成功");
				}else{
					alert(result.extend.error);	
				}
			}
		});
	});
	
	
	//添加到心愿单
	$(".animate-icon-wish-list").click(function() {
		var productid = $(this).attr("productid");
		//alert(productid);
		$.ajax({
			url : "${basepath}/favorite/edit",
			type : "GET",
			data : {
				"productid" : productid,
			},
			success : function(result) {
				//			alert(result.code);
				if (result.code == 100) {
					alert("添加成功");
				}else{
					alert(result.extend.error);	
				}
			}
		});
	});
	
	
</script>