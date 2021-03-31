package com.one.burger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/stock")
public class StockController {
	
	@GetMapping("/branch")
	public String branchStock() {
		log.info("branchStock()");
		
		return "stock/branch";
	}

}
