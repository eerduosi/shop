package com.shop.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.Product;

public interface ProductService {
	public int deleteById(Integer productid);

	public int insert(Product product);

	public Product selectById(Integer productid);

	public int update(Product product);

	public List<Product> selectByTypeId(Integer producttypeid);

	public List<Product> selectAllWithType();
	
	public List<Product> checkByProductname(String productname);

	public List<Product> selectAll();

	public List<Product> checkByProductnameAndProductid(@Param("productname")String productname, @Param("productid")Integer productid);
}
