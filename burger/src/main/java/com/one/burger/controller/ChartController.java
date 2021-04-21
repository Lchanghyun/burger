package com.one.burger.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart() {
		log.info("getSupervisorChart()");
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart() {
		log.info("getBranchChart()");
	}
}
