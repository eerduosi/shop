package com.shop.entity;

import java.util.Date;

public class Productpicture {
    private Integer productpictureid;

    private Integer productid;

    private String productpicturename;
    
    private String productpicturesrc;

    private String productpicturecreatetime;

    private String productpictureupdatetime;
    
    
    private Product product;

    public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public Integer getProductpictureid() {
        return productpictureid;
    }

    public void setProductpictureid(Integer productpictureid) {
        this.productpictureid = productpictureid;
    }

    public Integer getProductid() {
        return productid;
    }

    public void setProductid(Integer productid) {
        this.productid = productid;
    }

    public String getProductpicturename() {
        return productpicturename;
    }

    public void setProductpicturename(String productpicturename) {
        this.productpicturename = productpicturename == null ? null : productpicturename.trim();
    }

    public String getProductpicturesrc() {
		return productpicturesrc;
	}

	public void setProductpicturesrc(String productpicturesrc) {
		this.productpicturesrc = productpicturesrc;
	}

	public String getProductpicturecreatetime() {
        return productpicturecreatetime;
    }

    public void setProductpicturecreatetime(String productpicturecreatetime) {
        this.productpicturecreatetime = productpicturecreatetime;
    }

    public String getProductpictureupdatetime() {
        return productpictureupdatetime;
    }

    public void setProductpictureupdatetime(String productpictureupdatetime) {
        this.productpictureupdatetime = productpictureupdatetime;
    }

	@Override
	public String toString() {
		return "Productpicture [productpictureid=" + productpictureid + ", productid=" + productid
				+ ", productpicturename=" + productpicturename + ", productpicturesrc=" + productpicturesrc
				+ ", productpicturecreatetime=" + productpicturecreatetime + ", productpictureupdatetime="
				+ productpictureupdatetime + ", product=" + product + "]";
	}
}