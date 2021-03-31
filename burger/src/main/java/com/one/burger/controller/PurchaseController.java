package com.one.burger.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.Purchase_Item;
import com.one.burger.service.PurchaseService;

@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	
	@PostMapping("/insert")
	public void insert(Purchase_Item purchase_item) throws Exception{
		
		
	}
}
