package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Order;
import com.shop.mapper.OrderMapper;
import com.shop.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Override
	public int deleteById(Integer orderid) {
		// TODO Auto-generated method stub
		return orderMapper.deleteById(orderid);
	}

	@Override
	public int insert(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.insert(order);
	}

	@Override
	public Order selectById(Integer orderid) {
		// TODO Auto-generated method stub
		return orderMapper.selectById(orderid);
	}

	@Override
	public int update(Order order) {
		// TODO Auto-generated method stub
		return orderMapper.update(order);
	}

	@Override
	public List<Order> selectAll() {
		// TODO Auto-generated method stub
		return orderMapper.selectAll();
	}

	@Override
	public List<Order> selectByUserid(Integer userid) {
		// TODO Auto-generated method stub
		return orderMapper.selectByUserid(userid);
	}

	@Override
	public Order selectByOrderno(Integer orderno) {
		// TODO Auto-generated method stub
		return orderMapper.selectByOrderno(orderno);
	}

}
