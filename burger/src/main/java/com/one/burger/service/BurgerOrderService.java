package com.one.burger.service;

import java.util.List;
import java.util.Map;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.GoodsBranchMenuVo;
import com.one.burger.entity.MenuBranchMenuVo;
import com.one.burger.entity.Today;

public interface BurgerOrderService {
	//주문하기 클릭시 나오는 메뉴
	public List<MenuBranchMenuVo> orderList(Integer branch_no) throws Exception;
	
	//시퀀스
	public Integer getSeq() throws Exception;
	
	
	//주문하기
	public void orderInsert(BurgerOrder burgerOrder) throws Exception;
	public void goodsInsert(Goods goods) throws Exception;
	
	
	//결제하기 리스트
	public List<GoodsBranchMenuVo> goodsList(int order_no) throws Exception;
	
	//결제하기
	public void todayInsert(Today today) throws Exception;


}
