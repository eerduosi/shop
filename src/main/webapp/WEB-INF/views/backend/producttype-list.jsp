<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
						<b>商品类型</b>
					</header>
					<!-- <div class="box-header"> -->
					<!-- <h3 class="box-title">Responsive Hover Table</h3> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
								<button class="btn btn-primary" id="producttype_add_modal_btn">
									<span class="glyphicon glyphicon-pencil"></span>新增
								</button>
								<button class="btn btn-danger" id="producttype_delete_all_btn">
									<span class="glyphicon glyphicon-trash"></span>批量删除
								</button>

								
							</div>
						</div>
						<table class="table table-hover" id="producttype_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<th>#</th>
									<th>商品类型</th>
									<th>添加时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										<td><input type="checkbox" class="check-item" /></td>
										<td>${item.producttypeid}</td>
										<td><a href="javascript:void(0)" onclick="window.location.href='${basepath}/product/view?producttypeid=${item.producttypeid}'">${item.producttypename}</a></td>
										<td>${item.producttypecreatetime}</td>
										<td>${item.producttypeupdatetime}</td>
										<td><button class="btn btn-primary btn-sm edit-btn"
												edit-producttypeid="${item.producttypeid}">
												<span class="glyphicon glyphicon-pencil"></span>编辑
											</button>
											<button class="btn btn-danger btn-sm delete-btn"
												delete-producttypeid="${item.producttypeid}">
												<span class="glyphicon glyphicon-trash"></span>删除
											</button></td>
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
						${pageInfo.pageNum}页,总${pageInfo.pages} 页,总 ${pageInfo.total }
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
									<li><a href="${basepath}/producttype/view?pagenumber=1">首页</a></li>
									<li><a
										href="${basepath}/producttype/view?pagenumber=${pageInfo.pageNum-1}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum}">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/producttype/view?pagenumber=${page_Num }">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/producttype/view?pagenumber=${pageInfo.pageNum+1 }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/producttype/view?pagenumber=${pageInfo.pages}">末页</a></li>
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



<!-- 商品类型添加模块 -->
<div class="modal fade" id="producttypeAddModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">商品类型添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">

					<div class="form-group">
						<label class="col-sm-2 control-label">商品类型</label>
						<div class="col-sm-10">
							<input type="text" name="producttypename" class="form-control"
								id="producttypename_add_input" placeholder="商品类型"> <span
								class="help-block"></span>
						</div>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					id="producttype_add_btn">保存</button>
			</div>
		</div>
	</div>
</div>

<!-- 商品类型修改模块 -->
<div class="modal fade" id="producttypeUpdateModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">商品类型修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">

					<div class="form-group">
						<label class="col-sm-2 control-label">商品类型</label>
						<div class="col-sm-10">
							<input type="text" name="producttypename" class="form-control"
								id="producttypename_update_input" placeholder="商品类型"> <span
								class="help-block"></span>
						</div>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					id="producttype_update_btn">更新</button>
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
	$("#producttype_add_modal_btn").click(function() {

		//清除表单数据
		reset_form("#producttypeAddModal form");

		//弹出模态框
		$("#producttypeAddModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//producttypename"change"事件
	$("#producttypename_add_input").change(
			function() {
				//发送ajax请求校验商品类型是否重复
				var producttypename = this.value;
				$.ajax({
					url : "${basepath}/producttype/checkproducttypename",
					data : "producttypename=" + producttypename,
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							//alert(result.code);
							show_validata_message("#producttypename_add_input",
									"success", "");
							$("#producttype_add_btn").attr(
									"ajax-valid-producttypename", "success");
						} else {
							//alert(result.code);
							show_validata_message("#producttypename_add_input",
									"error", "商品类型已存在");
							$("#producttype_add_btn").attr(
									"ajax-valid-producttypename", "error");
						}
					}
				});
			});

	//"保存"click事件
	$("#producttype_add_btn").click(function() {
		//1.//校验输入内容是否合法
		if (!validata_add_form()) {
			return false;
		}
		//2.ajax校验商品类型重复
		if ($(this).attr("ajax-valid-producttypename") == "error") {
			show_validata_message("#producttypename_add_input",
					"error", "商品类型已存在");
			return false;
		}

		//3.发送ajax保存用户信息
		$.ajax({
			url : "${basepath}/producttype/insert",
			type : "POST",
			data : $("#producttypeAddModal form").serialize(),
			success : function(result) {
				
				if(result.code == 100){
					//1.关闭模态框
					$("#producttypeAddModal").modal('hide');
					//2.页面跳转到最后一页,显示新增保存数据
					//发送ajax请求显示最后一页
					window.location.reload();
				}else{
					alert(result.extend.error);
				}
			}
		});
	});

	//有效值验证
	function validata_add_form() {
		//1.使用正则表达式校验格式是否合法 var
		producttypename = $("#producttypename_add_input").val();
		var regName = /^[a-zA-Z0-9\u2E80-\u9FFF-_]{2,20}$/;
		if (!regName.test(producttypename)) {
			//校验失败
			show_validata_message("#producttypename_add_input", "error",
					"请输入2到20位以内的数字,字母,下划线和汉字的组合作为商品类型名");
			return false;
		} else {
			show_validata_message("#producttypename_add_input", "success", "");
		}

		return true;
	}

	//有效值验证函数 function
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
	$(document).on("click",".edit-btn",function() {

				//查找当前信息并传值到Modal
				findType($(this).attr("edit-producttypeid"));

				$("#producttype_update_btn").attr("edit-producttypeid",
						$(this).attr("edit-producttypeid"));

				//弹出模态框
				$("#producttypeUpdateModal").modal({
					keyboard : false,
					backdrop : "static"
				});
			});

	//回显信息 function
	function findType(producttypeid) {
		$.ajax({
			url : "${basepath}/producttype/find/" + producttypeid,
			type : "GET",
			success : function(result) {
				//console.log(result);
				if(result.code == 100){
					var producttypeData = result.extend.producttype;
					$("#producttypename_update_input").val(
							producttypeData.producttypename);
				}else{
					alert(result.extend.error);
				}
			}
		});
	}

	//producttypename"change"事件
	$("#producttypename_update_input").change(
			function() {
				//发送ajax请求校验商品类型是否重复
				var producttypename = this.value;
				$.ajax({
					url : "${basepath}/producttype/checkproducttypename",
					data : "producttypename=" + producttypename,
					type : "POST",
					success : function(result) {
						if (result.code == 100) {
							//alert(result.code);
							show_validata_message(
									"#producttypename_update_input", "success",
									"");
							$("#producttype_update_btn").attr(
									"ajax-valid-producttypename", "success");
						} else {
							//alert(result.code);
							show_validata_message(
									"#producttypename_update_input", "error",
									"商品类型已存在");
							$("#producttype_update_btn").attr(
									"ajax-valid-producttypename", "error");
						}
					}
				});
			});

	//"更新"click事件
	$("#producttype_update_btn").click(
			function() {
				//1.使用正则表达式校验格式是否合法
				var producttypename = $("#producttypename_update_input").val();
				var regName = /^[a-zA-Z0-9\u2E80-\u9FFF-_]{0,20}$/;
				if (!regName.test(producttypename)) {
					//校验失败
					show_validata_message("#producttypename_update_input",
							"error", "请输入二十位以内的数字,字母,下划线作为商品类型");
					return false;
				} else {
					show_validata_message("#producttypename_update_input",
							"success", "");
				}

				//商品类型重复
				if ($(this).attr("ajax-valid-producttypename") == "error") {
					return false;
				}

				//2.ajax请求保存用户更新信息
				$.ajax({
					url : "${basepath}/producttype/update/"
							+ $(this).attr("edit-producttypeid"),
					type : "PUT",
					data : $("#producttypeUpdateModal form").serialize(),
					success : function(result) {
						if(result.code == 100){
						//1.关闭模态框
						$("#producttypeUpdateModal").modal('hide');
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
		var producttypename = $(this).parents("tr").find("td:eq(2)").text();
		var producttypeid = $(this).attr("delete-producttypeid");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		//alert($(this).attr("delete-producttypeid"));
		if (confirm("确认删除商品类型[" + producttypename + "]吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/producttype/delete/" + producttypeid,
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

	//删除全选
	$("#check-all").click(function() {
		$(".check-item").prop("checked", $(this).prop("checked"));
	});

	$(document).on("click", ".check-item", function() {
		var flag = $(".check-item:checked").length == $(".check-item").length;
		$("#check-all").prop("checked", flag);

	});
	$("#producttype_delete_all_btn").click(
			function() {
				var producttypename = "";
				var producttypeids = "";
				$.each($(".check-item:checked"), function() {
					producttypename += $(this).parents("tr").find("td:eq(2)")
							.text()
							+ ",";
					producttypeids += $(this).parents("tr").find("td:eq(1)")
							.text()
							+ "-";
				});
				producttypename = producttypename.substring(0,
						producttypename.length - 1);
				producttypeids = producttypeids.substring(0,
						producttypeids.length - 1);
				if (confirm("确认删除商品类型[" + producttypename + "]吗?")) {
					$.ajax({
						url : "${basepath}/producttype/delete/"
								+ producttypeids,
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