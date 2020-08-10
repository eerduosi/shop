package com.shop.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.service.UserService;
import com.shop.utils.Message;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/**
	 * 查询所有用户(分页查询)
	 * 
	 * @return
	 */
	@RequestMapping("/user/view")
	public String viewUser(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "login";
		} else {
			if (user.getUsertype() == 1) {
				PageHelper.startPage(pagenumber, 10);
				List<User> users = userService.selectByUsertype(0);
				PageInfo pageInfo = new PageInfo(users, 5);
				model.addAttribute("pageInfo", pageInfo);
				return "backend/user-list";
			}

			return "frontend/user-list";
		}
	}

	/**
	 * 验证用户名重复
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping(value = "/user/checkusername")
	@ResponseBody
	public Message checkusername(@RequestParam("username") String username,Integer userid, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		List<User> list = null;
		if (user == null) {
			list = userService.checkByUsername(username);
			System.out.println("用户注册时验证");
		} else {
			if(user.getUsertype() == 1) {
				if(userid != null) {
					System.out.println(username+","+userid);
					list = userService.checkByUsernameAndUserid(username, userid);
				}else {
					list = userService.checkByUsername(username);
				}
				
			}else {
				list = userService.checkByUsernameAndUserid(username, user.getUserid());
			}
		}
		if (list.isEmpty()) {
			System.out.println("success");
			return Message.success();
		} else {
			System.out.println("error");
			return Message.error().add("error", "用户名重复");
		}
	}

	/**
	 * 验证手机号重复
	 * 
	 * @param username
	 * @return
	 */
	@RequestMapping("/user/checkuserphone")
	@ResponseBody
	public Message checkuserphone(@RequestParam("userphone") String userphone, Integer userid, HttpSession session) {
		
		User user = (User) session.getAttribute("user");
		List<User> list = null;
		if(user == null) {
			list = userService.checkByUserphone(userphone);
		}else {
			if(user.getUsertype() == 1) {
				if(userid != null) {
					list = userService.checkByUserphoneAndUserid(userphone, userid);
				}
				else{
					list = userService.checkByUserphone(userphone);
				}
			}else {
				list = userService.checkByUserphoneAndUserid(userphone, user.getUserid());
			}
		}
		if (list.isEmpty()) {
			System.out.println("success");
			return Message.success();
		} else {
			System.out.println("error");
			return Message.error().add("error", "手机号已注册");
		}
	}

	/**
	 * 新增用户
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/user/insert", method = RequestMethod.POST)
	@ResponseBody
	public Message insertUser(User user, HttpSession session) {
		
		User users = (User) session.getAttribute("user");
		if(users == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		
		if (users.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		} 
		
		
		
		userService.insert(user);
		return Message.success();

	}

	/**
	 * 数据回显
	 * 
	 * @return
	 */
	@RequestMapping(value = "/user/find/{userid}", method = RequestMethod.GET)
	@ResponseBody
	public Message findUser(@PathVariable("userid") Integer userid) {

		User user = userService.selectById(userid);
		return Message.success().add("user", user);

	}

	/**
	 * 管理员更新用户信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/user/update/{userid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateUser(User user,HttpSession session) {

		User users = (User)session.getAttribute("user");
		if(users == null) {
			return Message.error().add("error", "用户未登录");
		}
		if(users.getUsertype() != 1	) {
			return Message.error().add("error", "权限不够");
		}
		
		userService.update(user);
		return Message.success();

	}
	

	/**
	 * 删除用户
	 * 
	 * @param userids
	 * @return
	 */
	@RequestMapping(value = "/user/delete/{userids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteUser(@PathVariable("userids") String userids, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		if (user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		} 

		String[] userid = userids.split("-");
		for (int i = 0; i < userid.length; i++) {
			userService.deleteById(Integer.parseInt(userid[i]));
		}

		return Message.success();
	}

	/**
	 * 用户注册
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/user/regist", method = RequestMethod.POST)
	@ResponseBody
	public Message registUser(User user) {
		
		
		
		userService.regist(user);
		return Message.success();
	}
	
	
	/**
	 * 用户更新个人信息
	 * 
	 * @param user
	 * @return
	 */
	@RequestMapping(value = "/user/edit/{userid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message editUser(User user,HttpSession session) {

		User users = (User)session.getAttribute("user");
		if(users == null) {
			return Message.error().add("error", "用户未登录");
		}
		if(!(user.getUserid().equals(users.getUserid()))) {
			return Message.error().add("error", "操作错误");
		}
		
		
		
		
		userService.update(user);
		user = userService.selectById(user.getUserid());
		session.setAttribute("user", user);
		System.out.println(user);
		return Message.success();

	}
	
	
	

	/**
	 * 地址回显用户
	 * 
	 * @return
	 */
	@RequestMapping("/username")
	@ResponseBody
	public Message getName(HttpServletRequest request, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if(user == null ) {
			return Message.error().add("error", "用户未登录");
		}
		user = userService.selectById(user.getUserid());
		return Message.success().add("user", user);

	}

}
