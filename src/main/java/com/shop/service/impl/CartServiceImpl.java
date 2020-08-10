package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Cart;
import com.shop.mapper.CartMapper;
import com.shop.service.CartService;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
	
	@Override
	public int deleteById(Integer cartid) {
		// TODO Auto-generated method stub
		return cartMapper.deleteById(cartid);
	}

	@Override
	public int insert(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.insert(cart);
	}

	@Override
	public Cart selectById(Integer cartid) {
		// TODO Auto-generated method stub
		return cartMapper.selectById(cartid);
	}

	@Override
	public int update(Cart cart) {
		// TODO Auto-generated method stub
		return cartMapper.update(cart);
	}

	@Override
	public List<Cart> selectByUseridWithProduct(Integer userid) {
		// TODO Auto-generated method stub
		return cartMapper.selectByUseridWithProduct(userid);
	}

	@Override
	public Cart selectByProductid(Integer productid) {
		// TODO Auto-generated method stub
		return cartMapper.selectByProductid(productid);
	}

}
