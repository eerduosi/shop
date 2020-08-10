package com.shop.service;

import java.util.List;

import com.shop.entity.Productpicture;

public interface ProductpictureService {
	public int deleteById(Integer productpictureid);

	public int insert(Productpicture productpicture);

	public Productpicture selectById(Integer productpictureid);

	public int update(Productpicture productpicture);


	public List<Productpicture> selectByProductid(Integer productid);

	public List<Productpicture> selectAll();

	public List<Productpicture> selectAllWithProductname();



}
