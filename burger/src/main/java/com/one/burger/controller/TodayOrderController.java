package com.one.burger.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.TodayOrder;
import com.one.burger.entity.TodayOrderMenu;
import com.one.burger.service.TodayOrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/today")
public class TodayOrderController {
	@Autowired
	private TodayOrderService todayService;
	
	@GetMapping("/order")
	public void todayOrderList(Model model, HttpSession session) throws Exception{
		log.info("todayOrderList()");
		session.setAttribute("branch_no", 1);
		int branch_no = (int)session.getAttribute("branch_no");
		String branch_name = todayService.getBranchName(branch_no);
		List<TodayOrder> list = todayService.orderList(branch_no);
		Map<Integer, List<TodayOrderMenu>> menulist = new HashMap<>();
		for(TodayOrder menu:list) {
			int order_no = menu.getOrder_no();
			menulist.put(order_no,todayService.orderMenuList(order_no));
		}
		model.addAttribute("list",list);
		model.addAttribute("menulist", menulist);
		model.addAttribute("branch_name", branch_name);
	}
	
	@PostMapping("/updateStatus")
	@ResponseBody
	public String updateStatus(Integer order_no, HttpSession session) throws Exception{
		log.info("updateStatus()");
		int branch_no = (int)session.getAttribute("branch_no");
		todayService.updateStatus(order_no, branch_no);
		return "ok";
	}
	
	
}
