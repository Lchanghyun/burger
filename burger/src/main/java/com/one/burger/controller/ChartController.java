package com.one.burger.controller;

import javax.servlet.http.HttpSession;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.service.ChartService;
import com.one.burger.service.MenuService;

import com.one.burger.service.ChartService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/chart")
public class ChartController {
	
	@Autowired
	private ChartService service;
	private MenuService menuService;
	@Autowired
	private ChartService chartService;
	
	@GetMapping("/supervisorChart")
	public void getSupervisorChart(Model model) throws Exception {
		log.info("getSupervisorChart()");
		
		SimpleDateFormat format = new SimpleDateFormat("YYYY/MM");
		Date date = new Date();
		String sysdate = format.format(date);
		String year = sysdate.split("/")[0];
		
		model.addAttribute("sysdate", sysdate);
		model.addAttribute("year", year);
		model.addAttribute("menu_list", menuService.all_list());
		model.addAttribute("menu_sales", chartService.menu_sales(sysdate));
	}
	
	@PostMapping("/menuSales")
	@ResponseBody
	public List<MenuBranchMenuGoodsVo> PostMenuSales(String year, String month) throws Exception{
		String date =year+month;
		
		return chartService.menu_sales(date);
	}
	
	@GetMapping("/branchChart")
	public void getBranchChart(Model model, HttpSession session) throws Exception{
		log.info("getBranchChart()");
		int branch_no = 1;
		
		//model.addAttribute("burgerChart", service.bm_burgerChart())
	}
	
}
