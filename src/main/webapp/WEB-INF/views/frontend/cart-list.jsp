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
		<h3 class="heading-style-3">购物车</h3>
		</section>
		<section class="boxed-sm">
		<div class="container">
			<div class="woocommerce">
				<form class="woocommerce-cart-form">
					<table class="woocommerce-cart-table">
						<thead>
							<tr>
								<th class="product-thumbnail">商品</th>
								<th class="product-name"></th>
								<th class="product-quantity">购买数量</th>
								<th class="product-price">单价</th>
								<th class="product-subtotal">小计</th>
								<th class="product-remove">删除</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${pageInfo.list}" var="item">
								<tr>
									<input type="hidden" class="cartid" value="${item.cartid}" />
									<td class="product-thumbnail"><img
										src="${item.product.productsrc}"
										style="width: 100px; height: 100px; display: block;"
										alt="product-thumbnail" href="javascript:void(0)"
										onclick="window.location.href='${basepath}/product/detail?productid=${item.product.productid}'"></td>
									<td class="product-name" data-title="商品名"><a
										class="product-name" href="javascript:void(0)"
										onclick="window.location.href='${basepath}/product/detail?productid=${item.product.productid}'">${item.product.productname}</a></td>
									<td class="product-quantity" data-title="数量" productid="${item.productid}"><input
										class="qty" step="1" min="1" max="${item.product.productquantity}" name="product-name"
										value="${item.quantity}" title="Qty" size="4" pattern="[0-9]*"
										inputmode="numeric" type="number"></td>
									<td class="product-price" data-title="单价">￥<span>${item.product.productprice}</span>元
									</td>
									<td class="product-subtotal" data-title="小计">￥<span></span>元
									</td>
									<td class="product-remove"><a class="remove" href="javascript:void(0)"
										aria-label="Remove this item" delete-cartid="${item.cartid}">×</a></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<c:if test="${pageInfo.total!=0}">
								<td colspan="6">
									<div class="form-coupon organic-form">
										<div class="form-group">总计:</div>
										<div class="form-group">
											￥<span class="product-total"></span>元
										</div>
										<div class="form-group update-cart">
											<a class="btn btn-brand pill" href="javascript:void(0)" onclick="window.location.href='${basepath}/address/view'" >去结算</a>
										</div>
									</div>
								</td>
								</c:if>
								<c:if test="${pageInfo.total==0}">
								<td colspan="6">
									<div class="form-coupon organic-form">
										<div class="form-group">总计:</div>
										<div class="form-group">
											￥<span class="product-total"></span>元
										</div>
										<div class="form-group update-cart">
											<a class="btn btn-brand pill" href="javascript:void(0)" onclick="window.location.href='${basepath}/product/view'" >去购物</a>
										</div>
									</div>
								</td>
								</c:if>
							</tr>
						</tfoot>
					</table>
				</form>

			</div>
		</div>
		</section>
	</div>


	<!-- footer -->
	<jsp:include page="./footer.jsp" />


	<script type="text/javascript">
		$(function() {

			//1.商品数量 
			var quantity = $(".qty").val();
			
			//2.改小计
			var price = parseFloat($(".product-price").children("span").text());
			price = Math.round(price*100)/100;
			var subtotal = (price * quantity);
			$(".product-subtotal").children("span").text(subtotal);
			//3.改总价
			total();

			$(".product-quantity").change(function() {
				//1.商品数量 
				var quantity = $(this).find(".qty").val();
				var max = $(this).find(".qty").attr("max");
				var min = $(this).find(".qty").attr("min");
				if(parseInt(quantity) >= parseInt(max)){
					quantity = max;
					alert("商品库存为"+max);
					$(this).find(".qty").val(quantity);
				}
				if(quantity < min){
					quantity = min;
					alert("最少购买数量为"+min);
					$(this).find(".qty").val(quantity);
				}
				//alert(quantity);
				//2.改小计
				var price = $(this).parents("tr").find(
						".product-price").children("span")
						.text();
				price = Math.round(price*100)/100;
				var subtotal = (price * quantity);
				subtotal = subtotal.toFixed(2);
				$(this).parents("tr").find(".product-subtotal")
						.children("span").text(subtotal);
				//3.改总价
				total();
				var productid = $(this).attr("productid");
				/* alert(productid);
				alert(quantity); */
				$.ajax({
					url:"${basepath}/cart/edit",
					type:"GET",
					data:{
						"productid":productid,
						"quantity":quantity
					},
					success:function(result){
						if(result.code==100){
							
						}else{
							alert(result.extend.error);
						}
					}
				});
	
			});

			//合计
			function total() {
				var total = 0;
				$(".product-subtotal").children("span").each(function() {
					//先循环每个小计
					total += parseFloat($(this).text()*100)/100;

				});
				total = Math.round(total*100)/100;
				$(".product-total").text(total);
			}

			//单个删除
			$(document).on("click", ".remove", function() {
				//1.弹出对话框
				var cartid = $(this).attr("delete-cartid");
				//alert($(this).parents("tr").find("td:eq(1)").text());
				//alert($(this).attr("delete-cartid"));
				if (confirm("确认删除吗?")) {
					//确认,发送请求
					$.ajax({
						url : "${basepath}/cart/delete/" + cartid,
						type : "DELETE",
						success : function(result) {
							if(result.code == 100){
								alert(result.msg);
								window.location.reload();
							}else{
								alert(result.extend.error);
							}
						}
					});
				}
			});
			
			
			
		});
	</script>