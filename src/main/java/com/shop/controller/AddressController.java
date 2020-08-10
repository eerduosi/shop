package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.taglibs.standard.tag.el.fmt.MessageTag;
import org.mybatis.generator.codegen.ibatis2.sqlmap.elements.InsertElementGenerator;
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
import com.shop.entity.Address;
import com.shop.entity.User;
import com.shop.service.AddressService;
import com.shop.utils.Message;

@Controller
public class AddressController {

	@Autowired
	private AddressService addressService;

	/**
	 * 查询地址(分页查询)
	 * 
	 * @return
	 */
	@RequestMapping("/address/view")
	public String viewUser(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber,
			Integer addressid, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		
		if(user == null) {
			return "login";
		}
		
		if (user.getUsertype() != 1) {
			if(addressid == null) {
			PageHelper.startPage(pagenumber, 10);
			List<Address> addresses = addressService.selectByUseridWithUsername(user.getUserid());
			PageInfo pageInfo = new PageInfo(addresses, 5);
			model.addAttribute("pageInfo", pageInfo);
			
			return "frontend/address-list";
			}else {
				PageHelper.startPage(pagenumber, 10);
				List<Address> addresses = addressService.selectById(addressid);
				PageInfo pageInfo = new PageInfo(addresses, 5);
				model.addAttribute("pageInfo", pageInfo);
				
				return "frontend/order-address-list";
			}
		} else {
		
			Address addresses = addressService.selectByAddressid(addressid);
			
			model.addAttribute("addresses", addresses);
			return "backend/order-address-list";
		}
	}

	/**
	 * 新增地址
	 * 
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/address/insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insertAddress(Address address,HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		if(!(user.getUserid().equals(address.getUserid()))) {
			return Message.error().add("error", "添加错误");
		}
		
		addressService.insert(address);
		return Message.success();

	}

	/**
	 * 数据回显
	 * 
	 * @return
	 */
	@RequestMapping(value = "/address/find/{addressid}", method = RequestMethod.GET)
	@ResponseBody
	public Message findAddress(@PathVariable("addressid") Integer addressid,HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		Address address = addressService.selectByAddressid(addressid);
		
		if(!(user.getUserid().equals(address.getUserid()))) {
			return Message.error().add("error", "获取信息失败");
		}
		
		return Message.success().add("address", address);

	}

	/**
	 * 更新数据
	 * 
	 * @param address
	 * @return
	 */
	@RequestMapping(value = "/address/update/{addressid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateAddress(Address address, HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		if(!(user.getUserid().equals(address.getUserid()))) {
			return Message.error().add("error", "更新错误");
		}
		
		addressService.update(address);
		return Message.success();

	}

	/**
	 * 删除地址
	 * 
	 * @param addressids
	 * @return
	 */
	@RequestMapping(value = "/address/delete/{addressid}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteAddress(@PathVariable("addressid") Integer addressid, HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		Address address =  addressService.selectByAddressid(addressid);
		
		if(!(user.getUserid().equals(address.getUserid()))) {
			return Message.error().add("error", "删除错误");
		}

		
		addressService.deleteById(addressid);
		return Message.success();

	}

}
