package com.shop.service;

import java.util.List;

import com.shop.entity.Favorite;

public interface FavoriteService {
	   public int deleteById(Integer favoriteid);

	   public int insert(Favorite favorite);

	   public Favorite selectById(Integer favoriteid);
	   
	   public Favorite selectByProductidAndUserid(Integer productid, Integer userid);

	   public int update(Favorite favorite);

	   public List<Favorite> selectByUseridWithProduct(Integer userid);
}
