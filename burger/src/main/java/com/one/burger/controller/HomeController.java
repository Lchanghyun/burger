package com.one.burger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {
	
	//메인 페이지
	@GetMapping("/")
	public String index() throws Exception {
		log.info("getIndex()");
		return "index";

	}
	
	
}


