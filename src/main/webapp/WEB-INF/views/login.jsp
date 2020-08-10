<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录页面</title>
<!-- 引入JQuery -->
<script src="${basepath}/static/login/js/jquery.js"></script>
<!-- 引入bootstrap样式 -->
<link rel="stylesheet"
	href="${basepath }/static/login/css/bootstrap.css">
<!-- Loding font -->
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,700"
	rel="stylesheet">

<!-- Custom Styles -->
<link rel="stylesheet" type="text/css"
	href="${basepath }/static/login/css/styles.css">
<!-- 加载 Bootstrap 的所有 JavaScript 插件。也可以根据需要只加载单个插件。 -->
<script src="${basepath}/static/login/js/bootstrap.js"></script>
</head>
<body>
	<!-- Backgrounds -->

	<div id="login-bg" class="container-fluid">

		<div class="bg-img"></div>
		<div class="bg-color"></div>
	</div>

	<!-- End Backgrounds -->

	<div class="container" id="login">
		<div class="row justify-content-center">
			<div class="col-lg-8">
				<div class="login">

					<h1>登录</h1>

					<!-- Loging form -->
					<form action="${basepath}/login" method="post">
						<div class="form-group">
							<input type="text" name="username" id="username"
								class="form-control" placeholder="用户名" onkeyup="rememberCheck(username.value)" />

						</div>
						<div class="form-group">
							<input type="password" name="userpassword" id="userpassword"
								class="form-control" placeholder="请输入密码" />
						</div>

						<div class="form-check">

							<label class="switch"> <input type="checkbox"
								name="rememberMe" id="rememberMe"> <span
								class="slider round"></span>
							</label> <label class="form-check-label" for="exampleCheck1">记住密码</label>
							<!-- <label class="forgot-password"><a href="">忘记密码?<a></label> -->
							
						</div>

						<br>
						<button type="submit" class="btn btn-lg btn-block btn-success"
							id="user_submit_btn">登录</button>
						<input type="button" class="btn btn-lg btn-block btn-success"
							id="user_add_btn" value="注册"></input>
					</form>

				</div>
			</div>
		</div>
	</div>
	
	
	
	<!-- 用户注册modal -->
	 <div class="modal fade" id="userAddModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">用户注册</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form class="form-horizontal">

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">用户名</label></div>
							<div class="col-sm-8">
								<input type="text" name="username" class="form-control"
									id="username_add_input" placeholder="用户名"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">密码</label></div>
							<div class="col-sm-8">
								<input type="password" name="userpassword" class="form-control"
									id="userpassword_add_input" placeholder="密码"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">手机号</label></div>
							<div class="col-sm-8">
								<input type="text" name="userphone" class="form-control"
									id="userphone_add_input" placeholder="手机号"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">性别</label></div>
							<div class="col-sm-8">
								<label class="radio-inline"> <input type="radio"
									name="usergender" checked="checked" id="usergender0_add_input"
									value="0"> 女
								</label> <label class="radio-inline"> <input type="radio"
									name="usergender" id="usergender1_add_input" value="1">
									男
								</label>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">安全问题</label></div>
							<div class="col-sm-8">
								<input type="text" name="userquestion" class="form-control"
									id="userquestion_add_input" placeholder="安全问题"> <span
									class="help-block"></span>
							</div>
						</div>

						<div class="form-group">
							<div class="col-sm-4"><label class="control-label">答案</label></div>
							<div class="col-sm-8">
								<input type="text" name="useranswer" class="form-control"
									id="useranswer_add_input" placeholder="答案"> <span
									class="help-block"></span>
							</div>
						</div>

						
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary" id="user_save_btn">保存</button>
				</div>
			</div>
		</div>
	</div> 
	<script type="text/javascript">
		//寻找Cookie
		function rememberCheck(string){
    	$.ajax({
		        type:"POST",
		        url: "${basepath}/getCookie", 
		        dataType:"json",
		        data:{
		            username:string,
		        },
		        success:function(data){
		        	$("#username").val(data.username);
					$("#userpassword").val(data.userpassword);
		        },
		        error:function() {
		        	$("#userpassword").val("");
		        }
		    });
		};
			
		
		
		//用户注册js
		//清空span提示的样式和内容
		function reset_form(ele) {
			$(ele)[0].reset();
			$(ele).find("*").removeClass("has-error has-success");
			$(ele).find(".help-block").text("");
		}

		//"新增"click
		$("#user_add_btn").click(function() {

			//清除表单数据
			reset_form("#userAddModal form")

			//弹出模态框
			$("#userAddModal").modal({
				keyboard : false,
				backdrop : "static"
			});
		});

		//username"change"事件
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
							show_validata_message("#username_add_input","error", result.extend.error);
							$("#user_save_btn").attr("ajax-valid-username",
									"error");
						}
					}
				});
			});
		//userphone"change"事件
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
							show_validata_message("#userphone_add_input","error", result.extend.error);
							$("#user_save_btn").attr("ajax-valid-userphone", "error");
						}
					}
				});
			});

		//"保存"click事件
		$("#user_save_btn").click(function() {
			//1.//校验输入内容是否合法
			if (!validata_add_form()) {
				return false;
			}
			//2.ajax校验用户名,手机号重复
			//用户名重复
			if ($(this).attr("ajax-valid-username") == "error") {
				
				show_validata_message("#username_add_input",
						"error", "用户名重复");
				
				return false;
			}
			//用户名重复
			if ($(this).attr("ajax-valid-userphone") == "error") {
				
				show_validata_message("#userphone_add_input",
						"error", "手机号已注册");
				
				return false;
			}
			//3.发送ajax保存用户信息
			$.ajax({
				url : "${basepath}/user/regist",
				type : "POST",
				data : $("#userAddModal form").serialize(),
				success : function(result) {
					//alert(result.msg);
					//1.关闭模态框
					if(result.code == 100){
						$("#userAddModal").modal('hide');
						alert("注册成功,请登录.")
					}else{
						/* if(result.extend.error.username != undefined){
							show_validata_message("#username_add_input",
									"error", "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
						}
						if(result.extend.error.userpassword != undefined){
							show_validata_message("#userpassword_add_input", "error",
							"请输入6到16位字母,数字的组合作为密码");
						}
						if(result.extend.error.userphone != undefined){
							show_validata_message("#userphone_add_input", "error",
							"请输入十一位数字作为手机号");
						}
						if(result.extend.error.userquestion != undefined){
							show_validata_message("#userquestion_add_input", "error", "请输入安全问题");
						}
						if(result.extend.error.useranswer != undefined){
							show_validata_message("#useranswer_add_input", "error", "请输入安全问题答案");
						} */
						alert(result.extend.error);
					}
				}
			});
		});

		//有效值验证
		function validata_add_form() {
			//1.使用正则表达式校验格式是否合法
			var username = $("#username_add_input").val();
			var regName = /^([a-zA-Z0-9_-]{6,16})|([\u2E80-\u9FFF]{2,5})$/;
			if (!regName.test(username)) {
				//校验失败
				show_validata_message("#username_add_input",
						"error", "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
				return false;
			} else {
				show_validata_message("#username_add_input","success", "");
			}
			var userpassword = $("#userpassword_add_input").val();
			var regName = /^[a-zA-Z0-9]{6,16}$/;
			if (!regName.test(userpassword)) {
				//校验失败
				show_validata_message("#userpassword_add_input", "error",
						"请输入6到16位字母,数字的组合作为密码");
				return false;
			} else {
				show_validata_message("#userpassword_add_input", "success", "");
			}

			var userphone = $("#userphone_add_input").val();
			var regName = /^1[0-9]{10}$/;
			if (!regName.test(userphone)) {
				//校验失败
				show_validata_message("#userphone_add_input", "error",
						"请输入十一位数字作为手机号");
				return false;
			} else {
				show_validata_message("#userphone_add_input", "success", "");
			}

			var userquestion = $("#userquestion_add_input").val();
			var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
			if (!regName.test(userquestion)) {
				//校验失败
				show_validata_message("#userquestion_add_input", "error",
						"请输入安全问题");
				return false;
			} else {
				show_validata_message("#userquestion_add_input", "success", "");
			}

			var useranswer = $("#useranswer_add_input").val();
			var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
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
	</script>
</body>
</html>