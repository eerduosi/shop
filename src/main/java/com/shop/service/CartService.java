package com.shop.service;

import java.util.List;

import com.shop.entity.Cart;

public interface CartService {
	public int deleteById(Integer cartid);

	public int insert(Cart cart);

	public Cart selectById(Integer cartid);
	
	public Cart selectByProductid(Integer productid);

	public int update(Cart cart);

	public List<Cart> selectByUseridWithProduct(Integer userid);
}
