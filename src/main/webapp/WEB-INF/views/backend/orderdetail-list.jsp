<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<jsp:include page="../backend/header.jsp"></jsp:include>
<jsp:include page="../backend/leftside.jsp"></jsp:include>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Main content -->
	<section class="content">


		<div class="row">
			<div class="col-xs-12">
				<div class="panel">
					<header class="panel-heading">
						<b>订单详情</b>
					</header>

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
								
								
								
							</div>
						</div>
						<table class="table table-hover" id="order_table">
							<thead>
								<tr>
									
									
									<th>用户</th>
									<th>订单编号</th>
									<th>商品</th>
									<th>商品价格</th>
									<th>购买数量</th>
									<th>价格小计</th>
									<th>创建时间</th>
									<th>更新时间</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										
										<input type="hidden" value="${item.orderdetailid}" />
										<td>${item.user.username}</td>
										<td>${item.orderno}</a></td>
										<td>${item.product.productname}</td>
										<td>${item.productcurrentprice}</td>
										<td>${item.productquantity}</td>
										<td>${item.producttotalprice}</td>
										<td>${item.orderdetailcreatetime}</td>
										<td>${item.orderdetailupdatetime}</td>
										
									</tr>
								</c:forEach>
							</tbody>
						</table>
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
		</div>
	</section>
	<!-- /.content -->
	<div class="footer-main">Copyright &copy Director, 2020</div>
</aside>
<!-- /.right-side -->

<!-- ./wrapper -->

<script type="text/javascript">


</script>