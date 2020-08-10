package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Producttype;
import com.shop.entity.User;
import com.shop.service.ProducttypeService;
import com.shop.utils.Message;

@Controller
public class ProducttypeController {

	@Autowired
	private ProducttypeService producttypeService;

	/**
	 * 管理员查询所有商品类型(分页查询)
	 * 
	 * @return
	 */
	@RequestMapping("/producttype/view")
	public String viewProducttype(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber,
			Model model,HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(user.getUsertype() != 1) {
			return "frontend/index";
		}
		
		PageHelper.startPage(pagenumber, 10);
		List<Producttype> producttype = producttypeService.selectAll();
		PageInfo pageInfo = new PageInfo(producttype, 5);
		model.addAttribute("pageInfo", pageInfo);
		return "backend/producttype-list";
		
	}

	/**
	 * 验证商品类型重复
	 * 
	 * @param producttypename
	 * @return
	 */
	@RequestMapping("/producttype/checkproducttypename")
	@ResponseBody
	public Message checkproducttypename(@RequestParam("producttypename") String producttypename) {
		List<Producttype> list = producttypeService.checkByProducttypename(producttypename);
		if (list.isEmpty()) {
			return Message.success();
		} else {
			return Message.error();
		}
	}

	/**
	 * 新增商品类型
	 * 
	 * @param producttype
	 * @return
	 */
	@RequestMapping(value = "/producttype/insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insertProducttype(Producttype producttype, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			System.out.println("user : "+user);
			return Message.error().add("error", "未登录");
		}
		System.out.println(producttype);
		if(producttype == null) {
			System.out.println("producttype"+producttype);
			return Message.error().add("error", "内容为空");
		}
		
		if (user.getUsertype() != 1) {
			System.out.println("user.getUsertype() : "+user.getUsertype());
			return Message.error().add("error", "权限不足");
		}
		
		producttypeService.insert(producttype);
		return Message.success();
	}

	/**
	 * 商品类型数据回显
	 * 
	 * @return
	 */
	@RequestMapping(value = "/producttype/find/{producttypeid}", method = RequestMethod.GET)
	@ResponseBody
	public Message findProducttype(@PathVariable("producttypeid") Integer producttypeid,HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "未登录");
		}
		if(producttypeid == null) {
			return Message.error().add("error", "数据回显错误");
		}
		
		Producttype producttype = producttypeService.selectById(producttypeid);
		return Message.success().add("producttype", producttype);
	}

	/**
	 * 更新回显数据
	 * 
	 * @param producttype
	 * @return
	 */
	@RequestMapping(value = "/producttype/update/{producttypeid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateProducttype(Producttype producttype,HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "未登录");
		}
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}
		
		producttypeService.update(producttype);
		return Message.success();
	}

	/**
	 * 删除商品类型
	 * 
	 * @param producttypeids
	 * @return
	 */
	@RequestMapping(value = "/producttype/delete/{producttypeids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteProducttype(@PathVariable("producttypeids") String producttypeids, HttpSession session) {

		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			return Message.error().add("error", "未登录");
		}
		
		if (user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}
		
		String[] producttypeid = producttypeids.split("-");
		for (int i = 0; i < producttypeid.length; i++) {
			producttypeService.deleteById(Integer.parseInt(producttypeid[i]));
		}
		return Message.success();
	}

	/**
	 * 商品获取商品类型名
	 * 
	 * @return
	 */
	@RequestMapping("/producttypename")
	@ResponseBody
	public Message getTypename() {

		List<Producttype> producttype = producttypeService.selectAll();
		return Message.success().add("producttype", producttype);

	}
}
