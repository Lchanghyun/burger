package com.one.burger.service;

import java.util.List;
import java.util.Map;


import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.PurchaseSuperVo;
import com.one.burger.entity.ReceivedItemVo;

public interface PurchaseService {
	public List<Purchase> call() throws Exception;
	public List<PurchaseItemVo> select(int purchase_no) throws Exception;
	public List<ReceivedItemVo> received(int purchase_no) throws Exception;
	public void edit(List<Map<String, Object>> purchase_item) throws Exception;
	public List <PurchaseSuperVo> show() throws Exception;
	public void update(PurchaseSuperVo purchaseSuperVo) throws Exception;
	public int getSeq() throws Exception;
	public void insert(Map param) throws Exception;
	public void register(List<Map<String, Object>> list) throws Exception;

}
