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
						<b>商品图片</b>
					</header>
					<!-- <div class="box-header"> -->
					<!-- <h3 class="box-title">Responsive Hover Table</h3> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
								
								<button class="btn btn-primary"
									id="productpicture_add_modal_btn">
									<span class="glyphicon glyphicon-pencil"></span>新增
								</button>
								<button class="btn btn-danger"
									id="productpicture_delete_all_btn">
									<span class="glyphicon glyphicon-trash"></span>批量删除
								</button>


							</div>
						</div>
						<table class="table table-hover" id="productpicture_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<th>#</th>
									<th>商品名</th>
									<th>商品图片名</th>
									<th>商品地址</th>
									<th>图片</th>
									<th>添加时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										<td><input type="checkbox" class="check-item" /></td>
										<td>${item.productpictureid}</td>
										<td>${item.product.productname}</td>
										<td>${item.productpicturename}</td>
										<td>${item.productpicturesrc}</td>
										<td><img src="${item.productpicturesrc}"
											style="width: 100px; height: 100px; display: block;" /></td>
										<td>${item.productpicturecreatetime}</td>
										<td>${item.productpictureupdatetime}</td>
										<td><button class="btn btn-primary btn-sm edit-btn"
												edit-productpictureid="${item.productpictureid}">
												<span class="glyphicon glyphicon-pencil"></span>编辑
											</button>
											<button class="btn btn-danger btn-sm delete-btn"
												delete-productpictureid="${item.productpictureid}">
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
						${pageInfo.pageNum}页,总${pageInfo.pages } 页,总 ${pageInfo.total }
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
									<li><a
										href="${basepath}/productpicture/view?pagenumber=1&productid=${productid}">首页</a></li>
									<li><a
										href="${basepath}/productpicture/view?pagenumber=${pageInfo.pageNum-1}&productid=${productid}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="javascript:void(0)">${page_Num}</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/productpicture/view?pagenumber=${page_Num}&productid=${productid}">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/productpicture/view?pagenumber=${pageInfo.pageNum+1}&productid=${productid}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/productpicture/view?pagenumber=${pageInfo.pages}&productid=${productid}">末页</a></li>
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



<!-- 商品图片添加模块 -->
<div class="modal fade" id="productpictureAddModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">商品图片添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" enctype="multipart/form-data">

					<div class="form-group">
						<label class="col-sm-2 control-label">商品</label>
						<div class="col-sm-4">
							<select class="form-control" name="productid"
								id="product_add_select">

							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label">图片名</label>
						<div class="col-sm-10">
							<input type="text" name="productpicturename" class="form-control"
								id="productpicturename_add_input" placeholder="图片名"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">图片</label>
						<div class="col-sm-10">
							<img id="productpicturesrc_add_img" src="" /> <input
								type="hidden" name="productpicturesrc" class="form-control"
								id="productpicturesrc_add_input" placeholder="图片地址"
								readonly=true> </span><a class="btn btn-info"
								id="upload_add_input"><i class="fa fa-picture-o"></i> 上传图片</a>
						</div>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					id="productpicture_add_btn">保存</button>
			</div>
		</div>
	</div>
</div>

<!-- 商品类型修改模块 -->
<div class="modal fade" id="productpictureUpdateModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="myModalLabel">商品图片修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal" enctype="multipart/form-data">

					<div class="form-group">
						<label class="col-sm-2 control-label">商品</label>
						<div class="col-sm-4">
							<select class="form-control" name="productid"
								id="product_update_select">

							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label">图片名</label>
						<div class="col-sm-10">
							<input type="text" name="productpicturename" class="form-control"
								id="productpicturename_update_input" placeholder="图片名">
							<span class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">图片</label>
						<div class="col-sm-10">
							<img id="productpicturesrc_update_img" src="" /> <input
								type="hidden" name="productpicturesrc" class="form-control"
								id="productpicturesrc_update_input" placeholder="图片地址"
								readonly=true><a class="btn btn-info"
								id="upload_update_input"><i class="fa fa-picture-o"></i>
								更改图片</a>
						</div>
					</div>


				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					id="productpicture_update_btn">更新</button>
			</div>
		</div>
	</div>
</div>



<script type="text/javascript">
	new AjaxUpload('#upload_add_input',{
	action : "${basepath}/upload",
	name : 'file',
	autoSubmit : true,
	responseType : "json",
	onSubmit : function(file, result) {
		if (!(result && /^(jpg|jpeg|png|gif)$/.test(result
				.toLowerCase()))) {
			alert('只支持jpg、png、gif格式的图片！');
			return false;
		}
	},
	onComplete : function(file, result) {
		if (result.code == 100) {
			alert("上传成功");
			$("#productpicturesrc_add_input")
					.val(result.extend.src);
			$("#productpicturesrc_add_img").attr("src",
					result.extend.src);
			$("#productpicturesrc_add_img").attr("style",
					"width: 100px;height: 100px;display:block;");
			return false;
		} else {
			alert("上传失败,"+result.extend.error);
		}
	}
});

	new AjaxUpload('#upload_update_input',{
	action : "${basepath}/upload",
	name : 'file',
	autoSubmit : true,
	responseType : "json",
	onSubmit : function(file, result) {
		if (!(result && /^(jpg|jpeg|png|gif)$/.test(result
				.toLowerCase()))) {
			alert('只支持jpg、png、gif格式的图片！');
			return false;
		}
	},
	onComplete : function(file, result) {
		if (result.code == 100) {
			alert("上传成功");
			$("#productpicturesrc_update_input").val(
					result.extend.src);
			$("#productpicturesrc_update_img").attr("src",
					result.extend.src);
			$("#productpicturesrc_update_img").attr("style",
					"width: 100px;height: 100px;display:block;");
			return false;
		} else {
			alert("上传失败,"+result.extend.error);
		}
	}
});

	//清空span提示的样式和内容
	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}

	//"新增"click
	$("#productpicture_add_modal_btn").click(function() {

		//清除表单数据
		reset_form("#productpictureAddModal form");

		getproduct("#product_add_select");

		//弹出模态框
		$("#productpictureAddModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	function getproduct(ele) {

		$(ele).empty();

		$.ajax({
			url : "${basepath}/productname",
			type : "GET",
			success : function(result) {
				console.log(result);
				//在select中显示商品类型
				$.each(result.extend.product, function() {
					var optionEle = $("<option></option>").append(this.productname).attr("value", this.productid);
					optionEle.appendTo(ele);
				});
			}
		});
	}

	//"保存"click事件
	$("#productpicture_add_btn").click(function() {

		//ajax保存信息
		$.ajax({
			url : "${basepath}/productpicture/insert",
			type : "POST",
			data : $("#productpictureAddModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				if (result.code == 100) {
					alert(result.msg);
					//1.关闭模态框
					$("#productpictureAddModal").modal('hide');
					//2.页面跳转到最后一页,显示新增保存数据
					window.location.reload();
				} else {
					alert(result.extend.error);
				}

				
			}
		});
	});

	//"on"绑定"click"事件
	$(document).on("click",".edit-btn",function() {

		//reset_form("#productpictureUpdateModal form");
		
		//查找商品名字
		getproduct("#product_update_select");
		//查找当前图片信息并传值到Modal
		findPicture($(this).attr("edit-productpictureid"));
		

		$("#productpicture_update_btn").attr("edit-productpictureid",
				$(this).attr("edit-productpictureid"));

		//弹出模态框
		$("#productpictureUpdateModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//"编辑"回显信息
	function findPicture(productpictureid) {
		$.ajax({
			url : "${basepath}/productpicture/find/" + productpictureid,
			type : "GET",
			success : function(result) {
				console.log(result);
				var productpictureData = result.extend.productpicture;
				$("#product_update_select").val([productpictureData.productid]);
				$("#productpicturename_update_input").val(
						productpictureData.productpicturename);
				$("#productpicturesrc_update_input").val(
						productpictureData.productpicturesrc);
				$("#productpicturesrc_update_img").attr("src",
						productpictureData.productpicturesrc);
				$("#productpicturesrc_update_img").attr("style",
						"width: 100px;height: 100px;display:block;");

			}
		});
	}

	//"更新"click事件
	$("#productpicture_update_btn").click(function() {

		//alert($("#productpictureUpdateModal form").serialize());
		//ajax请求保存更新信息
		$.ajax({
			url : "${basepath}/productpicture/update/"
					+ $(this).attr("edit-productpictureid"),
			type : "PUT",
			data : $("#productpictureUpdateModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				if (result.code == 100) {
					alert(result.msg);
					//1.关闭模态框
					$("#productpictureUpdateModal").modal('hide');
					//2.回到当前页
					window.location.reload();
				} else {
					alert(result.extend.error);
				}
				
			}
		});
	});

	//单个删除
	$(document).on("click", ".delete-btn", function() {
		//1.弹出对话框
		var productpicturename = $(this).parents("tr").find("td:eq(3)").text();
		var productpictureid = $(this).attr("delete-productpictureid");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		//alert($(this).attr("delete-productpictureid"));
		if (confirm("确认删除商品图片[" + productpicturename + "]吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/productpicture/delete/" + productpictureid,
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
	$("#productpicture_delete_all_btn").click(
			function() {
				var productpicturename = "";
				var productpictureids = "";
				$.each($(".check-item:checked"), function() {
					productpicturename += $(this).parents("tr")
							.find("td:eq(3)").text()
							+ ",";
					productpictureids += $(this).parents("tr").find("td:eq(1)")
							.text()
							+ "-";
				});
				productpicturename = productpicturename.substring(0,
						productpicturename.length - 1);
				productpictureids = productpictureids.substring(0,
						productpictureids.length - 1);
				if (confirm("确认删除商品图片[" + productpicturename + "]吗?")) {
					$.ajax({
						url : "${basepath}/productpicture/delete/"
								+ productpictureids,
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