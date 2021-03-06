package com.one.burger.service;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.GoodsBranchMenuVo;
import com.one.burger.entity.MenuBranchMenuVo;
import com.one.burger.entity.Today;
import com.one.burger.repository.BurgerOrderRepository;
import com.one.burger.repository.GoodsRepository;
import com.one.burger.repository.TodayOrderRepository;

@Service
public class BurgerOrderServiceImpl implements BurgerOrderService {
	
	@Autowired
	private BurgerOrderRepository bugerOrderRepository;
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Autowired
	private TodayOrderRepository todayRepository;
	
	@Override
	public List<MenuBranchMenuVo> orderList(String branch_name) throws Exception {
		return bugerOrderRepository.orderList(branch_name);
	}
	@Override
	public Integer getSeq() throws Exception {
		return bugerOrderRepository.getSeq(); 
	}
	@Override
	public void orderInsert(BurgerOrder burgerOrder) throws Exception {
		bugerOrderRepository.orderInsert(burgerOrder);
	}
	@Override
	public void goodsInsert(Goods goods) throws Exception {
		goodsRepository.goodsInsert(goods);
	}
	@Override
	public List<GoodsBranchMenuVo> goodsList(int order_no) throws Exception {
		return goodsRepository.goodsList(order_no); 
	}
	@Override
	public Integer branchNo(int order_no) throws Exception {
		return goodsRepository.branchNo(order_no);	
	}
	
	@Override
	public void TodayInsert(Today today) throws Exception {
		todayRepository.todayInsert(today);
	}
	@Override
	public Integer sysdateToday() throws Exception {
		return todayRepository.sysdateToday();
	}
	@Override
	public String branchAddr(int order_no) throws Exception {
		return bugerOrderRepository.branchAddr(order_no);
	}
	@Override
	public boolean orderNoCheck(int order_no) throws Exception {
		boolean orderNoCheck = true;
		if(todayRepository.orderNoCheck(order_no) != null) {
			orderNoCheck = false;
		}
		return orderNoCheck;
	}

}
