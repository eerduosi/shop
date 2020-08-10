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
						<b>全部订单</b>
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
									<th>订单金额</th>
									<th>收货人</th>
									<th>发货时间</th>
									<th>完成时间</th>
									<th>创建时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										
										<input type="hidden" value="${item.orderid}" />
										<td>${item.user.username}</td>
										<td><a href="javascript:void(0)" onclick="window.location.href='${basepath}/orderdetail/view?orderno=${item.orderno}'">${item.orderno}</a></td>
										<td>${item.ordercash}</td>
										<td><a href="javascript:void(0)" onclick="window.location.href='${basepath}/address/view?addressid=${item.addressid}'">${item.address.receivername}</a></td>
										<td>${item.ordersendtime!=null?item.ordersendtime:"未发货"}</td>
										<td>${item.orderendtime!=null?item.orderendtime:"订单未完成"}</td>
										<td>${item.ordercreatetime}</td>
										<td>${item.orderupdatetime}</td>
										<td>
											<c:if test="${item.ordersendtime==null}">
											<button class="btn btn-primary btn-sm send-btn"
												send-orderid="${item.orderid}">发货
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											</c:if>
											<c:if test="${item.ordersendtime!=null&&item.orderendtime==null}">
											<button class="btn btn-info btn-sm"
												send-orderid="${item.orderid}">已发货
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											</c:if>
											<c:if test="${item.orderendtime!=null}">
											<button class="btn btn-success btn-sm"
												send-orderid="${item.orderid}">已完成
												<span class="glyphicon glyphicon-pencil"></span>
											</button>
											</c:if>
										</td>
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
									<li><a href="${basepath}/orders/view?pagenumber=1">首页</a></li>
									<li><a
										href="${basepath}/orders/view?pagenumber=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/orders/view?pagenumber=${page_Num}">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/orders/view?pagenumber=${pageInfo.pageNum+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/orders/view?pagenumber=${pageInfo.pages}">末页</a></li>
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

	$(document).on("click", ".send-btn", function() {
		//1.弹出对话框
		var order = $(this).parents("tr").find("td:eq(1)").text();
		var orderid = $(this).attr("send-orderid");
		if (confirm("确认派送订单" + order + "吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/order/send/" + orderid,
				type : "POST",
				success : function(result) {
					if (result.code == 100) {
						alert(result.extend.success);
						window.location.reload();
					} else {
						alert(result.extend.error);
					}
				}
			});
		}
	});

</script>