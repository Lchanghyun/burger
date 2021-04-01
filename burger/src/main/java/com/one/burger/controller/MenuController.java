package com.one.burger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/menu")
public class MenuController {
	
	@GetMapping("/register")
	public void menuInsert() {
		log.info("registerForm()");
		
	}
}
