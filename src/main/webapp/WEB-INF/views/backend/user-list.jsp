<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- basepath为绝对路径 -->
<%
	pageContext.setAttribute("basepath", request.getContextPath());
%>
<jsp:include page="./header.jsp"></jsp:include>
<jsp:include page="./leftside.jsp"></jsp:include>


<!-- Right side column. Contains the navbar and content of the page -->
<aside class="right-side">
	<!-- Main content -->
	<section class="content">


		<div class="row">
			<div class="col-xs-12">
				<div class="panel">
					<header class="panel-heading">
						<b>用户列表</b>
					</header>
					<!-- <div class="box-header"> -->
					<!-- <h3 class="box-title">Responsive Hover Table</h3> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
								<button class="btn btn-primary" id="user_add_modal_btn">
									<span class="glyphicon glyphicon-pencil"></span>新增
								</button>
								<button class="btn btn-danger" id="user_delete_all_btn">
									<span class="glyphicon glyphicon-trash"></span>批量删除
								</button>

								
							</div>
						</div>
						<table class="table table-hover" id="user_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<th>#</th>
									<th>用户名</th>
									<th>登录密码</th>
									<th>手机号</th>
									<th>性别</th>
									<th>安全问题</th>
									<th>答案</th>
									<th>用户类型</th>
									<th>注册时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										<td><input type="checkbox" class="check-item" /></td>
										<td>${item.userid}</td>
										<td>${item.username}</td>
										<td><input type="password" value="${item.userpassword}" readonly="readonly" disabled="disabled"/></td>
										<td>${item.userphone}</td>
										<td>${item.usergender == 1 ? "男" : "女"}</td>
										<td>${item.userquestion}</td>
										<td>${item.useranswer}</td>
										<td>${item.usertype == 1 ? "管理员" : "普通用户"}</td>
										<td>${item.usercreatetime}</td>
										<td>${item.userupdatetime}</td>
										<td><button class="btn btn-primary btn-sm edit-btn"
												edit-userid="${item.userid}">
												<span class="glyphicon glyphicon-pencil"></span>编辑
											</button>
											<button class="btn btn-danger btn-sm delete-btn"
												delete-userid="${item.userid}">
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
									<li><a href="${basepath}/user/view?pagenumber=1">首页</a></li>
									<li><a
										href="${basepath}/user/view?pagenumber=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/user/view?pagenumber=${page_Num }">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/user/view?pagenumber=${pageInfo.pageNum+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/user/view?pagenumber=${pageInfo.pages}">末页</a></li>
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

<!-- 用户添加模块 -->
<div class="modal fade" id="userAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">用户添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">

					<div class="form-group">
						<label class="col-sm-2 control-label">用户名</label>
						<div class="col-sm-10">
							<input type="text" name="username" class="form-control"
								id="username_add_input" placeholder="用户名"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">用户密码</label>
						<div class="col-sm-10">
							<input type="password" name="userpassword" class="form-control"
								id="userpassword_add_input" placeholder="密码"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">手机号</label>
						<div class="col-sm-10">
							<input type="text" name="userphone" class="form-control"
								id="userphone_add_input" placeholder="手机号"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">性别</label>
						<div class="col-sm-10">
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
						<label class="col-sm-2 control-label">安全问题</label>
						<div class="col-sm-10">
							<input type="text" name="userquestion" class="form-control"
								id="userquestion_add_input" placeholder="安全问题"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">安全问题答案</label>
						<div class="col-sm-10">
							<input type="text" name="useranswer" class="form-control"
								id="useranswer_add_input" placeholder="安全问题答案"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
								name="usertype" id="usertype0_add_input" value="0"
								checked="checked"> 普通用户
							</label> <label class="radio-inline"> <input type="radio"
								name="usertype" id="usertype1_add_input" value="1"> 管理员
							</label>
						</div>
					</div>
				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="user_add_btn">保存</button>
			</div>
		</div>
	</div>
</div>

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

					<div class="form-group">
						<label class="col-sm-2 control-label">用户类型</label>
						<div class="col-sm-10">
							<label class="radio-inline"> <input type="radio"
								name="usertype" id="usertype0_update_input" value="0">
								普通用户
							</label> <label class="radio-inline"> <input type="radio"
								name="usertype" id="usertype1_update_input" value="1">
								管理员
							</label>
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




<script type="text/javascript">
	//清空span提示的样式和内容
	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}

	//"新增"click
	$("#user_add_modal_btn").click(function() {

		//清除表单数据
		reset_form("#userAddModal form");

		//弹出模态框
		$("#userAddModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//username"change"事件
	$("#username_add_input").change(function() {
		//发送ajax请求校验用户名是否重复
		var username = this.value;
		$.ajax({
			url : "${basepath}/user/checkusername",
			data : "username=" + username,
			success : function(result) {
				if (result.code == 100) {
					//alert(result.code);
					show_validata_message("#username_add_input",
							"success", "");
					$("#user_add_btn").attr("ajax-valid-username",
							"success");
				} else {
					//alert(result.code);
					show_validata_message("#username_add_input",
							"error", result.extend.error);
					$("#user_add_btn").attr("ajax-valid-username",
							"error");
				}
			}
		});
	});
	//userphone"change"事件
	$("#userphone_add_input").change(function() {
		//发送ajax请求校验手机号是否可用
		var userphone = this.value;
		$.ajax({
			url : "${basepath}/user/checkuserphone",
			data : "userphone=" + userphone,
			success : function(result) {
				if (result.code == 100) {
					//alert(result.code);
					show_validata_message("#userphone_add_input",
							"success", "");
					$("#user_add_btn").attr("ajax-valid-userphone",
							"success");
				} else {
					//alert(result.code);
					show_validata_message("#userphone_add_input",
							"error", result.extend.error);
					$("#user_add_btn").attr("ajax-valid-userphone",
							"error");
				}
			}
		});
	});

	//"保存"click事件
	$("#user_add_btn").click(function() {
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
			url : "${basepath}/user/insert",
			type : "POST",
			data : $("#userAddModal form").serialize(),
			success : function(result) {
				if(result.code == 100){
					alert(result.msg);
					//1.关闭模态框
					$("#userAddModal").modal('hide');
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
		//1.使用正则表达式校验格式是否合法
		var username = $("#username_add_input").val();
		var regName = /^([a-zA-Z0-9_-]{6,16})|([\u2E80-\u9FFF]{2,5})$/;
		if (!regName.test(username)) {
			//校验失败
			show_validata_message("#username_add_input",
					"error", "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
			return false;
		} else {
			show_validata_message("#username_add_input",
					"success", "");
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
			show_validata_message("#userquestion_add_input", "error", "请输入安全问题");
			return false;
		} else {
			show_validata_message("#userquestion_add_input", "success", "");
		}

		var useranswer = $("#useranswer_add_input").val();
		var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
		if (!regName.test(useranswer)) {
			//校验失败
			show_validata_message("#useranswer_add_input", "error", "请输入安全问题答案");
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

	//"on"绑定"click"事件
	$(document).on("click", ".edit-btn", function() {
		
		
		//清除表单数据
		reset_form("#userUpdateModal form");
		

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
							"error", result.extend.error);
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
							"error", result.extend.error);
					$("#user_update_btn").attr("ajax-valid-userphone",
							"error");
				}
			}
		});
	});
	
	
	
	//有效值验证
	function validata_update_form() {
		//1.使用正则表达式校验格式是否合法
		var username = $("#username_update_input").val();
		var regName = /^([a-zA-Z0-9_-]{6,16})|(^[\u2E80-\u9FFF]{2,5})$/;
		if (!regName.test(username)) {
			//校验失败
			show_validata_message("#username_update_input","error", "请输入2到5位中文,或者6到16位英文或数字的组合作为用户名");
			return false;
		} else {
			show_validata_message("#username_update_input","success", "");
		}

		var userpassword = $("#userpassword_update_input").val();
		var regName = /^[a-zA-Z0-9]{6,16}$/;
		if (!regName.test(userpassword)) {
			//校验失败
			show_validata_message("#userpassword_update_input",	"error", "请输入6到16位密码");
			return false;
		} else {
			show_validata_message("#userpassword_update_input",	"success", "");
		}

		var userphone = $("#userphone_update_input").val();
		var regName = /^1[0-9]{10}$/;
		if (!regName.test(userphone)) {
			//校验失败
			show_validata_message("#userphone_update_input","error", "请输入十一位手机号");
			return false;
		} else {
			show_validata_message("#userphone_update_input","success", "");
		}

		var userquestion = $("#userquestion_update_input").val();
		var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
		if (!regName.test(userquestion)) {
			//校验失败
			show_validata_message("#userquestion_update_input","error", "请输入安全问题");
			return false;
		} else {
			show_validata_message("#userquestion_update_input","success", "");
		}

		var useranswer = $("#useranswer_update_input").val();
		var regName = /^([a-zA-Z0-9_-])|([\u2E80-\u9FFF])$/;
		if (!regName.test(useranswer)) {
			//校验失败
			show_validata_message("#useranswer_update_input","error", "请输入安全问题答案");
			return false;
		} else {
			show_validata_message("#useranswer_update_input","success", "");
		}
		return true;
	}
	
	

	//"更新"click事件
	$("#user_update_btn").click(function() {
		
		//1.//校验输入内容是否合法
		if (!validata_update_form()) {
			return false;
		}
		
		//用户名重复
		if ($(this).attr("ajax-valid-username") == "error") {
			
			show_validata_message("#username_update_input",
					"error", "用户名重复");
			
			return false;
		}
		
		if ($(this).attr("ajax-valid-userphone") == "error") {
			
			show_validata_message("#userphone_update_input",
					"error", "手机号已注册");
			
			return false;
		}

		//2.ajax请求保存用户更新信息
		$.ajax({
			url : "${basepath}/user/update/"
					+ $(this).attr("edit-userid"),
			type : "PUT",
			data : $("#userUpdateModal form").serialize(),
			success : function(result) {
				if(result.code == 100){
					alert(result.msg);
					//1.关闭模态框
					$("#userUpdateModal").modal('hide');
					//2.回到当前页
					window.location.reload();
				}else{
					
					alert(result.extend.error);
				}
			}
		});
	});

	//单个删除
	$(document).on("click", ".delete-btn", function() {
		//1.弹出对话框
		var username = $(this).parents("tr").find("td:eq(2)").text();
		var userid = $(this).attr("delete-userid");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		//alert($(this).attr("delete-userid"));
		if (confirm("确认删除用户[" + username + "]吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/user/delete/" + userid,
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

	//全选
	$("#check-all").click(function() {
		$(".check-item").prop("checked", $(this).prop("checked"));
	});

	$(document).on("click", ".check-item", function() {
		var flag = $(".check-item:checked").length == $(".check-item").length;
		$("#check-all").prop("checked", flag);

	});
	$("#user_delete_all_btn").click(function() {
		var username = "";
		var userids = "";
		$.each($(".check-item:checked"), function() {
			username += $(this).parents("tr").find("td:eq(2)").text() + ",";
			userids += $(this).parents("tr").find("td:eq(1)").text() + "-";
		});
		username = username.substring(0, username.length - 1);
		userids = userids.substring(0, userids.length - 1);
		if (confirm("确认删除用户[" + username + "]吗?")) {
			$.ajax({
				url : "${basepath}/user/delete/" + userids,
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
</script>
</body>
</html>
