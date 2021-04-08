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
	
	int branch_no;
	@GetMapping("/order")
	public String orderInsert(int branch_no, Model model) throws Exception{
		log.info("GETorderInsert()");
		
		model.addAttribute("orderList", service.orderList(branch_no));
		
		return "/burger/order";
	}
	
	@PostMapping("/order")
	public String orderInsert(BurgerOrder burgerOrder, Today today, Goods goods) throws Exception {
		log.info("POSTorderInsert()");
		// 주문 테이블 -> 주문 상품 -> 당일 주문
		//당일 주문은 주문테이블과 주문상품을 조인하여 토탈값을 입력
		service.orderInsert(burgerOrder);
		service.todayInsert(today);
		
		return "burger/success";
	}
	
	
}
