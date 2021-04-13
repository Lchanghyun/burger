package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Item;
import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.ReceivedItemVo;

public interface PurchaseService {
	public List<Purchase> call() throws Exception;
	public List<PurchaseItemVo> select(int purchase_no) throws Exception;
	public List<ReceivedItemVo> received(int purchase_no) throws Exception;

}
