package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Product;
import com.shop.mapper.ProductMapper;
import com.shop.service.ProductService;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper productMapper;

	@Override
	public int deleteById(Integer productid) {
		// TODO Auto-generated method stub
		return productMapper.deleteById(productid);
	}

	@Override
	public int insert(Product product) {
		// TODO Auto-generated method stub
		return productMapper.insert(product);
	}

	@Override
	public Product selectById(Integer productid) {
		// TODO Auto-generated method stub
		return productMapper.selectById(productid);
	}

	@Override
	public int update(Product product) {
		// TODO Auto-generated method stub
		return productMapper.update(product);
	}

	@Override
	public List<Product> selectByTypeId(Integer producttypeid) {
		// TODO Auto-generated method stub
		return productMapper.selectByTypeId(producttypeid);
	}

	@Override
	public List<Product> selectAllWithType() {
		// TODO Auto-generated method stub
		return productMapper.selectAllWithType();
	}

	@Override
	public List<Product> checkByProductname(String productname) {
		// TODO Auto-generated method stub
		return productMapper.checkByProductname(productname);
	}

	@Override
	public List<Product> selectAll() {
		// TODO Auto-generated method stub
		return productMapper.selectAll();
	}

	@Override
	public List<Product> checkByProductnameAndProductid(String productname, Integer productid) {
		// TODO Auto-generated method stub
		return productMapper.checkByProductnameAndProductid(productname, productid);
	}

}
