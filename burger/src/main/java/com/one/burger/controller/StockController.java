package com.one.burger.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	public String StockList(Model model) throws Exception {
		log.info("StockList()");
		
		model.addAttribute("list", stockservice.select());
		
		return "stock/list";
	}
	
	@GetMapping("/register")
	public String register(Model model) throws Exception {
		log.info("StockRegister()");
		
		model.addAttribute("list", stockservice.select());

		return "stock/register";
	}

	@PostMapping("/register")
	public String PostRegister(String stock_list) throws Exception {
		log.info("PostStockRegister()");
	
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(stock_list);
		
		List<Map<String, Object>> list = new ArrayList<>();
		JSONArray jArray = (JSONArray) obj;
		
		if(jArray != null) {
			for (int i=0; i<jArray.size(); i++) {
				list.add((Map<String, Object>) jArray.get(i));
			}
		}


		stockservice.register(list);
		
		return "redirect:register";
	}
	
	@GetMapping("/stock_plus")
	public void stockPlus(Model model) throws Exception{
		log.info("stockPlus()");
		
		model.addAttribute("list", itemservice.list());
	}
	
	@PostMapping("/stock_plus")
	public String PostStockPlus(Integer item_no) throws Exception{
		log.info("PostStockPlus() + item_no : " + item_no);
		
		stockservice.plus(item_no);
		
		return "redirect:stock_plus";
	}
	
}
