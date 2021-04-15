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

@Service
public class BurgerOrderServiceImpl implements BurgerOrderService {
	
	@Autowired
	private BurgerOrderRepository bugerOrderRepository;
	
	@Autowired
	private GoodsRepository goodsRepository;
	
	@Override
	public List<MenuBranchMenuVo> orderList(Integer branch_no) throws Exception {
		return bugerOrderRepository.orderList(branch_no);
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
	public void todayInsert(Today today) throws Exception {
		// TODO Auto-generated method stub
		
	}
	

}
