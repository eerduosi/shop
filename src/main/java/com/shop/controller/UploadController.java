package com.shop.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.entity.User;
import com.shop.utils.Message;

@Controller
public class UploadController {

	@RequestMapping(value = "/upload", headers = "content-type=multipart/*")
	@ResponseBody
	public Message upload(HttpServletRequest request, @RequestParam("file") MultipartFile file, HttpSession session)
			throws IOException {
		User user = (User) session.getAttribute("user");
		if(user == null) {
			return Message.error().add("error", "请登录!");
		}
		if (user.getUsertype() == 1) {
			ServletContext sc = request.getSession().getServletContext();
			String dir = sc.getRealPath("/upload");
			String type = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf(".") + 1,
					file.getOriginalFilename().length());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmss");
			Random r = new Random();
			String imgName = "";
			if ("jpg".equals(type)) {
				imgName = sdf.format(new Date()) + r.nextInt(100) + ".jpg";
			} else if ("png".equals(type)) {
				imgName = sdf.format(new Date()) + r.nextInt(100) + ".png";
			} else if ("jpeg".equals(type)) {
				imgName = sdf.format(new Date()) + r.nextInt(100) + ".jpeg";
			} else if ("gif".equals(type)) {
				imgName = sdf.format(new Date()) + r.nextInt(100) + ".gif";
			} else {
				return null;
			}
			FileUtils.writeByteArrayToFile(new File(dir, imgName), file.getBytes());
			// 返回文件路径
			return Message.success().add("src", "/shop/upload/" + imgName).add("success", "上传成功");
		} else{
			return Message.error().add("error", "权限不够");
		}
	}
}
