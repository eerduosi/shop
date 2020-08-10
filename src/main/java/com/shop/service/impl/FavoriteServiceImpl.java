package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Favorite;
import com.shop.mapper.FavoriteMapper;
import com.shop.service.FavoriteService;

@Service
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	private FavoriteMapper favoriteMapper;
	
	
	
	@Override
	public int deleteById(Integer favoriteid) {
		// TODO Auto-generated method stub
		return favoriteMapper.deleteById(favoriteid);
	}

	@Override
	public int insert(Favorite favorite) {
		// TODO Auto-generated method stub
		return favoriteMapper.insert(favorite);
	}

	@Override
	public Favorite selectById(Integer favoriteid) {
		// TODO Auto-generated method stub
		return favoriteMapper.selectById(favoriteid);
	}

	@Override
	public int update(Favorite favorite) {
		// TODO Auto-generated method stub
		return favoriteMapper.update(favorite);
	}

	@Override
	public List<Favorite> selectByUseridWithProduct(Integer userid) {
		// TODO Auto-generated method stub
		return favoriteMapper.selectByUseridWithProduct(userid);
	}

	@Override
	public Favorite selectByProductidAndUserid(Integer productid, Integer userid) {
		// TODO Auto-generated method stub
		return favoriteMapper.selectByProductidAndUserid(productid, userid);
	}

}
