package com.one.burger.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.service.ChartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private ChartService service;
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart() {
		log.info("getSupervisorChart()");
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart(Model model, HttpSession session) throws Exception{
		log.info("getBranchChart()");
		int branch_no = 1;
		
		//model.addAttribute("burgerChart", service.bm_burgerChart())
	}
	
}
