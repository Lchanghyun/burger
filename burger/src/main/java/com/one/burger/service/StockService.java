package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;

public interface StockService {
	public List<StockItemVo> select() throws Exception;
	public int getSeq() throws Exception;
	public void insert(Stock stock) throws Exception;

}
