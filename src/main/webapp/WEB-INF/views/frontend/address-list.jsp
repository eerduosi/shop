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
									<th>#</th>
									<th>收件人</th>
									<th>手机号</th>
									<th>地址</th>
									<th>邮编</th>
									<th>操作</th>
								</tr>
							</tr>
						</thead>
						<tbody>

							<c:forEach items="${pageInfo.list}" var="item">
								<tr>
									<td><input type="radio" name="addressid" value="${item.addressid}" /></td>
									
									
									<td class="product-name" data-title="收件人"><a
										class="product-name" href="javascript:void(0)">${item.receivername}</a></td>
									
									<td class="product-price" data-title="手机号">${item.receiverphone}</td>
									<td class="product-subtotal" data-title="地址">${item.receiveraddress}</td>
									<td class="product-stock-status" data-title="邮编">${item.receiverzip}</td>
									<td class="product-remove"><a class="edit" href="javascript:void(0)" edit-addressid="${item.addressid}">√</a>
									<a class="remove" href="javascript:void(0)" delete-addressid="${item.addressid}">×</a></td>
								</tr>
							</c:forEach>

						</tbody>
						<tfoot>
							<tr>
								<td colspan="6">
									<div class="form-coupon organic-form">
										<div class="form-group">
                         					 <a class="btn btn-brand pill" id="address_add_modal_btn" href="javascript:void(0)">增加</a>
                      					</div>
										<div class="form-group update-cart">
											<a class="btn btn-brand pill" id="submit_order" href="javascript:void(0)">去结算</a>
										</div>
									</div>
								</td>
							</tr>
						</tfoot>
					</table>
				</form>

			</div>
		</div>
		</section>
	</div>


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

<!-- footer -->
<jsp:include page="./footer.jsp" />


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
	
	
	//后端根据session回显用户信息
	function getUser(ele) {

		$(ele).empty();

		$.ajax({
			url : "${basepath}/username",
			type : "GET",
			success : function(result) {
				//console.log(result);
				if(result.code == 100){
					var userData = result.extend.user;
					$(ele).attr("value",userData.userid);
					$("#username_add_input").attr("value",userData.username);
					$("#username_update_input").attr("value",userData.username);
				}else{
					alert(result.extend.error);
				}
					
			}
		});
	}

	

	//"保存"click事件
	$("#address_add_btn").click(function() {
		//1.校验输入内容是否合法
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
				if(result.code == 100){
					alert(result.msg);
					//1.关闭模态框
					$("#addressAddModal").modal('hide');
					//2.页面跳转到最后一页,显示新增保存数据
					window.location.reload();
				}else{
					alert(result.extend.error);
				}
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
	$(document).on("click", ".edit", function() {

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
				if(result.code == 100){
					var addressData = result.extend.address;
					$("#user_update_select").val(
							[ addressData.userid ]);
					$("#receivername_update_input").val(addressData.receivername);
					$("#receiverphone_update_input").val(addressData.receiverphone);
					
					$("#receiveraddress_update_input").val(addressData.receiveraddress);
					$("#receiverzip_update_input").val(addressData.receiverzip);
				}else{
					alert(result.extend.error);
				}
			}
		});
	}

	//"更新"click事件
	$("#address_update_btn").click(function() {
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



		//2.ajax请求保存更新信息
		$.ajax({
			url : "${basepath}/address/update/"+ $(this).attr("edit-addressid"),
			type : "PUT",
			data : $("#addressUpdateModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				if(result.code == 100){
					alert(result.msg);
					//1.关闭模态框
					$("#addressUpdateModal").modal('hide');
					//2.回到当前页
					window.location.reload();
				}else{
					alert(result.extend.error);
				}
			}
		});
	});

	//删除地址
	$(document).on("click", ".remove", function() {
		
		var address = $(this).parents("tr").find("td:eq(1)").text();
		var addressid = $(this).attr("delete-addressid");
		//弹出对话框
		if (confirm("确认删除地址吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/address/delete/" + addressid,
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
	//提交订单
	$(document).on("click","#submit_order",function(){
		var addressid = $('input:radio[name="addressid"]:checked').val();
		$.ajax({
			url : "${basepath}/order/edit",
			data : {
				"addressid" : addressid
			},
			success : function(result) {
				if(result.code==100){
					alert("提交订单成功");
					window.location.href='${basepath}/orders/view';
				}else{
					alert(result.extend.error);
				}
			}
		});
		
	});

</script>