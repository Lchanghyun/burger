package com.one.burger.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.one.burger.entity.MyOrder;
import com.one.burger.entity.MyOrderDetail;
import com.one.burger.service.MyOrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/myorder")
public class MyOrderController {
	@Autowired
	private MyOrderService myorderService;
	
	@GetMapping("/list")
	public void myorderList(Model model, HttpSession session) throws Exception{
		log.info("myorderList()");
		session.setAttribute("member_no", 1);
		int member_no = (int)session.getAttribute("member_no");
		List<MyOrder> list = myorderService.myorderListCount(member_no);
		Map<Integer,Map<String,String>> menulist = new HashMap<>();
		for(MyOrder my : list) {
			int order_no = my.getOrder_no();
			menulist.put(order_no, myorderService.getOneMenu(order_no, member_no));
		}
		model.addAttribute("listcount",list);
		model.addAttribute("menulist",menulist);
	}
	
	@GetMapping("/detail")
	public void myorderMenuDetail(Model model, Integer order_no, HttpSession session) throws Exception{
		log.info("myorderMenuDetail()");
		int member_no = (int)session.getAttribute("member_no");
		int total_price=0;
		List<MyOrder> list = myorderService.myorderListCount(member_no);
		for(MyOrder order : list) {
			if(order.getOrder_no() == order_no) {
				total_price = order.getTotal_price();
			}
		}
		List<MyOrderDetail> detailList = myorderService.myorderDetail(order_no, member_no);
		model.addAttribute("total_price",total_price);
		model.addAttribute("detailList",detailList);
	}
}
