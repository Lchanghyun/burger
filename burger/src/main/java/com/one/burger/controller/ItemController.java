package com.one.burger.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Item;
import com.one.burger.service.ItemService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/item")
public class ItemController {
	
	@Autowired
	private ItemService itemservice;
	
	@GetMapping("/list")
	public void ItemList(Model model) throws Exception {
		
		log.info("itemList()");
		
		model.addAttribute("list",itemservice.all_list());
	}
	
	@GetMapping("/edit")
	public void ItemEdit(Model model) throws Exception {
		
		log.info("ItemEdit()");
		
		model.addAttribute("list", itemservice.all_list());
	}
	
	@PostMapping("/edit")
	public String PostItemEdit(String item_list) throws Exception{
		
		log.info("PostItemEdit()");
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(item_list);
		
		List<Map<String, Object>> list = new ArrayList<>();
		JSONArray jArray = (JSONArray) obj;
		
		if(jArray != null) {
			for (int i=0; i<jArray.size(); i++) {
				log.info("jArray(i) : " + jArray.get(i));
				list.add((Map<String, Object>) jArray.get(i));
			}
		}
		log.info("list :" + list);
		itemservice.edit(list);
		
		return "item/list";
	}
	
	@GetMapping("/register")
	public void ItemRegister() throws Exception {
		
		log.info("ItemRegister()");
	}
	
	@PostMapping("/register")
	public String PostItemRegister(Item item) throws Exception{
		log.info("PostItemRegister()");
		
		itemservice.insert(item);
		
		return "item/list";
	}
	
	
}
