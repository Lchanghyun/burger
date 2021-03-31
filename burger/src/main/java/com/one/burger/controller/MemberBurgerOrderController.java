package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.service.BurgerOrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/")
public class MemberBurgerOrderController {
	
	@Autowired
	private BurgerOrderService service;
	
	@GetMapping("/")
	public void orderMenuList()throws Exception{
		log.info("orderMenuList()");
		
		
	}
	
}
