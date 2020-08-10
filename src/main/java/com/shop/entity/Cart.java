package com.shop.entity;


public class Cart {
    private Integer cartid;

    private Integer userid;

    private Integer productid;

    private Integer quantity;

    private Integer checked;

    private String cartcreatetime;

    private String cartupdatetime;
    
    private Product product;
    
    private User user;
    
    private double totalprice;

    public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Integer getCartid() {
        return cartid;
    }

    public void setCartid(Integer cartid) {
        this.cartid = cartid;
    }

    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Integer getChecked() {
        return checked;
    }

    public void setChecked(Integer checked) {
        this.checked = checked;
    }

    public String getCartcreatetime() {
        return cartcreatetime;
    }

    public void setCartcreatetime(String cartcreatetime) {
        this.cartcreatetime = cartcreatetime;
    }

    public String getCartupdatetime() {
        return cartupdatetime;
    }

    public void setCartupdatetime(String cartupdatetime) {
        this.cartupdatetime = cartupdatetime;
    }

	public double getTotalprice() {
		return totalprice;
	}

	public void setTotalprice(double totalprice) {
		this.totalprice = totalprice;
	}
}