package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Orderdetail;
import com.shop.mapper.OrderdetailMapper;
import com.shop.service.OrderdetailService;

@Service
public class OrderdetailServiceImpl implements OrderdetailService {
	
	@Autowired
	private OrderdetailMapper orderdetailMapper; 

	@Override
	public int deleteById(Integer orderdetailid) {
		// TODO Auto-generated method stub
		return orderdetailMapper.deleteById(orderdetailid);
	}

	@Override
	public int insert(Orderdetail orderdetail) {
		// TODO Auto-generated method stub
		return orderdetailMapper.insert(orderdetail);
	}

	@Override
	public Orderdetail selectById(Integer orderdetailid) {
		// TODO Auto-generated method stub
		return orderdetailMapper.selectById(orderdetailid);
	}

	@Override
	public int update(Orderdetail orderdetail) {
		// TODO Auto-generated method stub
		return orderdetailMapper.update(orderdetail);
	}

	@Override
	public List<Orderdetail> selectByUserid(Integer userid) {
		// TODO Auto-generated method stub
		return orderdetailMapper.selectByUserid(userid);
	}

	@Override
	public int deleteByOrderno(Integer orderno) {
		// TODO Auto-generated method stub
		return orderdetailMapper.deleteByOrderno(orderno);
	}

	@Override
	public List<Orderdetail> selectByOrderno(Integer orderno) {
		// TODO Auto-generated method stub
		return orderdetailMapper.selectByOrderno(orderno);
	}

}
