package com.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.Favorite;

public interface FavoriteMapper {
	public int deleteById(Integer favoriteid);

	public int insert(Favorite favorite);

	public Favorite selectById(Integer favoriteid);
	
	public Favorite selectByProductidAndUserid(@Param("productid")Integer productid, @Param("userid")Integer userid);

	public int update(Favorite favorite);

	public List<Favorite> selectByUseridWithProduct(Integer userid);
}