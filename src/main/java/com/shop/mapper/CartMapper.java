package com.shop.mapper;

import java.util.List;

import com.shop.entity.Cart;

public interface CartMapper {
	public int deleteById(Integer cartid);

	public int insert(Cart cart);

	public Cart selectById(Integer cartid);
	
	public Cart selectByProductid(Integer productid);

	public int update(Cart cart);

	public List<Cart> selectByUseridWithProduct(Integer userid);

}