package com.one.burger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.Goods;
import com.one.burger.entity.Today;
import com.one.burger.repository.BurgerOrderRepository;

@Service
public class BurgerOrderServiceImpl implements BurgerOrderService {
	
	@Autowired
	private BurgerOrderRepository repository;

	@Override
	public void orderInsert(BurgerOrder burgerOrder) throws Exception {
		repository.orderInsert(burgerOrder);
	}

	@Override
	public void todayInsert(Today today) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void goodsInsert(Goods goods) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
