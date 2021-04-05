package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.Today;
import com.one.burger.service.BurgerOrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/burger")
public class BurgerOrderController {
	
	@Autowired
	private BurgerOrderService service;
	
	@GetMapping("/order")
	public String orderInsert(String category, Model model) throws Exception{
		log.info("GETorderList()");
		model.addAttribute("orderList", service.orderList(category));		
		return "burger/order";
	}
	
	@PostMapping("/order")
	public String orderInsert(BurgerOrder burgerOrder, Today today, Goods goods) throws Exception {
		log.info("POSTorderInsert()");
		service.orderInsert(burgerOrder);
		service.todayInsert(today);
		
		return "burger/success";
	}
	
	
}
