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
<link rel="stylesheet" type="text/css"
	href="${basepath}/static/frontend/css/bootstrap.min.css" />
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
		<h3 class="heading-style-3">个人中心</h3>
		</section>
		<section class="boxed-sm">
		<div class="container">
			<div class="woocommerce">
				<form class="woocommerce-cart-form">
					<table class="woocommerce-cart-table">
						<thead>
							<tr>
									<th>用户名</th>
									<th>登录密码</th>
									<th>手机号</th>
									<th>性别</th>
									<th>安全问题</th>
									<th>安全问题答案</th>
									<th>修改</th>
								</tr>
						</thead>
						<tbody>

								<tr>

									<td data-title="用户名">${user.username}</td>
									<td data-title="用户密码">${user.userpassword}</td>
									<td data-title="手机号">${user.userphone}</td>
									<td data-title="性别">${user.usergender==1?"男":"女"}</td>
									<td data-title="安全问题">${user.userquestion}</td>
									<td data-title="问题答案">${user.useranswer}</td>
									<td class="product-remove"><a class="remove edit-btn"
										href="javascript:void(0)" edit-userid="${user.userid}">√</a></td>
								</tr>

						</tbody>

					</table>
				</form>

			</div>
		</div>
		
		</section>
	</div>




	<!-- footer -->
	<jsp:include page="./footer.jsp" />





<!-- 用户修改模块 -->
<div class="modal fade" id="userUpdateModal" tabindex="-1" role="dialog"
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

					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control"
								id="username_update_input" placeholder="用户名" userid=""> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-10">
							<input type="password" name="userpassword" class="form-control"
								id="userpassword_update_input" placeholder="密码"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="userphone" class="form-control"
								id="userphone_update_input" placeholder="手机号" userid=""> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
								name="usergender" id="usergender0_update_input" value="0">
								女
							</label> <label class="radio-inline"> <input type="radio"
								name="usergender" id="usergender1_update_input" value="1">
								男
							</label>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">安全问题</label>
						<div class="col-sm-10">
							<input type="text" name="userquestion" class="form-control"
								id="userquestion_update_input" placeholder="安全问题"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">安全问题答案</label>
						<div class="col-sm-10">
							<input type="text" name="useranswer" class="form-control"
								id="useranswer_update_input" placeholder="安全问题答案"> <span
								class="help-block"></span>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="user_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>




</div>
</div>
</div>
<script type="text/javascript">
	

	//"on"绑定"click"事件
	$(document).on("click", ".edit-btn", function() {

		//查找当前员工信息并传值到Modal
		findUser($(this).attr("edit-userid"));

		$("#user_update_btn").attr("edit-userid", $(this).attr("edit-userid"));

		//弹出模态框
		$("#userUpdateModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//"编辑"回显信息
	function findUser(userid) {
		$.ajax({
			url : "${basepath}/user/find/" + userid,
			type : "GET",
			success : function(result) {
				//console.log(result);
				var userData = result.extend.user;
				$("#username_update_input").val(userData.username);
				$("#username_update_input").attr("userid",userData.userid);
				$("#userpassword_update_input").val(userData.userpassword);
				$("#userphone_update_input").val(userData.userphone);
				$("#userphone_update_input").attr("userid",userData.userid);
				$("#userUpdateModal input[name=usergender]").val(
						[ userData.usergender ]);
				$("#userquestion_update_input").val(userData.userquestion);
				$("#useranswer_update_input").val(userData.useranswer);
				$("#userUpdateModal input[name=usertype]").val(
						[ userData.usertype ]);
			}
		});
	}
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
	
	//username"change"事件
	$("#username_update_input").change(function() {
		//发送ajax请求校验用户名是否重复
		var username = this.value;
		var userid = $("#username_update_input").attr("userid");
		$.ajax({
			url : "${basepath}/user/checkusername",
			data : {
				"username" : username,
				"userid" : userid	
			},
			success : function(result) {
				if (result.code == 100) {
					//alert(result.code);
					show_validata_message("#username_update_input",
							"success", "");
					$("#user_update_btn").attr("ajax-valid-username",
							"success");
				} else {
					//alert(result.code);
					show_validata_message("#username_update_input",
							"error", "用户名重复");
					$("#user_update_btn").attr("ajax-valid-username",
							"error");
				}
			}
		});
	});
	//userphone"change"事件
	$("#userphone_update_input").change(function() {
		//发送ajax请求校验手机号是否可用
		var userphone = this.value;
		var userid = $("#userphone_update_input").attr("userid");
		$.ajax({
			url : "${basepath}/user/checkuserphone",
			data : {
				"userphone" : userphone,
				"userid" : userid	
			},
			type : "POST",
			success : function(result) {
				if (result.code == 100) {
					//alert(result.code);
					show_validata_message("#userphone_update_input",
							"success", "");
					$("#user_update_btn").attr("ajax-valid-userphone",
							"success");
				} else {
					//alert(result.code);
					show_validata_message("#userphone_update_input",
							"error", "手机号已注册");
					$("#user_update_btn").attr("ajax-valid-userphone",
							"error");
				}
			}
		});
	});

	//"更新"click事件
	$("#user_update_btn").click(function() {
				//1.使用正则表达式校验格式是否合法
				var username = $("#username_update_input").val();
				var regName = /^([a-zA-Z0-9_-]{6,16})|([\u2E80-\u9FFF]{2,5})$/;
				if (!regName.test(username)) {
					//校验失败
					show_validata_message("#username_update_input",
							"error", "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
					return false;
				} else {
					show_validata_message("#username_update_input",
							"success", "");
				}

				var userpassword = $("#userpassword_update_input")
						.val();
				var regName = /^[a-zA-Z0-9]{6,16}$/;
				if (!regName.test(userpassword)) {
					//校验失败
					show_validata_message("#userpassword_update_input",
							"error", "请输入6到16位密码密码");
					return false;
				} else {
					show_validata_message("#userpassword_update_input",
							"success", "");
				}

				var userphone = $("#userphone_update_input").val();
				var regName = /^[0-9]{11}$/;
				if (!regName.test(userphone)) {
					//校验失败
					show_validata_message("#userphone_update_input",
							"error", "请输入正确的手机号");
					return false;
				} else {
					show_validata_message("#userphone_update_input",
							"success", "");
				}

				var userquestion = $("#userquestion_update_input")
						.val();
				var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
				if (!regName.test(userquestion)) {
					//校验失败
					show_validata_message("#userquestion_update_input",
							"error", "请输入安全问题");
					return false;
				} else {
					show_validata_message("#userquestion_update_input",
							"success", "");
				}

				var useranswer = $("#useranswer_update_input").val();
				var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
				if (!regName.test(useranswer)) {
					//校验失败
					show_validata_message("#useranswer_update_input",
							"error", "请输入安全问题答案");
					return false;
				} else {
					show_validata_message("#useranswer_update_input",
							"success", "");
				}

				//2.ajax请求保存用户更新信息
				$.ajax({
					url : "${basepath}/user/edit/"
							+ $(this).attr("edit-userid"),
					type : "PUT",
					async : false,
					data : $("#userUpdateModal form").serialize(),
					success : function(result) {
						//alert(result.msg);
						if(result.code == 100){
							//1.关闭模态框
							$("#userUpdateModal").modal('hide');
							window.location.reload();
						}else{
							
							alert(result.extend.error);
						}
					}
				});
			});
</script>
