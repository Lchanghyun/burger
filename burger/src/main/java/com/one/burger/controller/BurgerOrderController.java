package com.one.burger.controller;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.service.BurgerOrderService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/burger")
public class BurgerOrderController {
	
	@Autowired
//	private BurgerOrder burgerOrder;
	private BurgerOrderService service;
	
	@GetMapping("/order")
	public String orderInsert(int branch_no, Model model) throws Exception{
		log.info("GETorderInsert()");
		log.info("branch_no: "+branch_no);
		model.addAttribute("orderList", service.orderList(branch_no));
		return "burger/order";
	}
	
	@PostMapping("/order")
	@ResponseBody
	public String orderInsert(
			@RequestParam(value="order_bm_no[]") List<Integer> order_bm_no,			
			@RequestParam(value="order_count[]") List<Integer> order_count,
			@RequestParam int branch_no, 
			BurgerOrder burgerOrder, Goods goods, HttpSession session) throws Exception {
		
		log.info("POSTorderInsert()");
		log.info("branch_no = "+ branch_no);
		int member_no = 1;
//		int menber_no = (int)session.getAttribute("member_no");
		int order_no = service.getSeq();
		//주문 등록
		burgerOrder.setOrder_no(order_no);
		burgerOrder.setBranch_no(branch_no);
		burgerOrder.setMember_no(member_no);
		service.orderInsert(burgerOrder);
		
		//주문 상품 등록		
		if(order_bm_no != null) {
			for (int i=0; i<order_bm_no.size(); i++) {
				goods.setOrder_no(order_no);
				goods.setMember_no(member_no);
				goods.setBranch_no(branch_no);
				goods.setBm_no(order_bm_no.get(i));
				goods.setCount(order_count.get(i));
				System.out.println(goods.getOrder_no()+" / "+goods.getBranch_no()+" / "+goods.getMember_no()+" / "+
						goods.getBm_no()+" / "+goods.getCount());
				service.goodsInsert(goods);
			}
		}
		boolean result = true;		
		if(result)  {
			return ""+order_no;		
		}
		else {
			return "false";
		}
	}
	@GetMapping("/payment")
	public String paymentList(int order_no, Model model) throws Exception{
		log.info("GETpaymentList()");
		log.info("order_no: "+order_no);
		model.addAttribute("goodsList", service.goodsList(order_no));
		return "burger/payment";
	}
	
	
}
