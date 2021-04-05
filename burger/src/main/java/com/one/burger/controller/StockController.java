package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Stock;
import com.one.burger.service.ItemService;
import com.one.burger.service.StockService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/stock")
public class StockController {
	
	@Autowired
	private StockService stockservice;
	@Autowired
	private ItemService itemservice;
	
	@GetMapping("/list")
	public String StockList(Model model) throws Exception {
		log.info("StockList()");
		
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
		log.info("PostStockRegister()");
		
		stockservice.register(stock);
		
		return "stock/list";
	}
	
	@GetMapping("/stock_plus")
	public void stockPlus(Model model) throws Exception{
		log.info("stockPlus()");
		
		model.addAttribute("list", itemservice.list());
	}
	
	@PostMapping("/stock_plus")
	public String PostStockPlus(Integer item_no) throws Exception{
		log.info("PostStockPlus() + item_no : " + item_no);
		
		stockservice.plus(item_no);
		
		return "redirect:stock_plus";
	}
	
}
