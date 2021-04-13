package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Item;
import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.ReceivedItemVo;
import com.one.burger.repository.ItemRepository;
import com.one.burger.repository.PurchaseRepository;

@Service
public class PurchaseServiceImpl implements PurchaseService {

	@Autowired
	private PurchaseRepository purchaseRepository;


	@Override
	public List<Purchase> call() throws Exception {
		return purchaseRepository.list();
	}

	@Override
	public List<PurchaseItemVo> select(int purchase_no) {
		
		return purchaseRepository.select(purchase_no);
	}

	@Override
	public List<ReceivedItemVo> received(int purchase_no) throws Exception {
		
		return purchaseRepository.received(purchase_no);
	}







}
