package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.one.burger.service.BranchService;

import lombok.extern.java.Log;

@Log
@Controller
public class HomeController {
	
	@Autowired
	private BranchService branchService;
	
	//메인 페이지
	@GetMapping("/")
	public String index(Model model) throws Exception {
		log.info("getIndex()");
		model.addAttribute("list", branchService.list());
		return "index";
	}
	
	
}


