package com.shop.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
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
import com.shop.entity.Product;
import com.shop.entity.Productpicture;
import com.shop.entity.User;
import com.shop.service.ProductpictureService;
import com.shop.utils.Message;

@Controller
public class ProductpictureController {

	@Autowired
	private ProductpictureService productpictureService;

	/**
	 * 查询所有图片(分页查询)
	 * 
	 * @return
	 */
	@RequestMapping("/productpicture/view")
	public String viewProductpicture(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber,
			Model model, Integer productid, HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return "login";
		}
		if(user.getUsertype() != 1) {
			return "frontend/index";
		}
		
		PageHelper.startPage(pagenumber, 10);
		if (productid == null) {
			List<Productpicture> productpicture = productpictureService.selectAllWithProductname();
			PageInfo pageInfo = new PageInfo(productpicture, 5);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("productid", productid);
			System.out.println(pageInfo.getList());
			System.out.println("no id");

		} else {
			List<Productpicture> productpicture = productpictureService.selectByProductid(productid);
			PageInfo pageInfo = new PageInfo(productpicture, 5);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("productid", productid);
			System.out.println(pageInfo.getList());
			System.out.println("id");
		}
		return "backend/productpicture-list";
	}

	/**
	 * 商品图片保存
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping(value = "/productpicture/insert", method = RequestMethod.POST)
	@ResponseBody
	public Message registProductpicture(Productpicture productpicture, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}

		if (user.getUsertype() == 1) {
			productpictureService.insert(productpicture);
			return Message.success();
		} else {
			return Message.error().add("error", "权限不够");
		}

	}

	/**
	 * 数据回显
	 * 
	 * @return productpictureid
	 */
	@RequestMapping(value = "/productpicture/find/{productpictureid}", method = RequestMethod.GET)
	@ResponseBody
	public Message findProductpicture(@PathVariable("productpictureid") Integer productpictureid, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}

		Productpicture productpicture = productpictureService.selectById(productpictureid);
		return Message.success().add("productpicture", productpicture);
	}

	/**
	 * 更新数据
	 * 
	 * @param productpicture
	 * @return
	 */
	@RequestMapping(value = "/productpicture/update/{productpictureid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateProductpicture(Productpicture productpicture, HttpServletRequest request, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}

		if (productpictureService.selectById(productpicture.getProductpictureid()).getProductpictureid() != null && productpicture.getProductpicturesrc() != null && productpicture.getProductpicturesrc().substring(13).equals(productpictureService.selectById(productpicture.getProductpictureid()).getProductpicturesrc())) {

			ServletContext sc = request.getSession().getServletContext();
			String dir = sc.getRealPath("/upload/");
			String src = productpictureService.selectById(productpicture.getProductpictureid()).getProductpicturesrc();
			if(!src.isEmpty()) {
				String path = dir + src.substring(13);
				File file = new File(path);
				file.delete();
			}
		}

		productpictureService.update(productpicture);
		return Message.success();

	}
	
	
	/**
	 * [新增,更新]模态框关闭时清理图片
	 * @param productid
	 * @param productsrc
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/productpicture/productpicturesrc/delete/", method=RequestMethod.POST)
	@ResponseBody
	public Message deleteProductsrc(@RequestParam(value="productid", required=false)Integer productpictureid, @RequestParam(value="productsrc", required=false)String productpicturesrc, HttpSession session, HttpServletRequest request) {
		
		User user = (User)session.getAttribute("user");
		System.out.println(productpictureid+","+productpicturesrc);
		/**
		 * 管理员未登录
		 */
		if(user == null) {
			return Message.error().add("error", "用户未登录");
		}
		
		/**
		 * 未上传图片
		 */
		if(productpicturesrc == null) {
			System.out.println("未上传图片");
			return Message.success();
		}
		/**
		 * 服务器保存图片地址
		 */
		ServletContext sc = request.getSession().getServletContext();
		String dir = sc.getRealPath("/upload/");
		
		/**
		 * 新增时关闭模态框
		 */
		if(productpictureid == null) {
			
			String src = productpicturesrc;
			String path = dir + src;
			File file = new File(path);
			file.delete();
			System.out.println("新增时关闭模态框");
			return Message.success();
		}else {
			
			/**
			 * 更新时关闭模态框
			 */
			Productpicture productpicture = productpictureService.selectById(productpictureid);
			
			/**
			 * 和数据库中的一样,说明未重新上传,不需要删除
			 */
			if(productpicture.getProductpicturesrc().substring(13).equals(productpicturesrc)) {
				System.out.println("更新时和数据库一样");
				return Message.success();
			}else {
				/**
				 * 和数据库中的不一样,说明上传了新的图片,需要删除
				 */
				String src = productpicturesrc;
				System.out.println(src);
				String path = dir + src;
				System.out.println(path);
				File file = new File(path);
				boolean flag = file.delete();
				System.out.println(flag);
				System.out.println("更新时和数据库不一样");
				return Message.success();
			}
		}
	}
	
	

	/**
	 * 删除商品图片
	 * 
	 * @param productids
	 * @return
	 */
	@RequestMapping(value = "/productpicture/delete/{productpictureids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteProductpicture(@PathVariable("productpictureids") String productpictureids,
			HttpServletRequest request, HttpSession session) {

		User user = (User)session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "未登录");
		}
		if(user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}
		
		String[] productpictureid = productpictureids.split("-");
		for (int i = 0; i < productpictureid.length; i++) {
			Productpicture productpicture = productpictureService.selectById(Integer.parseInt(productpictureid[i]));

			ServletContext sc = request.getSession().getServletContext();
			String dir = sc.getRealPath("/upload/");
			String src = productpicture.getProductpicturesrc();
			if(!src.isEmpty()) {
				String path = dir + src.substring(13);
				File file = new File(path);
				file.delete();
			}
			productpictureService.deleteById(Integer.parseInt(productpictureid[i]));
		}

		return Message.success();
	}

}
