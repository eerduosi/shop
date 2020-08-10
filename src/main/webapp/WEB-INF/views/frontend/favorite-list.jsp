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
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="${basepath}/static/frontend/css/main.css" />
  </head>
<body class="animsition">
    <div class="shop-cart" id="page">
      <!-- header -->
      <jsp:include page="./header.jsp" />

		<!-- favorite-list -->
		<section class="sub-header shop-detail-1">
			<img class="rellax bg-overlay"
				src="${basepath}/static/frontend/images/sub-header/013.jpg" alt="">
			<div class="overlay-call-to-action"></div>
			<h3 class="heading-style-3">心愿单</h3>
		</section>
		<section class="boxed-sm">
			<div class="container">
				<div class="woocommerce">
					<form class="woocommerce-cart-form">
						<table class="woocommerce-cart-table">
							<thead>
								<tr>
									<th class="product-thumbnail">商品名</th>
									<th class="product-name"></th>
									<th class="product-price">单价</th>
									<th class="product-remove">删除</th>
								</tr>
							</thead>
							<tbody>
		
								<c:forEach items="${pageInfo.list}" var="item">
		
									<tr>
										<input type="hidden" value="${item.favoriteid}" />
										<td class="product-thumbnail"><img
											src="${item.product.productsrc}"
											style="width: 100px; height: 100px; display: block;"
											alt="product-thumbnail" href="javascript:void(0)" onclick="window.location.href='${basepath}/product/detail?productid=${item.product.productid}'"></td>
										<td class="product-name" data-title="商品名"><a
											class="product-name" href="javascript:void(0)" onclick="window.location.href='${basepath}/product/detail?productid=${item.product.productid}'">${item.product.productname}</a></td>
										<td class="product-price" data-title="单价">￥${item.product.productprice}元</td>
										<td class="product-remove"><a class="remove" href="javascript:void(0)"
											aria-label="Remove this item" delete-favoriteid="${item.favoriteid}">×</a></td>
										
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
//单个删除
$(document).on("click", ".remove", function() {
	//1.弹出对话框
	var favoriteid = $(this).attr("delete-favoriteid");
	//alert($(this).parents("tr").find("td:eq(1)").text());
	//alert($(this).attr("delete-favoriteid"));
	if (confirm("确认删除吗?")) {
		//确认,发送请求
		$.ajax({
			url : "${basepath}/favorite/delete/" + favoriteid,
			type : "DELETE",
			success : function(result) {
				if(result.code ==100){
					alert(result.msg);
					window.location.reload();
				}else{
					alert(result.extend.error);
				}
			}
		});
	}
});
</script>