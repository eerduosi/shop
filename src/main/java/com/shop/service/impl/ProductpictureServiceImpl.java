package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Productpicture;  
import com.shop.mapper.ProductpictureMapper;
import com.shop.service.ProductpictureService;  

@Service
public class ProductpictureServiceImpl implements ProductpictureService {

	@Autowired
	private ProductpictureMapper productpictureMapper;

	@Override
	public int deleteById(Integer productpictureid) {
		// TODO Auto-generated method stub
		return productpictureMapper.deleteById(productpictureid);
	}

	@Override
	public int insert(Productpicture productpicture) {
		// TODO Auto-generated method stub
		return productpictureMapper.insert(productpicture);
	}

	@Override
	public Productpicture selectById(Integer productpictureid) {
		// TODO Auto-generated method stub
		return productpictureMapper.selectById(productpictureid);
	}

	@Override
	public int update(Productpicture productpicture) {
		// TODO Auto-generated method stub
		return productpictureMapper.update(productpicture);
	}

	

	@Override
	public List<Productpicture> selectByProductid(Integer productid) {
		// TODO Auto-generated method stub
		return productpictureMapper.selectByProductid(productid);
	}

	@Override
	public List<Productpicture> selectAll() {
		// TODO Auto-generated method stub
		return productpictureMapper.selectAll();
	}

	@Override
	public List<Productpicture> selectAllWithProductname() {
		// TODO Auto-generated method stub
		return productpictureMapper.selectAllWithProductname();
	}

	


}
