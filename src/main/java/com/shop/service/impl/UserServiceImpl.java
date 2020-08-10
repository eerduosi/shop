package com.shop.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.entity.User;
import com.shop.mapper.UserMapper;
import com.shop.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public int deleteById(Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.deleteById(userid);
	}

	@Override
	public int insert(User user) {
		// TODO Auto-generated method stub
		return userMapper.insert(user);
	}

	@Override
	public User selectById(Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.selectById(userid);
	}

	@Override
	public int update(User user) {
		// TODO Auto-generated method stub
		return userMapper.update(user);
	}

	@Override
	public List<User> selectByUsertype(Integer usertype) {
		// TODO Auto-generated method stub
		return userMapper.selectByUsertype(usertype);
	}

	@Override
	public User login(String username, String userpassword) {
		// TODO Auto-generated method stub
		return userMapper.login(username, userpassword);
	}

	@Override
	public List<User> checkByUsername(String username) {
		// TODO Auto-generated method stub
		return userMapper.checkByUsername(username);
	}

	@Override
	public List<User> checkByUserphone(String userphone) {
		// TODO Auto-generated method stub
		return userMapper.checkByUserphone(userphone);
	}

	@Override
	public List<User> selectAll() {
		// TODO Auto-generated method stub
		return userMapper.selectAll();
	}

	@Override
	public int regist(User user) {
		// TODO Auto-generated method stub
		return userMapper.regist(user);
	}

	@Override
	public List<User> checkByUsernameAndUserid(String username, Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.checkByUsernameAndUserid(username, userid);
	}

	@Override
	public List<User> checkByUserphoneAndUserid(String userphone, Integer userid) {
		// TODO Auto-generated method stub
		return userMapper.checkByUserphoneAndUserid(userphone, userid);
	}

}
