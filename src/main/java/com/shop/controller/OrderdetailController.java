package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Orderdetail;
import com.shop.entity.User;
import com.shop.service.OrderdetailService;

@Controller
public class OrderdetailController {

	@Autowired
	private OrderdetailService orderdetailService;

	@RequestMapping("/orderdetail/view")
	public String viewProduct(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber,
			Integer orderno, Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "login";
		}
		PageHelper.startPage(pagenumber, 8);

		List<Orderdetail> orderdetails = orderdetailService.selectByOrderno(orderno);
		PageInfo pageInfo = new PageInfo(orderdetails, 5);
		model.addAttribute("pageInfo", pageInfo);

		if (user.getUsertype() == 1) {
			return "backend/orderdetail-list";
		} else {
			return "frontend/orderdetail-list";
		}

	}
}
