package com.one.burger.service;

import java.io.Console;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.PurchaseStockVo;
import com.one.burger.entity.PurchaseSuperVo;
import com.one.burger.entity.ReceivedItemVo;
import com.one.burger.entity.StockItemVo;
import com.one.burger.repository.PurchaseRepository;

import lombok.extern.java.Log;

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

	@Override
	public void edit(List<Map<String, Object>> purchase_item) throws Exception {
		 
		for(Map<String, Object> purchase : purchase_item) {
			
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("item_no" ,Integer.parseInt(String.valueOf(purchase.get("item_no"))));
			param.put("count", Integer.parseInt(String.valueOf(purchase.get("count"))));
			param.put("purchase_no", Integer.parseInt(String.valueOf(purchase.get("purchase_no"))));
			
			purchaseRepository.edit(param);
		}
	}

	@Override
	public List<PurchaseSuperVo> show() throws Exception {
		
		return purchaseRepository.show();
	}


	@Override
	public void update(PurchaseSuperVo purchaseSuperVo) throws Exception {
		
		purchaseRepository.update(purchaseSuperVo);
	}

	@Override
	public int getSeq() throws Exception {
		return purchaseRepository.getSeq();
	}
	
	@Override
	public void insert(Map<String, Object> param) throws Exception {
		
		int purchase_no=purchaseRepository.getSeq();
		param.put("purchase_no", purchase_no);
		purchaseRepository.insert(param);
		
	}

	@Override
	public void register(List<Map<String, Object>> list) throws Exception {
			
			int pi_no = purchaseRepository.getSeq();
			int super_no =1;
			int branch_no =1;
			
			Map<String,Object> paramMap = new HashMap<String, Object>(); 
			
			List<Map<String,Object>> good = new ArrayList<Map<String,Object>>();
			for(Map<String, Object> purchase : list) {
			 
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("pi_no", pi_no);
			param.put("purchase_no", Integer.parseInt(String.valueOf(purchase.get("purchase_no"))));
			param.put("branch_no", branch_no);
			param.put("super_no", super_no);
			param.put("stock_no" ,Integer.parseInt(String.valueOf(purchase.get("stock_no"))));
			param.put("count", Integer.parseInt(String.valueOf(purchase.get("count"))));
			
			good.add(param);
		}   
			paramMap.put("good", good);
			for (String mapkey : paramMap.keySet()){
		        System.out.println("key:"+mapkey+",value:"+paramMap.get(mapkey));
		    }

			purchaseRepository.register(paramMap); 
	}
 
	@Override 
	public List<PurchaseStockVo> StockList(int branch_no) throws Exception {
		
		return purchaseRepository.stock(branch_no);
	}

	@Override 
	public int delete(int purchase_no) throws Exception {
		 
		return purchaseRepository.purchaseDelete(purchase_no);
		
	}

	@Override
	public int deletePurchase(int pi_no) throws Exception {

		return purchaseRepository.deletePurchase(pi_no); 
	}

	@Override
	public int selectP(Map<String, Object> param) throws Exception {
		System.out.println("??????");
		return purchaseRepository.receivedP(param);
	}

}
