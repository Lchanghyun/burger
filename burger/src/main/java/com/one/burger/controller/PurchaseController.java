package com.one.burger.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.Purchase_Item;
import com.one.burger.service.PurchaseService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	
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
		
		PurchaseItemVo purchaseItemVo = new PurchaseItemVo();
		purchaseItemVo = (PurchaseItemVo) model.addAttribute("PIlist",purchaseService.select(num));
		
		return "purchaseItemVo";
	}
	
	@PostMapping("/insert")
	public void insert(Purchase_Item purchase_item) throws Exception{
		
		
	}
}
