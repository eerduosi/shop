package com.shop.mapper;

import java.util.List;

import com.shop.entity.Order;

public interface OrderMapper {
	int deleteById(Integer orderid);

	int insert(Order order);

	Order selectById(Integer orderid);
	
	Order selectByOrderno(Integer orderno);

	int update(Order order);

	List<Order> selectAll();

	List<Order> selectByUserid(Integer userid);

}