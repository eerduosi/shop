package com.shop.mapper;

import java.util.List;

import com.shop.entity.Orderdetail;

public interface OrderdetailMapper {
    int deleteById(Integer orderdetailid);

    int insert(Orderdetail orderdetail);

    Orderdetail selectById(Integer orderdetailid);

    int update(Orderdetail orderdetail);
    
    List<Orderdetail> selectByUserid(Integer userid);

	int deleteByOrderno(Integer orderno);

	List<Orderdetail> selectByOrderno(Integer orderno);

}