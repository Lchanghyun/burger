package com.one.burger.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		log.info("PurchaseList");
		
		model.addAttribute("Plist",purchaseService.call());
		
		return "purchase/list";
	}
	

	@PostMapping("/ajax")
	@ResponseBody
	public String branchPurchaseList(Model model, String purchase_no) throws Exception {
		log.info("branchPurchaseList()");
		
		int num = Integer.parseInt(purchase_no);
		System.out.println("num");
		PurchaseItemVo purchaseItemVo = new PurchaseItemVo();
		purchaseItemVo = (PurchaseItemVo) model.addAttribute("PIlist",purchaseService.select(num));
		
		return "purchaseItemVo";
	}
	
	@GetMapping("/register")
	public void ItemList(Model model) throws Exception {
		log.info("itemList()");
		
		model.addAttribute("list",itemservice.all_list());
	}
	
	@GetMapping("/update")
	public void branchPurchaseList(Model model, int purchase_no) throws Exception{
		log.info("branchPurchaseList()");
	}
	
	@PostMapping("/insert")
	public void insert(Purchase_Item purchase_item) throws Exception{
		
		
	}
}
