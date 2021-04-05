package com.one.burger.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.one.burger.entity.Menu;
import com.one.burger.service.MenuService;
//import com.one.burger.util.UploadFileUtils;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	@Autowired
	private MenuService menuService;
	
	@GetMapping("/register")
	public void menuInsert() {
		log.info("menu-registerGet()");
	}
	
	@PostMapping("/register")
	public String menuInsertPost(Menu menu, Model model) throws Exception{
		log.info("menu-registerPost()");
		
		menuService.register(menu);
		log.info("메뉴등록완료");
		return "redirect:register";
	}
	
//	@PostMapping("/photoShow")
//	public ResponseEntity<String> 
	

}
