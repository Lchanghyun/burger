package com.one.burger.controller;

import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.Item;
import com.one.burger.entity.StockItemVo;
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
	public String StockList(Model model, String category, HttpSession session) throws Exception {
		log.info("StockList()");
		
		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
		
		if(category == null) category="채소류";
		
		model.addAttribute("list", stockservice.category_list(category, branch_no));
		
		return "stock/list";
	}
	
	@GetMapping("/register")
	public String register(Model model, HttpSession session) throws Exception {
		log.info("StockRegister()");
		
		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
	
		model.addAttribute("list", stockservice.all_list(branch_no));

		return "stock/register";
	}

	@PostMapping("/register")
	@ResponseBody
	public String PostRegister(String stock_list, Model model, HttpSession session) throws Exception {
		log.info("PostStockRegister()");
		
		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(stock_list);
		
		List<Map<String, Object>> list = new ArrayList<>();
		JSONArray jArray = (JSONArray) obj;
		
		if(jArray != null) {
			for (int i=0; i<jArray.size(); i++) {
				list.add((Map<String, Object>) jArray.get(i));
			}
		}
		boolean result = stockservice.register(list, branch_no);
		
		String msg;
		
		if(result)  {
			msg="true";
		}
		else {
			msg="fail";
		}
		return msg;
	}
	
	@GetMapping("/stock_plus")
	public void stockPlus(Model model, String category, HttpSession session) throws Exception{
		log.info("stockPlus()");

		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
		
		if(category == null) category="채소류";
		
		model.addAttribute("list", itemservice.none_category_list(branch_no, category));
	}
	
	@PostMapping("/stock_plus")
	public String PostStockPlus(Integer item_no, HttpSession session) throws Exception{
		log.info("PostStockPlus() + item_no : " + item_no);
		
		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
		
		stockservice.plus(item_no, branch_no);
		
		return "redirect:stock_plus";
	}
	
	@GetMapping("/chart")
	public void stockChart(Model model, HttpSession session, String category) throws Exception{
		log.info("stockChart()");
		
		int branch_no = 1;
		//int branch_no = (int) session.getAttribute("branch_no");
		
		if(category == null) category="채소류";
		
		model.addAttribute("bar_list", stockservice.all_list(branch_no));
		
		model.addAttribute("chart_date", stockservice.chart_date());
		
		model.addAttribute("week_list", stockservice.week_stock(branch_no, category));
		
		model.addAttribute("item_list", itemservice.in_category_list(branch_no, category));
	}
	
}
