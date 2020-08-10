package com.shop.controller;

import java.sql.Timestamp;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpSession;

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
import com.shop.entity.Cart;
import com.shop.entity.Order;
import com.shop.entity.Orderdetail;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.service.CartService;
import com.shop.service.OrderService;
import com.shop.service.OrderdetailService;
import com.shop.service.ProductService;
import com.shop.utils.Message;

@Controller
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private OrderdetailService orderdetailService;

	@Autowired
	private CartService cartService;

	@Autowired
	private ProductService productService;

	/**
	 * 查询订单(分页查询)
	 * 
	 * @return
	 */
	@RequestMapping("/orders/view")
	public String viewProduct(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "login";
		}
		PageHelper.startPage(pagenumber, 8);
		if (user.getUsertype() == 1) {
			List<Order> orders = orderService.selectAll();
			PageInfo pageInfo = new PageInfo(orders, 5);
			model.addAttribute("pageInfo", pageInfo);

			return "backend/order-list";
		} else {
			List<Order> order = orderService.selectByUserid(user.getUserid());
			PageInfo pageInfo = new PageInfo(order, 5);
			model.addAttribute("pageInfo", pageInfo);
			return "frontend/order-list";
		}

	}

	@RequestMapping("/order/edit")
	@ResponseBody
	public Message insertOrder(@RequestParam(value="addressid", required=false)Integer addressid, HttpSession session) {
		
		// 获取当前用户
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		if(addressid == null) {
			return Message.error().add("error", "请选择收货地址");
		}
		
		List<Cart> carts = cartService.selectByUseridWithProduct(user.getUserid());
		if(carts.isEmpty()) {
			return Message.error().add("error", "购物车为空,请添加商品");
		}
		
		/**
		 * 判断库存
		 */
		for (Cart cart : carts) {
			Product product = productService.selectById(cart.getProductid());
			if(product.getProductquantity() - cart.getQuantity() < 0) {
				return Message.error().add("error", "库存不足");
			}
		}
		
		
		Order order = new Order();
		Integer orderno = Math.abs((int) System.currentTimeMillis() + new Random().nextInt(100));

		for (Cart cart : carts) {
			Orderdetail orderdetail = new Orderdetail();
			Product product = productService.selectById(cart.getProductid());

			orderdetail.setUserid(user.getUserid());
			orderdetail.setOrderno(orderno);
			orderdetail.setProductid(product.getProductid());
			orderdetail.setProductcurrentprice(product.getProductprice());
			orderdetail.setProductquantity(cart.getQuantity());
			float totalprice = (cart.getQuantity() * Float.parseFloat(product.getProductprice()));
			orderdetail.setProducttotalprice(String.format("%.2f", totalprice));
			
			product.setProductquantity(product.getProductquantity() - cart.getQuantity());
			productService.update(product);
			cart = cartService.selectByProductid(product.getProductid());
			cartService.deleteById(cart.getCartid());
			orderdetailService.insert(orderdetail);

		}
		List<Orderdetail> orderdetails = orderdetailService.selectByOrderno(orderno);
		float ordercash = 0;
		for (Orderdetail orderdetail : orderdetails) {
			ordercash += Float.parseFloat(orderdetail.getProducttotalprice());
		}
		order.setUserid(user.getUserid());
		order.setOrderno(orderno);
		order.setAddressid(addressid);
		order.setOrdercash(Float.toString(ordercash));
		System.out.println(order);
		orderService.insert(order);

		return Message.success();
	}

	/**
	 * 派送订单
	 * 
	 */
	@RequestMapping(value = "/order/send/{orderid}", method = RequestMethod.POST)
	@ResponseBody
	public Message sendOrder(@PathVariable("orderid") Integer orderid,HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}
		
		Order order = orderService.selectById(orderid);
		if (order.getOrdersendtime() != null) {
			return Message.error().add("error", "订单已派送");
		}
		String ordersendtime = String.valueOf(new Timestamp(System.currentTimeMillis()));
		order.setOrdersendtime(ordersendtime);
		int rowCount = orderService.update(order);
		if (rowCount != 0) {
			return Message.success().add("success", "订单开始派送");
		} else {
			return Message.error().add("error", "操作失败");
		}
	}

	/**
	 * 完成订单
	 * 
	 */
	@RequestMapping(value = "/order/end/{orderid}", method = RequestMethod.POST)
	@ResponseBody
	public Message endOrder(@PathVariable("orderid") Integer orderid, HttpSession session) {
		
		User user = (User)session.getAttribute("user");
		
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		Order order = orderService.selectById(orderid);
		
		if(!(user.getUserid().equals(order.getUserid()))) {
			return Message.error().add("error", "操作错误");
		}
		
		if (order.getOrdersendtime() == null) {
			return Message.error().add("error", "订单还未派送!");
		} else {
			if (order.getOrderendtime() != null) {
				return Message.error().add("error", "订单已完成!");
			}
			String orderendtime = String.valueOf(new Timestamp(System.currentTimeMillis()));
			order.setOrderendtime(orderendtime);
			int rowCount = orderService.update(order);
			System.out.println("rowCount" + rowCount);
			if (rowCount != 0) {
				return Message.success().add("success", "订单完成!");
			} else {
				return Message.error().add("error", "操作失败!");
			}

		}
	}

	/**
	 * 删除订单,不需要
	 * 
	 * @param orderid
	 * @return
	 */
	/*
	 * @RequestMapping(value = "/order/delete/{orderid}", method =
	 * RequestMethod.DELETE)
	 * 
	 * @ResponseBody public Message deleteUser(@PathVariable("orderid") Integer
	 * orderid) {
	 * 
	 * Order order = orderService.selectById(orderid);
	 * 
	 * orderdetailService.deleteByOrderno(order.getOrderno());
	 * 
	 * int rowCount = orderService.deleteById(orderid);
	 * 
	 * 
	 * return Message.success();
	 * 
	 * }
	 */
}
