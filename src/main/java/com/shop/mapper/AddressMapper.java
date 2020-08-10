package com.shop.mapper;

import java.util.List;

import com.shop.entity.Address;

public interface AddressMapper {
    public int deleteById(Integer addressid);

    public int insert(Address address);

    public List<Address> selectById(Integer addressid);

    public int update(Address address);

	public List<Address> selectByUseridWithUsername(Integer userid);
	
	public Address selectByAddressid(Integer addressid);

}