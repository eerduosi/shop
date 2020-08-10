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
								<button class="btn btn-primary" id="address_add_modal_btn">
									<span class="glyphicon glyphicon-pencil"></span>新增
								</button>
								<button class="btn btn-danger" id="address_delete_all_btn">
									<span class="glyphicon glyphicon-trash"></span>批量删除
								</button>

								<input class="form-control input-sm pull-right"
									name="table_search" type="text" style="width: 150px;"
									placeholder="Search" />
								<div class="input-group-btn">
									<button class="btn btn-sm btn-default">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</div>
						</div>
						<table class="table table-hover" id="address_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<!-- <th>#</th> -->
									<!-- <th>用户名</th> -->
									<th>收件人</th>
									<th>手机号</th>
									<th>地址</th>
									<th>邮编</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										<td><input type="checkbox" class="check-item" /></td>
										<%-- <td>${item.addressid}</td> --%>
										<%-- <td>${item.user.username}</td> --%>
										<td>${item.receivername }</td>
										<td>${item.receiverphone}</td>
										<td>${item.receiveraddress}</td>
										<td>${item.receiverzip}</td>
										<td><button class="btn btn-primary btn-sm edit-btn"
												edit-addressid="${item.addressid}">
												<span class="glyphicon glyphicon-pencil"></span>编辑
											</button>
											<button class="btn btn-danger btn-sm delete-btn"
												delete-addressid="${item.addressid}">
												<span class="glyphicon glyphicon-trash"></span>删除
											</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<!-- /.box-body -->
				</div>
				<!-- /.box -->
				<!-- 显示分页信息 -->
				<div class="row col-md-offset-1">
					<!-- 分页文字信息 -->
					<div class="col-md-6" id="page_info_area">当前
						${pageInfo.pageNum}页,总${pageInfo.pages} 页,总 ${pageInfo.total}
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
									<li><a href="${basepath}/address/view?pagenumber=1">首页</a></li>
									<li><a
										href="${basepath}/address/view?pagenumber=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum}">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum}">
										<li><a
											href="${basepath}/address/view?pagenumber=${page_Num}">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/address/view?pagenumber=${pageInfo.pageNum+1}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/address/view?pagenumber=${pageInfo.pages}">末页</a></li>
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

<!-- 地址添加模块 -->
<div class="modal fade" id="addressAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">地址添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group" style="display: none">
						<label class="col-sm-2 control-label">用户</label>
						<div class="col-sm-4">
								<input type="text" name="username" class="form-control" id="username_add_input" placeholder="用户" disabled="disabled" />
								<input type="test" name="userid" class="form-control" id="userid_add_input" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">收件人</label>
						<div class="col-sm-10">
							<input type="test" name="receivername" class="form-control"
								id="receivername_add_input" placeholder="收件人" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="receiverphone" class="form-control"
								id="receiverphone_add_input" placeholder="手机号" /> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" name="receiveraddress" class="form-control"
								id="receiveraddress_add_input" placeholder="地址" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">邮编</label>
						<div class="col-sm-10">
							<input type="text" name="receiverzip" class="form-control"
								id="receiverzip_add_input" placeholder="邮编" />
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="address_add_btn">保存</button>
			</div>
		</div>
	</div>
</div>

<!-- 地址修改模块 -->
<div class="modal fade" id="addressUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">用户修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">
					<div class="form-group" style="display: none">
						<label class="col-sm-2 control-label">用户</label>
						<div class="col-sm-4">
							<input type="text" name="username" class="form-control" id="username_update_input" placeholder="用户" disabled="disabled" />
								<input type="test" name="userid" class="form-control" id="userid_update_input" />
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">收件人</label>
						<div class="col-sm-10">
							<input type="test" name="receivername" class="form-control"
								id="receivername_update_input" placeholder="收件人"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="receiverphone" class="form-control"
								id="receiverphone_update_input" placeholder="手机号"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">地址</label>
						<div class="col-sm-10">
							<input type="text" name="receiveraddress" class="form-control"
								id="receiveraddress_update_input" placeholder="地址"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">邮编</label>
						<div class="col-sm-10">
							<input type="text" name="receiverzip" class="form-control"
								id="receiverzip_update_input" placeholder="邮编"> <span
								class="help-block"></span>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="address_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>




<script type="text/javascript">
	//清空span提示的样式和内容
	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}

	//"新增"click
	$("#address_add_modal_btn").click(function() {

		//清除表单数据
		reset_form("#addressAddModal form");
		
		getUser("#userid_add_input");

		//弹出模态框
		$("#addressAddModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});
	
	
	
	function getUser(ele) {

		$(ele).empty();

		$.ajax({
			url : "${basepath}/username",
			type : "GET",
			success : function(result) {
				//console.log(result);
				//在select中显示用户
				/* $("#producttype_add_select") */
				var userData = result.extend.user;
					$(ele).attr("value",userData.userid);
					$("#username_add_input").attr("value",userData.username);
					$("#username_update_input").attr("value",userData.username);
					
			}
		});
	}

	

	//"保存"click事件
	$("#address_add_btn").click(function() {
		//1.//校验输入内容是否合法
		if (!validata_add_form()) {
			return false;
		}
		
		//2.发送ajax保存用户信息
		$.ajax({
			url : "${basepath}/address/insert",
			type : "POST",
			data : $("#addressAddModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				//1.关闭模态框
				$("#addressAddModal").modal('hide');
				//2.页面跳转到最后一页,显示新增保存数据
				window.location.reload();
			}
		});
	});

	//有效值验证
	function validata_add_form() {
		//使用正则表达式校验格式是否合法
		
		var receiverphone = $("#receiverphone_add_input").val();
		var regName = /^1[0-9]{10}$/;
		if (!regName.test(receiverphone)) {
			//校验失败
			show_validata_message("#receiverphone_add_input", "error",
					"请输入十一位数字作为手机号");
			return false;
		} else {
			show_validata_message("#receiverphone_add_input", "success", "");
		}

		return true;
	}

	//有效值验证函数
	function show_validata_message(ele, status, message) {
		//清除当前元素的校验状态
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next("sapn").text("");
		if (status == "success") {
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(message);
		} else {
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(message);
		}
	}

	//"on"绑定"click"事件
	$(document).on("click", ".edit-btn", function() {

		//查找用户
		getUser("#userid_update_input");
		
		//查找当前信息并传值到Modal
		findaddress($(this).attr("edit-addressid"));

		$("#address_update_btn").attr("edit-addressid", $(this).attr("edit-addressid"));

		//弹出模态框
		$("#addressUpdateModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//"编辑"回显信息
	function findaddress(addressid) {
		$.ajax({
			url : "${basepath}/address/find/" + addressid,
			type : "GET",
			success : function(result) {
				//console.log(result);
				var addressData = result.extend.address;
				$("#user_update_select").val(
						[ addressData.userid ]);
				$("#receivername_update_input").val(addressData.receivername);
				$("#receiverphone_update_input").val(addressData.receiverphone);
				
				$("#receiveraddress_update_input").val(addressData.receiveraddress);
				$("#receiverzip_update_input").val(addressData.receiverzip);
				
			}
		});
	}

	//"更新"click事件
	$("#address_update_btn")
			.click(
					function() {
						//使用正则表达式校验格式是否合法
						

						var receiverphone = $("#receiverphone_update_input").val();
						var regName = /^[0-9]{11}$/;
						if (!regName.test(receiverphone)) {
							//校验失败
							show_validata_message("#receiverphone_update_input",
									"error", "请输入正确的手机号");
							return false;
						} else {
							show_validata_message("#receiverphone_update_input",
									"success", "");
						}

		

						//2.ajax请求保存用户更新信息
						$.ajax({
							url : "${basepath}/address/update/"
									+ $(this).attr("edit-addressid"),
							type : "PUT",
							data : $("#addressUpdateModal form").serialize(),
							success : function(result) {
								//alert(result.msg);
								//1.关闭模态框
								$("#addressUpdateModal").modal('hide');
								//2.回到当前页
								window.location.reload();
							}
						});
					});

	//单个删除
	$(document).on("click", ".delete-btn", function() {
		//1.弹出对话框
		var address = $(this).parents("tr").find("td:eq(1)").text();
		var addressid = $(this).attr("delete-addressid");
		if (confirm("确认删除地址吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/address/delete/" + addressid,
				type : "DELETE",
				success : function(result) {
					alert(result.msg);
					window.location.reload();
				}
			});
		}
	});

	//删除全选
	$("#check-all").click(function() {
		$(".check-item").prop("checked", $(this).prop("checked"));
	});

	$(document).on("click", ".check-item", function() {
		var flag = $(".check-item:checked").length == $(".check-item").length;
		$("#check-all").prop("checked", flag);

	});
	$("#address_delete_all_btn").click(function() {
		//var address = "";
		var addressids = "";
		$.each($(".check-item:checked"), function() {
			//address += $(this).parents("tr").find("td:eq(1)").text() + ",";
			addressids += $(this).parents("tr").find("td:eq(1)").text() + "-";
		});
		//address = address.substring(0, address.length - 1);
		addressids = addressids.substring(0, addressids.length - 1);
		if (confirm("确认批量删除地址吗?")) {
			$.ajax({
				url : "${basepath}/address/delete/" + addressids,
				type : "DELETE",
				success : function(result) {
					alert(result.msg);
					window.location.reload();
				}
			});
		}
	});
</script>
</body>
</html>