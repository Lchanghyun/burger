package com.one.burger.service;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.Today;

public interface BurgerOrderService {
	public void orderInsert(BurgerOrder burgerOrder) throws Exception;
	public void todayInsert(Today today) throws Exception;
	public void goodsInsert(Goods goods) throws Exception;
	
}
