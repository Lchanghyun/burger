package com.one.burger.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public void ItemList(Model model, String category) throws Exception {
		
		log.info("itemList()");
		
		if(category == null) category="채소류";
		
		model.addAttribute("list",itemservice.category_list(category));
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
	public String PostItemRegister(Item item, RedirectAttributes redirectAttribute) throws Exception{
		log.info("PostItemRegister()");
		
		if(!itemservice.item_check(item.getItem_name())) {
			itemservice.insert(item);
		}
		else {
			redirectAttribute.addFlashAttribute("msg", "이미 등록된 원자재입니다.");
		}

		return "redirect:list";
	}
	
	
}
