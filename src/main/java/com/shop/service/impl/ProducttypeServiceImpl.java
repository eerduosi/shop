package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Producttype;
import com.shop.mapper.ProducttypeMapper;
import com.shop.service.ProducttypeService;

@Service
public class ProducttypeServiceImpl implements ProducttypeService {

	@Autowired
	private ProducttypeMapper producttypeMapper;
	
	@Override
	public int deleteById(Integer producttypeid) {
		// TODO Auto-generated method stub
		return producttypeMapper.deleteById(producttypeid);
	}

	@Override
	public int insert(Producttype producttype) {
		// TODO Auto-generated method stub
		return producttypeMapper.insert(producttype);
	}

	@Override
	public Producttype selectById(Integer producttypeid) {
		// TODO Auto-generated method stub
		return producttypeMapper.selectById(producttypeid);
	}

	@Override
	public int update(Producttype producttype) {
		// TODO Auto-generated method stub
		return producttypeMapper.update(producttype);
	}

	@Override
	public List<Producttype> selectAll() {
		// TODO Auto-generated method stub
		return producttypeMapper.selectAll();
	}

	@Override
	public List<Producttype> checkByProducttypename(String producttypename) {
		// TODO Auto-generated method stub
		return producttypeMapper.checkByProducttypename(producttypename);
	}

}
