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
						<b>地址列表</b>
					</header>
					<!-- <div class="box-header"> -->
					<!-- <h3 class="box-title">Responsive Hover Table</h3> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
							

							</div>
						</div>
						<table class="table table-hover" id="address_table">
							<thead>
								<tr>
								
									<!-- <th>#</th> -->
									 <th>用户</th> 
									<th>收件人</th>
									<th>手机号</th>
									<th>地址</th>
									<th>邮编</th>
									
								</tr>
							</thead>
							<tbody>
							
									<tr>
										
										<%-- <td>${addresses.addressid}</td> --%>
										<td>${addresses.user.username}</td>
										<td>${addresses.receivername }</td>
										<td>${addresses.receiverphone}</td>
										<td>${addresses.receiveraddress}</td>
										<td>${addresses.receiverzip}</td>
										
									</tr>
								
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				
				
			</div>
	</section>
	<!-- /.content -->
	<div class="footer-main">Copyright &copy Director, 2020</div>
</aside>
<!-- /.right-side -->

<!-- ./wrapper -->






<script type="text/javascript">
	
</script>
</body>
</html>