package com.shop.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shop.entity.User;

public interface UserMapper {
	public int deleteById(Integer userid);

	public int insert(User user);

	public User selectById(Integer userid);

	public int update(User user);

	public List<User> selectByUsertype(Integer usertype);

	public User login(@Param("username") String username, @Param("userpassword") String userpassword);

	public List<User> checkByUsername(String username);

	public List<User> checkByUsernameAndUserid(@Param("username")String username,@Param("userid")Integer userid);
	
	public List<User> checkByUserphone(String userphone);
	
	public List<User> checkByUserphoneAndUserid(@Param("userphone")String userphone,@Param("userid")Integer userid);

	public List<User> selectAll();

	public int regist(User user);

}