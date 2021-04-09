package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;

public interface PurchaseService {
	public List<Purchase> call() throws Exception;
	public List<PurchaseItemVo> select() throws Exception;
}
