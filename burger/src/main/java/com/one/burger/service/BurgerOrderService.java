package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.MenuBranchMenuVo;
import com.one.burger.entity.Today;

public interface BurgerOrderService {
	//주문하기 클릭시 나오는 메뉴
	public List<MenuBranchMenuVo> orderList(String category) throws Exception;
	
	//주문하기
	public void orderInsert(BurgerOrder burgerOrder) throws Exception;
	public void todayInsert(Today today) throws Exception;
	public void goodsInsert(Goods goods) throws Exception;


}
