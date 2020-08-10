package com.shop.service;

import java.util.List;

import com.shop.entity.Producttype;

public interface ProducttypeService {
	public int deleteById(Integer producttypeid);

	public int insert(Producttype producttype);

	public Producttype selectById(Integer producttypeid);

	public int update(Producttype producttype);

	public List<Producttype> selectAll();

	public List<Producttype> checkByProducttypename(String producttypename);
}
