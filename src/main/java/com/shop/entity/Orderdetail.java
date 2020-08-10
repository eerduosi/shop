package com.shop.entity;

public class Orderdetail {
	private Integer orderdetailid;

	private Integer userid;

	private Integer orderno;

	private Integer productid;

	private String productcurrentprice;

	private Integer productquantity;

	private String producttotalprice;

	private String orderdetailcreatetime;

	private String orderdetailupdatetime;

	private User user;

	private Product product;

	private Order order;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Integer getOrderdetailid() {
		return orderdetailid;
	}

	public void setOrderdetailid(Integer orderdetailid) {
		this.orderdetailid = orderdetailid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getOrderno() {
		return orderno;
	}

	public void setOrderno(Integer orderno) {
		this.orderno = orderno;
	}

	public Integer getProductid() {
		return productid;
	}

	public void setProductid(Integer productid) {
		this.productid = productid;
	}

	public String getProductcurrentprice() {
		return productcurrentprice;
	}

	public void setProductcurrentprice(String productcurrentprice) {
		this.productcurrentprice = productcurrentprice == null ? null : productcurrentprice.trim();
	}

	public Integer getProductquantity() {
		return productquantity;
	}

	public void setProductquantity(Integer productquantity) {
		this.productquantity = productquantity;
	}

	public String getProducttotalprice() {
		return producttotalprice;
	}

	public void setProducttotalprice(String producttotalprice) {
		this.producttotalprice = producttotalprice == null ? null : producttotalprice.trim();
	}

	public String getOrderdetailcreatetime() {
		return orderdetailcreatetime;
	}

	public void setOrderdetailcreatetime(String orderdetailcreatetime) {
		this.orderdetailcreatetime = orderdetailcreatetime;
	}

	public String getOrderdetailupdatetime() {
		return orderdetailupdatetime;
	}

	public void setOrderdetailupdatetime(String orderdetailupdatetime) {
		this.orderdetailupdatetime = orderdetailupdatetime;
	}
}