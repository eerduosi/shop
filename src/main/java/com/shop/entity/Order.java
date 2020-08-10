package com.shop.entity;

public class Order {
	private Integer orderid;

	private Integer userid;

	private Integer orderno;

	private Integer addressid;

	private String ordercash;

	private String ordersendtime;

	private String orderendtime;

	private String ordercreatetime;

	private String orderupdatetime;

	private User user;

	private Address address;

	@Override
	public String toString() {
		return "Order [orderid=" + orderid + ", userid=" + userid + ", orderno=" + orderno + ", addressid=" + addressid
				+ ", ordercash=" + ordercash + ", ordersendtime=" + ordersendtime + ", orderendtime=" + orderendtime
				+ ", paymentstatus=" + ", ordercreatetime=" + ordercreatetime + ", orderupdatetime="
				+ orderupdatetime + "]";
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
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

	public Integer getAddressid() {
		return addressid;
	}

	public void setAddressid(Integer addressid) {
		this.addressid = addressid;
	}

	public String getOrdercash() {
		return ordercash;
	}

	public void setOrdercash(String ordercash) {
		this.ordercash = ordercash;
	}

	public String getOrdersendtime() {
		return ordersendtime;
	}

	public void setOrdersendtime(String ordersendtime) {
		this.ordersendtime = ordersendtime == null ? null : ordersendtime.trim();
	}

	public String getOrderendtime() {
		return orderendtime;
	}

	public void setOrderendtime(String orderendtime) {
		this.orderendtime = orderendtime == null ? null : orderendtime.trim();
	}

	public String getOrdercreatetime() {
		return ordercreatetime;
	}

	public void setOrdercreatetime(String ordercreatetime) {
		this.ordercreatetime = ordercreatetime;
	}

	public String getOrderupdatetime() {
		return orderupdatetime;
	}

	public void setOrderupdatetime(String orderupdatetime) {
		this.orderupdatetime = orderupdatetime;
	}
}