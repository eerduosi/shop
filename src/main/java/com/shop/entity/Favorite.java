package com.shop.entity;

import java.util.Date;

public class Favorite {
    private Integer favoriteid;

    private Integer userid;

    private Integer productid;

    private Date favoritecreatetime;

    private Date favoriteupdatetime;
    
    private User user;
    
    private Product product;
    
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

	public Integer getFavoriteid() {
        return favoriteid;
    }

    public void setFavoriteid(Integer favoriteid) {
        this.favoriteid = favoriteid;
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

    public Date getFavoritecreatetime() {
        return favoritecreatetime;
    }

    public void setFavoritecreatetime(Date favoritecreatetime) {
        this.favoritecreatetime = favoritecreatetime;
    }

    public Date getFavoriteupdatetime() {
        return favoriteupdatetime;
    }

    public void setFavoriteupdatetime(Date favoriteupdatetime) {
        this.favoriteupdatetime = favoriteupdatetime;
    }
}