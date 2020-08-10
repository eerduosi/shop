<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <div class="shop-detail-1" id="page">
      	
      	<!-- header -->
      	<jsp:include page="./header.jsp" />
      
      
      
      
<!-- product-detail -->
<section class="sub-header shop-detail-1">
        <img class="rellax bg-overlay" src="${basepath}/static/frontend/images/sub-header/01.jpg" alt="">
        <div class="overlay-call-to-action"></div>
        <h3 class="heading-style-3">商品详情</h3>
      </section>
      <section class="boxed-sm">
        <div class="container">
          <div class="row product-detail">
            <div class="row main">
              <div class="col-md-6">
                <div class="woocommerce-product-gallery">
                  <div class="main-carousel">
                  
                  <c:forEach items="${productpicture}" var="item">
                  
                    <div class="item">
                      <img class="img-responsive" src="${item.productpicturesrc}" alt="product thumbnail">
                    </div>

				  </c:forEach>

                  </div>
                  <div class="thumbnail-carousel">
                  
                  <c:forEach items="${productpicture}" var="item">
                    <div class="item">
                      <img class="img-responsive" src="${item.productpicturesrc}" alt="product thumbnail">
                    </div>
                  
                    </c:forEach>
                  
                  </div>
                </div>
              </div>
              <div class="col-md-6">
                <div class="summary">
                  <div class="desc">
                    <div class="header-desc">
                      <h2 class="product-title">${product.productname }</h2>
                    </div>
                    <div class="header-desc">
                      <h2 class="price"><span>价格:</span><span>￥${product.productprice}元</span></h2>
                    </div>
                    <div class="body-desc">
                      <div class="woocommerce-product-details-short-description">
                        <p class="posted-in">类型:
                        <c:if test="${user!=null}">
                     		 <a href="javascript:void(0)" onclick="window.location.href='${basepath}/product/view?producttypeid=${product.producttype.producttypeid}'" rel="tag">${product.producttype.producttypename}</a>
                      	</c:if>
                      	<c:if test="${user==null}">
                   		   <a href="javascript:void(0)" onclick="window.location.href='${basepath}/product/nologin/view?producttypeid=${product.producttype.producttypeid}'" rel="tag">${product.producttype.producttypename}</a>
                      	</c:if>
                    </p>
                      </div>
                    </div>
                    <div class="footer-desc">
                      <form class="cart" id="addCartForm">
                        <div class="quantity buttons-added">
                         <span>库存:${product.productquantity}</span>
                        </div>
                        <input class="btn btn-wishlist btn-brand-ghost no-radius" id="addWishlist-btn" productid="${product.productid}" value="添加到心愿单">
                        <input class="btn btn-brand no-radius" id="addCart-btn" productid="${product.productid}" value="添加到购物车">
                      </form>
                    </div>
                  </div>
                  <div class="product-meta">
                    <span>商品描述:</span><p>${product.productdetail} </p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container">
          <div class="relate-product">
            <div class="heading-wrapper text-center">
              <h3 class="heading">相关产品</h3>
            </div>
            <div class="row">
              <div class="carousel-product">
              
              
              	<c:forEach items="${products}" var="item">
	                <div class="item">
	                  <figure class="item">
	                    <div class="product product-style-1">
	                      <div class="img-wrapper">
	                        <a href="javascript:void(0)" onclick="window.location.href='${basepath}/product/detail?productid=${item.productid }'">
	                          <img class="img-responsive" src="${item.productsrc}" alt="product thumbnail">
	                        </a>
	                        <div class="product-control-wrapper bottom-right">
	                          <div class="wrapper-control-item item-wish-list">
	                            <a class="js-wish-list js-notify-add-wish-list animate-icon-wish-list" href="javascript:void(0)" productid="${item.productid}">
	                              <span class="lnr lnr-heart"></span>
	                            </a>
	                          </div>
	                          <div class="wrapper-control-item item-add-cart js-action-add-cart">
	                            <a class="animate-icon-cart" href="javascript:void(0)" productid="${item.productid}">
	                              <span class="lnr lnr-cart"></span>
	                            </a>
	                            <svg x="0px" y="0px" width="36px" height="32px" viewbox="0 0 36 32">
	                              <path stroke-dasharray="19.79 19.79" fill="none" ,="," stroke-width="2" stroke-linecap="square" stroke-miterlimit="10" d="M9,17l3.9,3.9c0.1,0.1,0.2,0.1,0.3,0L23,11"></path>
	                            </svg>
	                          </div>
	                        </div>
	                      </div>
	                      <figcaption class="desc text-center">
	                        <h3>
	                          <a class="product-name" href="#">${item.productname}</a>
	                        </h3>
	                        <span class="price">￥${item.productprice}元</span>
	                      </figcaption>
	                    </div>
	                  </figure>
	                </div>
	               
	             </c:forEach>   
	             
              </div>
            </div>
          </div>
        </div>
      </section>
    </div>


<!-- footer -->
	<jsp:include page="./footer.jsp" />
	
	<script type="text/javascript">
	/* 商品detail */
	//添加到购物车
	$("#addCart-btn").click(function() {
		var productid = $(this).attr("productid");
		//var quantity = $("#quantity-btn").val();
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
				//alert(result.code);
				if (result.code == 100) {
					alert("添加成功");
				}else{
					alert(result.extend.error);
				}
			}
		});  
	});
	
	
	//添加到心愿单
	$("#addWishlist-btn").click(function() {
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
	
	/* 相关商品 */
	//添加到购物车
	$(".animate-icon-cart").click(function() {
		//	alert($(".productid").val());
		//	alert($(".check-item").is(":checked"));
		//var username = $(this).parents("tr").find("td:eq(2)").text();
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
				//			alert(result.code);
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
				//alert(result.code);
				if (result.code == 100) {
					alert("添加成功");
				}else{
					alert(result.extend.error);
				}
			}
		});
	});
	
	
</script>