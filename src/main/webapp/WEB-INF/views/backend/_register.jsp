<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<!-- 引入JQuery -->
<script src="${basepath}/static/js/jquery.min.js"></script>
<!-- 引入bootstrap样式 -->
<link href="${basepath}/static/css/bootstrap.min.css" rel="stylesheet">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="${basepath}/static/js/bootstrap.min.js"></script>
</head>
<body>

	<hr />
	<div class="modal-body" id="usersAddModal">
		<form <%-- action="${basepath}/user/register" --%> method="post"
			class="form-horizontal">

			<div class="form-group">
				<label class="col-sm-2 control-label">用户名</label>
				<div class="col-sm-4">
					<input type="text" name="username" class="form-control"
						id="username_add_input" placeholder="用户名"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">密码</label>
				<div class="col-sm-4">
					<input type="password" name="userpassword" class="form-control"
						id="userpassword_add_input" placeholder="请输入密码"><span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">手机号</label>
				<div class="col-sm-4">
					<input type="text" name="userphone" class="form-control"
						id="userphone_add_input" placeholder="请输入手机号"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">性别</label>
				<div class="col-sm-4">
					<label class="radio-inline"> <input type="radio"
						name="usergender" checked="checked" id="usergender0_add_input"
						value="0"> 女
					</label> <label class="radio-inline"> <input type="radio"
						name="usergender" id="usergender1_add_input" value="1"> 男
					</label>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">安全问题</label>
				<div class="col-sm-4">
					<input type="text" name="userquestion" class="form-control"
						id="userquestion_add_input" placeholder="请输入安全问题"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<label class="col-sm-2 control-label">请输入安全问题答案</label>
				<div class="col-sm-4">
					<input type="text" name="useranswer" class="form-control"
						id="useranswer_add_input" placeholder="安全问题答案"> <span
						class="help-block"></span>
				</div>
			</div>

			<div class="form-group">
				<!-- <label class="col-sm-2 control-label">用户类型</label> -->
				<div class="col-sm-4">
					<label class="radio-inline"> <input type="radio"
						name="usertype" checked="checked" style="display: none"
						id="usertype0_add_input" value="0">
					</label>
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-4">
					<button type="submit" class="btn btn-primary" id="users_save_btn">注册</button>
				</div>
			</div>

		</form>
	</div>
	<script type="text/javascript">
	
	$("#username_add_input").change(
			function() {
				//发送ajax请求校验用户名是否重复
				var username = this.value;
				$.ajax({
					url : "${basepath}/user/checkusername",
					data : "username=" + username,
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							//alert(result.code);
							show_validata_message("#username_add_input",
									"success", "");
							$("#user_save_btn").attr("ajax-valid-username",
									"success");
						} else {
							//alert(result.code);
							show_validata_message("#username_add_input",
									"error", "用户名重复");
							$("#user_save_btn").attr("ajax-valid-username",
									"error");
						}
					}
				});
			});
	$("#userphone_add_input").change(
			function() {
				//发送ajax请求校验手机号是否可用
				var userphone = this.value;
				$.ajax({
					url : "${basepath}/user/checkuserphone",
					data : "userphone=" + userphone,
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							//alert(result.code);
							show_validata_message("#userphone_add_input",
									"success", "");
							$("#user_save_btn").attr(
									"ajax-valid-userphone", "success");
						} else {
							//alert(result.code);
							show_validata_message("#userphone_add_input",
									"error", "手机号已注册");
							$("#user_save_btn").attr(
									"ajax-valid-userphone", "error");
						}
					}
				});
			});

		$("#users_save_btn").click(function() {
			//校验输入内容是否合法
			if (!validata_add_form()) {
				return false;
			}
			//2.ajax校验用户名,手机号重复
			if ($(this).attr("ajax-valid-username")=="error") {
				return false;
			}
			if ($(this).attr("ajax-valid-userphone")=="error") {
				return false;
			}
			//3.发送ajax保存用户信息
			$.ajax({
				url : "${basepath}/personal/register",
				type : "POST",
				data : $("#usersAddModal form").serialize(),
				success : function(result) {
					alert("注册成功,请进行登录");
					location.href = "${basepath}/login";
				}
			});
		});
		function validata_add_form() {
			//1.正则表达式校验格式是否合法
			var username = $("#username_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
			if (!regName.test(username)) {
				//校验失败
				show_validata_message("#username_add_input", "error",
						"请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
				return false;
			} else {
				show_validata_message("#username_add_input", "success", "");
			}
			var userpassword = $("#userpassword_add_input").val();
			var regName = /^[a-zA-Z0-9]{6,16}$/;
			if (!regName.test(userpassword)) {
				//校验失败
				show_validata_message("#userpassword_add_input", "error",
						"请输入6到16位密码密码");
				return false;
			} else {
				show_validata_message("#userpassword_add_input", "success", "");
			}
			var userphone = $("#userphone_add_input").val();
			var regName = /^[0-9]{11}$/;
			if (!regName.test(userphone)) {
				//校验失败
				show_validata_message("#userphone_add_input", "error",
						"请输入正确的手机号");
				return false;
			} else {
				show_validata_message("#userphone_add_input", "success", "");
			}
			var userquestion = $("#userquestion_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]$)|(^[\u2E80-\u9FFF])/;
			if (!regName.test(userquestion)) {
				//校验失败
				show_validata_message("#userquestion_add_input", "error",
						"请输入安全问题");
				return false;
			} else {
				show_validata_message("#userquestion_add_input", "success", "");
			}
			var useranswer = $("#useranswer_add_input").val();
			var regName = /(^[a-zA-Z0-9_-]$)|(^[\u2E80-\u9FFF])/;
			if (!regName.test(useranswer)) {
				//校验失败
				show_validata_message("#useranswer_add_input", "error",
						"请输入安全问题答案");
				return false;
			} else {
				show_validata_message("#useranswer_add_input", "success", "");
			}
			return true;
		}

		//显示校验提示信息
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
	</script>
</body>
</html>