package com.shop.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Cart;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.mapper.CartMapper;
import com.shop.service.CartService;
import com.shop.service.ProductService;
import com.shop.utils.Message;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@Autowired
	private ProductService productService;

	@RequestMapping("/cart/view")
	public String viewCart(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber, Model model,HttpSession session) {

		User user = (User) session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		PageHelper.startPage(pagenumber, 10);
		List<Cart> carts =  cartService.selectByUseridWithProduct(user.getUserid());
		
		PageInfo pageInfo = new PageInfo(carts, 5);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return "frontend/cart-list";
		
	}
	
	@RequestMapping(value="/cart/edit",method=RequestMethod.GET)
	@ResponseBody
	public Message editCartProduct(Integer productid,Integer quantity,Cart cart,HttpSession session) {
		Cart resultCount = cartService.selectByProductid(productid);
		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "请登录");
		}
		
		Product product = productService.selectById(productid);
		cart.setProductid(productid);
		cart.setUserid(user.getUserid());
		if(resultCount!=null) {
			//设置cartid
			cart.setCartid(resultCount.getCartid());
			//更新quantity
			if(quantity==1) {
				quantity = quantity+resultCount.getQuantity();
			}
			cart.setQuantity(quantity);

			if(product.getProductquantity() - cart.getQuantity() < 0) {
				return Message.error().add("error", "库存不足");
			}
			
			System.out.println("更新购物车成功");
			cartService.update(cart);
		}else {
			/**
			 * 判断库存
			 */
			if(product.getProductquantity() - cart.getQuantity() < 0) {
				return Message.error().add("error", "库存不足");
			}
			
			cart.setQuantity(quantity);
			cartService.insert(cart);
			System.out.println("添加购物车成功");
		}
		
		return Message.success();
	}
	
	
	
	/**
	 * 删除购物车内商品
	 * 
	 * @param cartids
	 * @return
	 */
	@RequestMapping(value = "/cart/delete/{cartid}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteCart(@PathVariable("cartid") Integer cartid,HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		Cart cart = cartService.selectById(cartid);
		
		if(!(user.getUserid().equals(cart.getUserid()))) {
			return Message.error().add("error", "删除错误");
		}
		
		
		cartService.deleteById(cartid);

		return Message.success();

	}
	  
	

}
