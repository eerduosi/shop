package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.Address;
import com.shop.mapper.AddressMapper;
import com.shop.service.AddressService;

@Service
public class AddressServiceImpl implements AddressService {

	@Autowired
	private AddressMapper addressMapper;
	
	@Override
	public int deleteById(Integer addressid) {
		// TODO Auto-generated method stub
		return addressMapper.deleteById(addressid);
	}

	@Override
	public int insert(Address address) {
		// TODO Auto-generated method stub
		return addressMapper.insert(address);
	}

	@Override
	public List<Address> selectById(Integer addressid) {
		// TODO Auto-generated method stub
		return addressMapper.selectById(addressid);
	}

	@Override
	public int update(Address address) {
		// TODO Auto-generated method stub
		return addressMapper.update(address);
	}

	@Override
	public List<Address> selectByUseridWithUsername(Integer userid) {
		// TODO Auto-generated method stub
		return addressMapper.selectByUseridWithUsername(userid);
	}

	@Override
	public Address selectByAddressid(Integer addressid) {
		// TODO Auto-generated method stub
		return addressMapper.selectByAddressid(addressid);
	}

}
