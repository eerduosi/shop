package com.shop.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.shop.entity.User;
import com.shop.service.UserService;

@Controller
public class LoginController {

	@Autowired
	private UserService userService;
	

	@RequestMapping("/")
	public String logininfo() {
		
		
		return "frontend/index";
	}

	/**
	 * 添加Cookie
	 * 
	 * @param username
	 * @param userpassword
	 * @param response
	 * @param request
	 * @throws UnsupportedEncodingException
	 */
	public static void addCookie(String username, String userpassword, HttpServletResponse response,
			HttpServletRequest request) throws UnsupportedEncodingException {
		username = URLEncoder.encode(username, "UTF-8");
		Cookie nameCookie = new Cookie(username, userpassword);
		nameCookie.setPath(request.getContextPath() + "/");
		nameCookie.setMaxAge(7 * 24 * 60 * 60);
		response.addCookie(nameCookie);
	}

	@RequestMapping("/login")
	public String login(@RequestParam("username") String username,
			@RequestParam("userpassword") String userpassword, HttpSession session, HttpServletRequest request,
			HttpServletResponse response,Model model) throws UnsupportedEncodingException {
		User user = userService.login(username, userpassword);
		if (user == null) {
			model.addAttribute("error", "用户不存在请注册用户");
			return "login";
		} else {
			if (request.getParameter("rememberMe") != null) {
				addCookie(user.getUsername(), user.getUserpassword(), response, request);
			}
			
			session.setAttribute("user", user);
			if (user.getUsertype() == 1) {
				return "backend/index";
			} else {
				return "frontend/index";
			}
		}
	}

	/**
	 * @param username
	 * @param request
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	@ResponseBody
	@RequestMapping(value = "/getCookie", method = RequestMethod.POST)
	public Map<String, String> initCookie(String username, HttpServletRequest request) throws UnsupportedEncodingException {
		username = URLEncoder.encode(username, "UTF-8");
		System.out.println(username);
		Cookie[] cookie = request.getCookies();
		
		Map<String, String> map = new HashMap<>();
		for (Cookie c : cookie) {
			if (c.getName().equals(username)) {
				String userpassword = c.getValue();
				username = URLDecoder.decode(username, "UTF-8");
				System.out.println(username);
				map.put("username", username);
				map.put("userpassword", userpassword);
				System.out.println("获取成功");
				return map;
			}
		}
		System.out.println("获取失败");
		return null;
	}
	
	@RequestMapping("/loginout")
	public ModelAndView loginOut(HttpServletRequest request,HttpServletResponse response,HttpSession session) {
		
		ModelAndView mav = new ModelAndView();
		
		session.invalidate();
		mav.setViewName("frontend/index");
		
		return mav;
		
	}
}
