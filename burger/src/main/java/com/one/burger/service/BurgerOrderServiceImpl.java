package com.one.burger.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.BurgerOrder;

@Service
public class BurgerOrderServiceImpl implements BurgerOrderService {
	
	@Autowired
	private BurgerOrderRepository repository;

	@Override
	public void orderInsert(BurgerOrder burgerOrder) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
