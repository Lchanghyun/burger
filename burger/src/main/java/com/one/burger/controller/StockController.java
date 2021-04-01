package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;
import com.one.burger.service.StockService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/stock")
public class StockController {
	
	@Autowired
	private StockService stockservice;
	
	@GetMapping("/list")
	public String branchStock(Model model) throws Exception {
		log.info("branchStock()");
		
		model.addAttribute("list", stockservice.select());
		
		return "stock/list";
	}
	
	@GetMapping("/register")
	public String register(Model model) throws Exception {
		log.info("StockRegister()");
		
		model.addAttribute("list", stockservice.select());

		return "stock/register";
	}
	
	@PostMapping("/register")
	public String PostRegister(Stock stock) throws Exception {
		log.info("StockPostRegister()");
		
		stockservice.insert(stock);
		
		return "stock/list";
	}

}
