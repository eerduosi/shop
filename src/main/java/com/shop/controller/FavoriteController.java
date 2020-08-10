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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.shop.entity.Cart;
import com.shop.entity.Favorite;
import com.shop.entity.Product;
import com.shop.entity.User;
import com.shop.service.FavoriteService;
import com.shop.service.ProductService;
import com.shop.utils.Message;

@Controller
public class FavoriteController {

	@Autowired
	private FavoriteService favoriteService;

	@Autowired
	private ProductService productService;

	@RequestMapping("/favorite/view")
	public String viewFavorite(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber, Model model,
			HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (user == null) {
			return "login";
		}
		PageHelper.startPage(pagenumber, 10);
		List<Favorite> favorites = favoriteService.selectByUseridWithProduct(user.getUserid());
		PageInfo pageInfo = new PageInfo(favorites, 5);
		model.addAttribute("pageInfo", pageInfo);

		return "frontend/favorite-list";
	}

	@RequestMapping("/favorite/edit")
	@ResponseBody
	public Message editFavoriteProduct(Integer productid, Favorite favorite, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}

		Product product = productService.selectById(productid);
		favorite.setProductid(productid);
		favorite.setUserid(user.getUserid());
		Favorite resultCount = favoriteService.selectByProductidAndUserid(productid, user.getUserid());

		if (resultCount != null) {
			return Message.error().add("error", "已存在心愿单中");
		}
		
		favoriteService.insert(favorite);
		return Message.success();

	}

	/**
	 * 删除心愿单内商品
	 * 
	 * @param favoriteids
	 * @return
	 */
	@RequestMapping(value = "/favorite/delete/{favoriteid}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteFavorite(@PathVariable("favoriteid") Integer favoriteid, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		Favorite favorite = favoriteService.selectById(favoriteid);
		if(!(favorite.getUserid().equals(user.getUserid()))) {
			return Message.error().add("error", "删除错误");
		}
		
		favoriteService.deleteById(favoriteid);
		return Message.success();

	}

}
