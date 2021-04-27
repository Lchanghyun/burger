package com.one.burger.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.one.burger.entity.BranchTotalSales;
import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.PurchaseSuperVo;
import com.one.burger.entity.Purchase_Item;
import com.one.burger.entity.StockItemVo;
import com.one.burger.service.ItemService;
import com.one.burger.service.PurchaseService;
import com.one.burger.service.StockService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/purchase")
public class PurchaseController {

	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private StockService stockservice;
	
	
	@GetMapping("/list")
	public String branchPurchase(Model model) throws Exception{
		log.info("PurchaseList()");
		
		model.addAttribute("Plist",purchaseService.call());
		
		return "purchase/list";
	}
	

	@GetMapping("/purchase_list")
	public void purchaseDetail(HttpServletRequest req, Model model) throws Exception{
		log.info("purchaseDetail()");
		
		int purchase_no = Integer.parseInt(req.getParameter("purchase_no"));
		model.addAttribute("PurchaseItem", purchaseService.select(purchase_no));
		
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
	@ResponseBody
	public String postUpdate(String purchase_item) throws Exception{
		log.info("postUpdate()");
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(purchase_item);
		
		List<Map<String, Object>> list = new ArrayList<>();
		JSONArray jArray = (JSONArray) obj;
		
		if(jArray != null) {
			for (int i=0; i<jArray.size(); i++) {
				log.info("jArray(i) : " + jArray.get(i));
				list.add((Map<String, Object>) jArray.get(i));
			}
		}
		log.info("list :" + list);
		
		purchaseService.edit(list);
		
		return "purchase/update";
	}
	
	
	@GetMapping("/register")
	public void StockList(Model model, HttpSession session, HttpServletRequest req) throws Exception {
		log.info("stockList()");
		
		int branch_no=1; 
		//int branch_no = (int) session.getAttribute("branch_no");
		
		int purchase_no = Integer.parseInt(req.getParameter("purchase_no"));
		
		model.addAttribute("purchase_no",purchase_no); 
		model.addAttribute("list", purchaseService.StockList(branch_no));
		
	}
	
	@PostMapping("/register")
	@ResponseBody
	public String postRegist(String purchase_item) throws Exception{
		log.info("postUpdate()");
		
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(purchase_item);
		
		List<Map<String, Object>> list = new ArrayList<>();
		JSONArray jArray = (JSONArray) obj;
		
		if(jArray != null) {
			for (int i=0; i<jArray.size(); i++) {
				log.info("jArray(i) : " + jArray.get(i));
				list.add((Map<String, Object>) jArray.get(i));
			}
		}
		log.info("list :" + list);
		
		purchaseService.register(list);
		 
		return "purchase/list"; 
	} 
	
	@PostMapping("/regist")
	public ModelAndView insert(HttpServletRequest req, HttpSession session) throws Exception{
		log.info("insert");
		
		int branch_no=1; 
		//int branch_no = (int) session.getAttribute("branch_no");
		
		Map<String, Object> param = new HashMap();
		param.put("branch_no", branch_no);
		param.put("super_no", req.getParameter("super_no"));
		param.put("status", req.getParameter("status"));
		
		purchaseService.insert(param);
		
		ModelAndView mv = new ModelAndView("redirect:/purchase/list");
		return mv;
	}
	@GetMapping("/delete")
	public String delete(HttpServletRequest req) throws Exception{
		log.info("purchaseDelete()");
		
		int purchase_no = Integer.parseInt(req.getParameter("purchase_no"));
		
		purchaseService.delete(purchase_no);
		  
		return "redirect:list"; 
	}
	
	@GetMapping("/deletePurchase")
	public String deletePurchase(HttpServletRequest req) throws Exception{
		log.info("purchaseDelete()");
		
		int pi_no = Integer.parseInt(req.getParameter("pi_no"));
		
		
		purchaseService.deletePurchase(pi_no);   
		return "redirect: list";
	}
	
	@GetMapping("/superlist")
	public String superPurchase(Model model) throws Exception{
		log.info("superPurchase()");
		
		model.addAttribute("SPlist",purchaseService.show());
		
		return "purchase/superlist";
	}
	
	@GetMapping("/superpurchaselist")
	public void superPurchaseList(int purchase_no, Model model) throws Exception{
		log.info("purchaseDetail()");
		
		model.addAttribute("PIlist", purchaseService.select(purchase_no));
		
	}
	@PostMapping("/superpurchaselist")
	public String statusUpdate(PurchaseSuperVo purchaseSuperVo) throws Exception{
		log.info("statusUpdate()");
		
		purchaseService.update(purchaseSuperVo);
		
	   return "purchase/superlist";
	}
}
