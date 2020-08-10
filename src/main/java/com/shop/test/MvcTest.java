package com.shop.test;

import java.util.List;

import javax.naming.spi.DirStateFactory.Result;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.github.pagehelper.PageInfo;
import com.shop.entity.Product;
import com.shop.entity.User;

/**
 * 
 * 
 * @author bxy19
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = { "classpath:applicationContext.xml", "classpath:springmvc.xml", })
public class MvcTest {
	// 传入SpringMVC的ioc
	@Autowired
	WebApplicationContext context;
	// 虚拟mvc请求,用来获取处理结果
	private MockMvc mockMvc;

	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}

	@Test
	public void testPage() throws Exception {
		// 模拟请求拿到返回值
		MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/product/view").param("pagenumber", "1")).andReturn();
		
		MockHttpServletRequest request = mvcResult.getRequest();
		PageInfo pi =  (PageInfo) request.getAttribute("pageInfo");
		System.out.println("当前页码"+pi.getPageNum());
		System.out.println("总页码"+pi.getPages());
		System.out.println("总记录数"+pi.getTotal());
		System.out.println("在页面连续显示的页码");
		int[] nums = pi.getNavigatepageNums();
		for(int i: nums) {
			System.out.println(" "+i);
		}
		
		//获取用户数据
		/*List<User> list = pi.getList();
		for(User user:list) {
			System.out.println("userid : "+user.getUserid()+"==>username : "+user.getUsername());
		}*/
		List<Product> list = pi.getList();
		for(Product product:list) {
			System.out.println("productid : "+product.getProductid()+"==>productname : "+product.getProductname());
		}
		
	}

}
