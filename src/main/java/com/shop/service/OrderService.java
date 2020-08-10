package com.shop.service;

import java.util.List;

import com.shop.entity.Order;

public interface OrderService {
	int deleteById(Integer orderid);

	int insert(Order order);

	Order selectById(Integer orderid);
	
	Order selectByOrderno(Integer orderno);

	int update(Order order);
	
	List<Order> selectAll();
	
	List<Order> selectByUserid(Integer userid);
	
}
