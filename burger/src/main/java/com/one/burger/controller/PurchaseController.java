package com.one.burger.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.Purchase_Item;
import com.one.burger.service.ItemService;
import com.one.burger.service.PurchaseService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private ItemService itemservice;
	
	@GetMapping("/list")
	public String branchPurchase(Model model) throws Exception{
		log.info("PurchaseList()");
		
		model.addAttribute("Plist",purchaseService.call());
		
		return "purchase/list";
	}
	

	@GetMapping("/purchase_list")
	public void purchaseDetail(int purchase_no, Model model) throws Exception{
		log.info("purchaseDetail()");
		
		model.addAttribute("PIlist", purchaseService.select(purchase_no));
		
	}
	
	@GetMapping("/received")
	public void receivedDetail(int purchase_no, Model model) throws Exception{
		log.info("receivedDetail()");
		
		model.addAttribute("RIlist", purchaseService.received(purchase_no));
		
		
	}
	@GetMapping("/update")
	public void purchaseUpdate(int purchase_no, Model model) throws Exception{
		log.info("purchaseUpdate()");
		
		model.addAttribute("PIlist", purchaseService.select(purchase_no));
	}
	
	
	@PostMapping("/update")
	public String postUpdate(Purchase_Item purchase_item, Model model) throws Exception{
		
		return "purchase/update";
	}
	
	
	@GetMapping("/register")
	public void ItemList(Model model) throws Exception {
		log.info("itemList()");
		
		model.addAttribute("list",itemservice.all_list());
	}
	
	
	
	@PostMapping("/insert")
	public void insert(Purchase_Item purchase_item) throws Exception{
		
		
	}
}
