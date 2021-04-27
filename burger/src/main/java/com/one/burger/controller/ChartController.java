package com.one.burger.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.BranchTotalSales;
import com.one.burger.service.ChartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart() {
		log.info("getSupervisorChart()");
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart(HttpSession session, Model model) throws Exception {
		log.info("getBranchChart()");
		int branch_no = 1 ;
		//int branch_no = (int) session.getAttribute("branch_no");
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM");
		Date date = new Date();
		String sysdate = format.format(date);
		String year = sysdate.split("/")[0];
		
		List<BranchTotalSales> list = chartService.total_sales(branch_no);
		
		model.addAttribute("Totalsales",list);
	}
}
