package com.one.burger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	//메인 페이지
	@RequestMapping("/")
	public String index() {
//		return "/WEB-INF/views/index.jsp";//view resolver가 없을 때
		return "index";//view resolver가 있을 때
	}
	
}


