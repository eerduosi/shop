package com.shop.entity;

import java.util.Date;

public class Product {
    private Integer productid;

    private Integer producttypeid;

    private String productname;

    private String productprice;

    private Integer productquantity;

    private String productdetail;

    private String productsrc;

    public String getProductsrc() {
		return productsrc;
	}

	public void setProductsrc(String productsrc) {
		this.productsrc = productsrc;
	}

	private String productcreatetime;

    private String productupdatetime;
    
    //查询商品时显示商品类型
    private Producttype producttype;

    
    
    
    
    public Product() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Product(Integer productid, Integer producttypeid, String productname, String productprice,
			Integer productquantity, String productdetail, String productcreatetime, String productupdatetime) {
		super();
		this.productid = productid;
		this.producttypeid = producttypeid;
		this.productname = productname;
		this.productprice = productprice;
		this.productquantity = productquantity;
		this.productdetail = productdetail;
		this.productcreatetime = productcreatetime;
		this.productupdatetime = productupdatetime;
	}

	public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public Integer getProducttypeid() {
        return producttypeid;
    }

    public void setProducttypeid(Integer producttypeid) {
        this.producttypeid = producttypeid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname == null ? null : productname.trim();
    }

    public String getProductprice() {
        return productprice;
    }

    public void setProductprice(String productprice) {
        this.productprice = productprice == null ? null : productprice.trim();
    }

    public Integer getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(Integer productquantity) {
        this.productquantity = productquantity;
    }

    public String getProductdetail() {
        return productdetail;
    }

    public void setProductdetail(String productdetail) {
        this.productdetail = productdetail == null ? null : productdetail.trim();
    }


    public String getProductcreatetime() {
        return productcreatetime;
    }

    public void setProductcreatetime(String productcreatetime) {
        this.productcreatetime = productcreatetime;
    }

    public String getProductupdatetime() {
        return productupdatetime;
    }

    public void setProductupdatetime(String productupdatetime) {
        this.productupdatetime = productupdatetime;
    }

	public Producttype getProducttype() {
		return producttype;
	}

	public void setProducttype(Producttype producttype) {
		this.producttype = producttype;
	}
}