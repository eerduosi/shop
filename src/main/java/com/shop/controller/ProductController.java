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
import com.shop.entity.Producttype;
import com.shop.entity.User;
import com.shop.service.ProductService;
import com.shop.service.ProductpictureService;
import com.shop.utils.Message;

@Controller
public class ProductController {

	@Autowired
	private ProductService productService;

	@Autowired
	private ProductpictureService porductpictureService;

	/**
	 * 查询所有商品
	 * 
	 * @return
	 */
	@RequestMapping("/product/view")
	public String viewProduct(@RequestParam(value = "pagenumber", defaultValue = "1") Integer pagenumber, Model model,
			Integer producttypeid, HttpSession session) {
		User user = (User) session.getAttribute("user");

		PageHelper.startPage(pagenumber, 8);
		if (producttypeid == null) {
			List<Product> product = productService.selectAllWithType();
			PageInfo pageInfo = new PageInfo(product, 5);
			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("producttypeid", producttypeid);
			System.out.println("no typeid");

		} else {
			List<Product> product = productService.selectByTypeId(producttypeid);
			PageInfo pageInfo = new PageInfo(product, 5);

			model.addAttribute("pageInfo", pageInfo);
			model.addAttribute("producttypeid", producttypeid);
			System.out.println("typeid");
		}
		if (user == null) {
			return "frontend/product-list";
		} else {
			if (user.getUsertype() == 1) {
				return "backend/product-list";
			} else {
				return "frontend/product-list";
			}
		}
	}

	@RequestMapping("/product/detail")
	public String productDetail(Integer productid, Model model) {

		Product product = productService.selectById(productid);
		List<Productpicture> productpicture = porductpictureService.selectByProductid(productid);
		List<Product> products = productService.selectByTypeId(product.getProducttypeid());
		System.out.println(product.getProducttypeid());
		model.addAttribute("product", product);
		model.addAttribute("productpicture", productpicture);
		model.addAttribute("products", products);

		return "frontend/product-detail";
	}

	/**
	 * 验证商品名是否重复
	 * 
	 * @param productname
	 * @return
	 */
	@RequestMapping("/prodcut/checkproductname")
	@ResponseBody
	public Message checkproductname(@RequestParam("productname") String productname, Integer productid) {
		
		
		String regx = "(^[a-zA-Z0-9\\u2E80-\\u9FFF-_]{0,20}$)";
		if(!productname.matches(regx)) {
			return Message.error().add("error", "请输入二十位以内的数字,字母,下划线作为商品名!");
		}
		

		List<Product> list = null;

		if (productid == null) {
			list = productService.checkByProductname(productname);

		} else {
			list = productService.checkByProductnameAndProductid(productname, productid);
		}
		if (list.isEmpty()) {
			// System.out.println(Message.success());
			// System.out.println("productname");
			return Message.success();
		} else {
			// System.out.println(Message.error());
			return Message.error().add("error", "商品已存在");
		}
	}

	/**
	 * 商品保存
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping(value = "/product/insert", method = RequestMethod.POST)
	@ResponseBody
	public Message registProduct(Product product, HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}
		if (user.getUsertype() != 1) {

			return Message.error().add("error", "权限不够");
		}

		productService.insert(product);
		return Message.success();

	}

	/**
	 * 数据回显
	 * 
	 * @return
	 */
	@RequestMapping(value = "/product/find/{productid}", method = RequestMethod.GET)
	@ResponseBody
	public Message findProduct(@PathVariable("productid") Integer productid) {

		Product product = productService.selectById(productid);
		return Message.success().add("product", product);
	}

	/**
	 * 更新数据
	 * 
	 * @param product
	 * @return
	 */
	@RequestMapping(value = "/prodcut/update/{productid}", method = RequestMethod.PUT)
	@ResponseBody
	public Message updateProduct(Product product, HttpSession session, HttpServletRequest request) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "请登录");
		}
		if (user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");

		}
		// 如果前台传来的图片地址和数据库中存的图片地址不一样,删除服务器中的原图片
		if (productService.selectById(product.getProductid()).getProductsrc() != null && product.getProductsrc() != null && product.getProductsrc()
				.substring(13).equals(productService.selectById(product.getProductid()).getProductsrc())) {

			// 获取服务器中的图片地址
			ServletContext sc = request.getSession().getServletContext();
			String dir = sc.getRealPath("/upload/");
			String path = dir + productService.selectById(product.getProductid()).getProductsrc().substring(13);

			// 删除文件
			File file = new File(path);
			file.delete();

		}

		productService.update(product);
		return Message.success();

	}

	/**
	 * [新增,更新]模态框关闭时清理图片
	 * 
	 * @param productid
	 * @param productsrc
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/product/productsrc/delete/", method = RequestMethod.POST)
	@ResponseBody
	public Message deleteProductsrc(@RequestParam(value = "productid", required = false) Integer productid,
			@RequestParam(value = "productsrc", required = false) String productsrc, HttpSession session,
			HttpServletRequest request) {

		User user = (User) session.getAttribute("user");
		System.out.println(productid + "," + productsrc);
		/**
		 * 管理员未登录
		 */
		if (user == null) {
			return Message.error().add("error", "用户未登录");
		}

		/**
		 * 未上传图片
		 */
		if (productsrc == null) {

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
		if (productid == null) {

			String src = productsrc;
			String path = dir + src;
			File file = new File(path);
			file.delete();

			return Message.success();
		} else {

			/**
			 * 更新时关闭模态框删除图片
			 */
			Product product = productService.selectById(productid);

			/**
			 * 和数据库中的一样,说明未重新上传,不需要删除
			 */
			if (product.getProductsrc().substring(13).equals(productsrc)) {

				return Message.success();
			} else {
				/**
				 * 和数据库中的不一样,说明上传了新的图片,需要删除
				 */
				String src = productsrc;
				System.out.println(src);
				String path = dir + src;
				System.out.println(path);
				File file = new File(path);
				boolean flag = file.delete();
				System.out.println(flag);

				return Message.success();
			}
		}
	}

	/**
	 * 删除商品
	 * 
	 * @param productids
	 * @return
	 */
	@RequestMapping(value = "/product/delete/{productids}", method = RequestMethod.DELETE)
	@ResponseBody
	public Message deleteProduct(@PathVariable("productids") String productids, HttpServletRequest request,
			HttpSession session) {

		User user = (User) session.getAttribute("user");
		if (user == null) {
			return Message.error().add("error", "未登录");
		}
		if (user.getUsertype() != 1) {
			return Message.error().add("error", "权限不够");
		}

		// 获取服务器中的地址
		ServletContext sc = request.getSession().getServletContext();
		String dir = sc.getRealPath("/upload/");

		String[] productid = productids.split("-");
		for (int i = 0; i < productid.length; i++) {

			Product product = productService.selectById(Integer.parseInt(productid[i]));
			String src = product.getProductsrc();
			if(!src.isEmpty()) {
				String path = dir + src.substring(13);
				File file = new File(path);
				file.delete();
			}

			productService.deleteById(Integer.parseInt(productid[i]));
		}

		return Message.success().add("success", "删除成功");
	}

	/**
	 * 商品图片获取商品名
	 * 
	 * @return
	 */
	@RequestMapping("/productname")
	@ResponseBody
	public Message getName() {

		List<Product> product = productService.selectAll();
		return Message.success().add("product", product);

	}

}
