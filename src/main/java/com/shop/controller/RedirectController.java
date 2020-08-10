package com.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RedirectController {

	

	
	/**
	 * 跳转到login页面
	 * @return
	 */
	@RequestMapping("/login/view")
	public String viewLogin() {

		return "login";
	}
	
	/**
	 * 跳转到index页面
	 * @return
	 */
	@RequestMapping("/index/view")
	public String viewIndex() {

		return "frontend/index";
	}
	  
	
}
