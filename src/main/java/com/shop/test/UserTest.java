package com.shop.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.ViewRendererServlet;

import com.shop.entity.Product;
import com.shop.entity.Producttype;
import com.shop.entity.User;
import com.shop.mapper.ProductMapper;
import com.shop.mapper.ProducttypeMapper;
import com.shop.mapper.UserMapper;
import com.shop.service.UserService;

/**
 * 测试mapper层的方法 使用SpringTest模块
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath:applicationContext.xml" })
public class UserTest {

	@Autowired
	private UserService userService;

	@Autowired
	private ProducttypeMapper producttypeMapper;

	@Autowired
	private SqlSession sqlSession;

	@Test
	public void testCRUD() {
		/*//1.创建IOC容器
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2.从容器中获取mapper
		UserMapper bean = applicationContext.getBean(UserMapper.class);*/
		System.out.println(userService);
		//1.插入
//		userService.insert(new User(2, "1", "1", "1", 1, "1", "1", "1", "1", 1, "1", "1"));
		//2.循环插入
		/*for() {
			userService.insert(new User(2, "1", "1", "1", 1, "1", "1", "1", "1", 1, "1", "1"));
		}*/
		//用户批量添加
		UserMapper mapper = sqlSession.getMapper(UserMapper.class);
		for(int i = 0;i < 20;i++) {
			String username = UUID.randomUUID().toString().substring(0, 5)+i;
			mapper.insert(new User(null, username, "1", "1", 1, "1", "1", 0, null, null));
		}
		/*
		ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);
		for(int i = 0;i < 20;i++) {
			String name = UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insert(new Product(null, 2, name+"name", "1.99", 11, name+"detail", 1, null, null));
		}*/
	}

}
