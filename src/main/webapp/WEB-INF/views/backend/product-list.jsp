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
						<b>商品列表</b>
					</header>
					<!-- <div class="box-header"> -->
					<!-- <h3 class="box-title">Responsive Hover Table</h3> -->

					<!-- </div> -->
					<div class="panel-body table-responsive">
						<div class="box-tools m-b-15">
							<div class="input-group">
								<button class="btn btn-primary" id="product_add_modal_btn">
									<span class="glyphicon glyphicon-pencil"></span>新增
								</button>
								<button class="btn btn-danger" id="product_delete_all_btn">
									<span class="glyphicon glyphicon-trash"></span>批量删除
								</button>


								
							</div>
						</div>
						<table class="table table-hover" id="product_table">
							<thead>
								<tr>
									<th><input type="checkbox" id="check-all" /></th>
									<th>商品id</th>
									<th>商品类型</th>
									<th>商品名</th>
									<th>商品价格</th>
									<th>商品数量</th>
									<th>商品介绍</th>
									<th>商品首页图</th>
									<th>上架时间</th>
									<th>更新时间</th>
									<th>操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${pageInfo.list}" var="item">
									<tr>
										<td><input type="checkbox" class="check-item" /></td>
										<td>${item.productid}</td>
										<td>${item.producttype.producttypename}</td>
										<td><a href="javascript:void(0)" onclick="window.location.href='${basepath}/productpicture/view?productid=${item.productid}'">${item.productname}</a></td>
										<td>${item.productprice}</td>
										<td>${item.productquantity}</td>
										<td>${item.productdetail}</td>
										<td><img src="${item.productsrc}" style="width: 100px;height: 100px;display:block;" /></td>
										<td>${item.productcreatetime}</td>
										<td>${item.productupdatetime}</td>
										<td>
											<button class="btn btn-primary btn-sm edit-btn"
												edit-productid="${item.productid}">
												<span class="glyphicon glyphicon-pencil"></span>编辑
											</button>
											<button class="btn btn-danger btn-sm delete-btn"
												delete-productid="${item.productid }">
												<span class="glyphicon glyphicon-trash"></span>删除
											</button>
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
									<li><a href="${basepath}/product/view?pagenumber=1&producttypeid=${producttypeid}">首页</a></li>
									<li><a
										href="${basepath}/product/view?pagenumber=${pageInfo.pageNum-1}&producttypeid=${producttypeid}"
										aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
									</a></li>
								</c:if>


								<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
									<c:if test="${page_Num == pageInfo.pageNum }">
										<li class="active"><a href="javascript:void(0)">${page_Num }</a></li>
									</c:if>
									<c:if test="${page_Num != pageInfo.pageNum }">
										<li><a
											href="${basepath}/product/view?pagenumber=${page_Num}&producttypeid=${producttypeid}">${page_Num}</a></li>
									</c:if>
								</c:forEach>
								<c:if test="${pageInfo.hasNextPage}">
									<li><a
										href="${basepath}/product/view?pagenumber=${pageInfo.pageNum+1}&producttypeid=${producttypeid}"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
									<li><a
										href="${basepath}/product/view?pagenumber=${pageInfo.pages}&producttypeid=${producttypeid}">末页</a></li>
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


<!-- 商品添加模块 -->
<div class="modal fade" id="productAddModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="AddModalLabel">商品添加</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal">


					<div class="form-group">
						<label class="col-sm-2 control-label">商品类型</label>
						<div class="col-sm-4">
							<select class="form-control" name="producttypeid"
								id="producttype_add_select">

							</select>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品名</label>
						<div class="col-sm-10">
							<input type="text" name="productname" class="form-control"
								id="productname_add_input" placeholder="商品名"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品价格</label>
						<div class="col-sm-10">
							<input type="text" name="productprice" class="form-control"
								id="productprice_add_input" placeholder="商品价格"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品数量</label>
						<div class="col-sm-10">
							<input type="text" name="productquantity" class="form-control"
								id="productquantity_add_input" placeholder="商品数量"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品详情</label>
						<div class="col-sm-10">
							<input type="text" name="productdetail" class="form-control"
								id="productdetail_add_input" placeholder="商品详情"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">图片</label>
						<div class="col-sm-10">
							<img id="productsrc_add_img" src="" /> <input
								type="hidden" name="productsrc" class="form-control"
								id="productsrc_add_input" placeholder="图片地址"
								readonly=true> </span><a class="btn btn-info"
								id="upload_add_input"><i class="fa fa-picture-o"></i> 上传图片</a>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="product_add_close_btn" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary" id="product_add_btn">保存</button>
			</div>
		</div>
	</div>
</div>


<!-- 商品修改模块 -->
<div class="modal fade" id="productUpdateModal" tabindex="-1"
	role="dialog" aria-labelledby="myModalLabel">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title" id="UpdateModalLabel">商品修改</h4>
			</div>
			<div class="modal-body">
				<form class="form-horizontal"  enctype="multipart/form-data">


					<div class="form-group">
						<label class="col-sm-2 control-label">商品类型</label>
						<div class="col-sm-4">
							<select class="form-control" name="producttypeid"
								id="producttype_update_select">

							</select>
						</div>
					</div>


					<div class="form-group">
						<label class="col-sm-2 control-label">商品名</label>
						<div class="col-sm-10">
							<input type="text" name="productname" class="form-control"
								id="productname_update_input" placeholder="商品名" productid=""> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品价格</label>
						<div class="col-sm-10">
							<input type="text" name="productprice" class="form-control"
								id="productprice_update_input" placeholder="商品价格"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品数量</label>
						<div class="col-sm-10">
							<input type="text" name="productquantity" class="form-control"
								id="productquantity_update_input" placeholder="商品数量"> <span
								class="help-block"></span>
						</div>
					</div>

					<div class="form-group">
						<label class="col-sm-2 control-label">商品详情</label>
						<div class="col-sm-10">
							<input type="text" name="productdetail" class="form-control"
								id="productdetail_update_input" placeholder="商品详情"> <span
								class="help-block"></span>
						</div>
					</div>

					
					<div class="form-group">
						<label class="col-sm-2 control-label">图片</label>
						<div class="col-sm-10">
							<img id="productsrc_update_img" src="" /> <input
								type="hidden" name="productsrc" class="form-control"
								id="productsrc_update_input" placeholder="图片地址"
								readonly=true> </span><a class="btn btn-info"
								id="upload_update_input"><i class="fa fa-picture-o"></i> 更改图片</a>
						</div>
					</div>

				</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" id="product_update_close_btn" data-dismiss="modal">关闭</button>
				<button type="button" class="btn btn-primary"
					id="product_update_btn">更新</button>
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
		if (!(result && /^(jpg|jpeg|png|gif)$/.test(result.toLowerCase()))) {
			alert('只支持jpg、png、gif格式的图片！');
			return false;
		}
	},
	onComplete : function(file, result) {
		if (result.code == 100) {
			alert("上传成功");
			$("#productsrc_add_input")
					.val(result.extend.src);
			$("#productsrc_add_img").attr("src",
					result.extend.src);
			$("#productsrc_add_img").attr("style",
					"width: 100px;height: 100px;display:block;");
			return false;
		} else {
			alert(result.extend.error);
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
			alert(result.extend.success);
			$("#productsrc_update_input") 
					.val(result.extend.src);
			$("#productsrc_update_img").attr("src",
					result.extend.src);
			$("#productsrc_update_img").attr("style",
					"width: 100px;height: 100px;display:block;");
			return false;
		} else {
			alert(result.extend.error);
		}
	}
});


/**
 * 新增点击关闭删除未保存图片
 */
$(document).on("click", "#product_add_close_btn", function() {

	var productsrc = $("#productsrc_add_input").val().substring(13);

	//确认,发送请求
	$.ajax({
		url : "${basepath}/product/productsrc/delete/",
		type : "POST",
		data : {
			"productsrc" : productsrc
		},
		success : function(result) {
			if(result.code == 100){
				
			}else{
				alert(result.extend.error);
			}
		}
	});
});



/**
 * 更新点击关闭删除未保存图片
 */
$(document).on("click", "#product_update_close_btn", function() {

	var productsrc = $("#productsrc_update_input").val().substring(13);
	var productid = $("#productname_update_input").attr("productid");

	//确认,发送请求
	$.ajax({
		url : "${basepath}/product/productsrc/delete/",
		type : "POST",
		data : {
			"productid" : productid,
			"productsrc" : productsrc
		},
		success : function(result) {
			if(result.code == 100){
				
			}else{
				alert(result.extend.error);
			}
		}
	});
});




	//清空span提示的样式和内容
	function reset_form(ele) {
		$(ele)[0].reset();
		$(ele).find("*").removeClass("has-error has-success");
		$(ele).find(".help-block").text("");
	}

	//"新增"click
	$("#product_add_modal_btn").click(function() {

		//清除表单数据
		reset_form("#productAddModal form");

		//获取商品类型
		getProducttype("#producttype_add_select");

		//弹出模态框
		$("#productAddModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//获取商品类型并显示在select中
	function getProducttype(ele) {

		$(ele).empty();

		$.ajax({
			url : "${basepath}/producttypename",
			type : "GET",
			success : function(result) {
				//console.log(result);
				//在select中显示商品类型
				/* $("#producttype_add_select") */
				$.each(result.extend.producttype, function() {
					var optionEle = $("<option></option>").append(this.producttypename).attr("value",this.producttypeid);
					optionEle.appendTo(ele);
				});
			}
		});
	}

	//productname"change"事件
	$("#productname_add_input").change(function() {
		//发送ajax请求校验商品名是否重复
		var productname = this.value;
		$.ajax({
			url : "${basepath}/prodcut/checkproductname",
			data : "productname=" + productname,
			type : "POST",
			success : function(result) {
				if (result.code == 100) {
					//alert(result.code);
					show_validata_message("#productname_add_input",
							"success", "");
					$("#product_add_btn").attr(
							"ajax-valid-productname", "success");
				} else {
					//alert(result.code);
					show_validata_message("#productname_add_input",
							"error", result.extend.error);
					$("#product_add_btn").attr(
							"ajax-valid-productname", "error");
				}
			}
		});
	});

	//"保存"click事件
	$("#product_add_btn").click(function() {
		//1.//校验输入内容是否合法
		if (!validata_add_form()) {
			return false;
		}
		//2.ajax校验商品名重复
		if ($(this).attr("ajax-valid-productname") == "error") {
			
			show_validata_message("#productname_add_input",
					"error", "商品已存在");
			
			return false;
		}

		//3.发送ajax保存用户信息
		$.ajax({
			url : "${basepath}/product/insert",
			type : "POST",
			data : $("#productAddModal form").serialize(),
			success : function(result) {
				if(result.code == 100){
					alert(result.msg);
					$("#productAddModal").modal('hide');
					window.location.reload();
				}else{
					alert(result.extend.error);
				}
								
				
			}
		});
	});

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

	//有效值验证
	function validata_add_form() {
		//使用正则表达式校验格式是否合法
		var productname = $("#productname_add_input").val();
		var regName = /^[a-zA-Z0-9\u2E80-\u9FFF-_]{2,20}$/;
		if (!regName.test(productname)) {
			//校验失败
			show_validata_message("#productname_add_input", "error",
					"请输入2到20位以内的数字,字母,下划线和汉字作为商品名!");
			return false;
		} else {
			show_validata_message("#productname_add_input", "success", "");
		}

		var productprice = $("#productprice_add_input").val();
		var regName = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
		if (!regName.test(productprice)) {
			//校验失败
			show_validata_message("#productprice_add_input", "error",
					"商品价格应为整数加小数点后两位!");
			return false;
		} else {
			show_validata_message("#productprice_add_input", "success", "");
		}

		var productquantity = $("#productquantity_add_input").val();
		var regName = /^[\d+]{1,}$/;
		if (!regName.test(productquantity)) {
			//校验失败
			show_validata_message("#productquantity_add_input", "error",
					"商品数量应为整数!");
			return false;
		} else {
			show_validata_message("#productquantity_add_input", "success", "");
		}

		return true;
	}

	//"on"绑定"click"事件
	$(document).on("click",".edit-btn",function() {
		
		
		//清除表单数据
		reset_form("#productUpdateModal form");

		//商品类型回显
		getProducttype("#producttype_update_select");
		//商品信息回显
		findProduct($(this).attr("edit-productid"));

		$("#product_update_btn").attr("edit-productid",
				$(this).attr("edit-productid"));

		//弹出模态框
		$("#productUpdateModal").modal({
			keyboard : false,
			backdrop : "static"
		});
	});

	//回显信息
	function findProduct(productid) {
		$.ajax({
			url : "${basepath}/product/find/" + productid,
			type : "GET",
			success : function(result) {
				//console.log(result);
				var productData = result.extend.product;
				$("#producttype_update_select").val(
						[ productData.producttypeid ]);
				$("#productname_update_input").val(
						productData.productname);
				$("#productname_update_input").attr("productid",productData.productid);
				$("#productprice_update_input").val(
						productData.productprice);
				$("#productquantity_update_input").val(
						productData.productquantity);
				$("#productdetail_update_input").val(
						productData.productdetail);
				$("#productsrc_update_input").val(
						productData.productsrc);
				$("#productsrc_update_img").attr("src",
						productData.productsrc);
				$("#productsrc_update_img").attr("style",
						"width: 100px;height: 100px;display:block;");
			}
		});
	}
	
	//productname"change"事件
	$("#productname_update_input").change(function() {
		//发送ajax请求校验商品名是否重复
		var productname = this.value;
		var productid = $("#productname_update_input").attr("productid");
		
		$.ajax({
			url : "${basepath}/prodcut/checkproductname",
			data : {
				"productname": productname,
				"productid" : productid
			},
			type : "POST",
			success : function(result) {
				if (result.code == 100) {
					show_validata_message("#productname_update_input",
							"success", "");
					$("#product_update_btn").attr(
							"ajax-valid-productname", "success");
				} else {
					show_validata_message("#productname_update_input",
							"error", result.extend.error);
					$("#product_update_btn").attr(
							"ajax-valid-productname", "error");
				}
			}
		});
	});
	
	
	//有效值验证
	function validata_update_form() {
		//使用正则表达式校验格式是否合法
		var productname = $("#productname_update_input").val();
		var regName = /^[a-zA-Z0-9\u2E80-\u9FFF-_]{0,20}$/;
		if (!regName.test(productname)) {
			//校验失败
			show_validata_message("#productname_update_input", "error",
					"请输入二十位以内的数字,字母,下划线作为商品名!");
			return false;
		} else {
			show_validata_message("#productname_update_input",
					"success", "");
		}

		var productprice = $("#productprice_update_input").val();
		var regName = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
		if (!regName.test(productprice)) {
			//校验失败
			show_validata_message("#productprice_update_input",
					"error", "商品价格应为整数加小数点后两位!");
			return false;
		} else {
			show_validata_message("#productprice_update_input",
					"success", "");
		}

		var productquantity = $("#productquantity_update_input").val();
		var regName = /^[\d+]{1,}$/;
		if (!regName.test(productquantity)) {
			//校验失败
			show_validata_message("#productquantity_update_input",
					"error", "商品数量应为整数!");
			return false;
		} else {
			show_validata_message("#productquantity_update_input",
					"success", "");
		}

		return true;
	}
	

	//"更新"click事件
	$("#product_update_btn").click(function() {
		
		
		//1.//校验输入内容是否合法
		if (!validata_update_form()) {
			return false;
		}
		
		
		//商品名重复
		if ($(this).attr("ajax-valid-productname") == "error") {
			
			show_validata_message("#productname_update_input",
					"error", "商品已存在");
			
			return false;
		}
		

		//ajax请求保存商品更新信息
		$.ajax({
			url : "${basepath}/prodcut/update/"
					+ $(this).attr("edit-productid"),
			type : "PUT",
			data : $("#productUpdateModal form").serialize(),
			success : function(result) {
				//alert(result.msg);
				if(result.code == 100){
					alert(result.msg);
					//1.关闭模态框
					$("#productUpdateModal").modal('hide');
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
		var productname = $(this).parents("tr").find("td:eq(3)").text();
		var productid = $(this).attr("delete-productid");
		//alert($(this).parents("tr").find("td:eq(1)").text());
		//alert($(this).attr("delete-productid"));
		if (confirm("确认删除商品[" + productname + "]吗?")) {
			//确认,发送请求
			$.ajax({
				url : "${basepath}/product/delete/" + productid,
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
	$("#product_delete_all_btn").click(function() {
		var productname = "";
		var productids = "";
		$.each($(".check-item:checked"), function() {
			productname += $(this).parents("tr").find("td:eq(3)").text() + ",";
			productids += $(this).parents("tr").find("td:eq(1)").text() + "-";
		});
		productname = productname.substring(0, productname.length - 1);
		productids = productids.substring(0, productids.length - 1);
		if (confirm("确认删除商品[" + productname + "]吗?")) {
			$.ajax({
				url : "${basepath}/product/delete/" + productids,
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