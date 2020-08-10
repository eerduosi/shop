package com.shop.entity;

import java.util.Date;

public class Producttype {
    private Integer producttypeid;

    private String producttypename;

    private String producttypecreatetime;

    private String producttypeupdatetime;

    public Integer getProducttypeid() {
        return producttypeid;
    }

    public void setProducttypeid(Integer producttypeid) {
        this.producttypeid = producttypeid;
    }

    public String getProducttypename() {
        return producttypename;
    }

    public void setProducttypename(String producttypename) {
        this.producttypename = producttypename == null ? null : producttypename.trim();
    }

    public String getProducttypecreatetime() {
        return producttypecreatetime;
    }

    public void setProducttypecreatetime(String producttypecreatetime) {
        this.producttypecreatetime = producttypecreatetime;
    }

    public String getProducttypeupdatetime() {
        return producttypeupdatetime;
    }

    public void setProducttypeupdatetime(String producttypeupdatetime) {
        this.producttypeupdatetime = producttypeupdatetime;
    }

	@Override
	public String toString() {
		return "Producttype [producttypeid=" + producttypeid + ", producttypename=" + producttypename
				+ ", producttypecreatetime=" + producttypecreatetime + ", producttypeupdatetime="
				+ producttypeupdatetime + "]";
	}
}