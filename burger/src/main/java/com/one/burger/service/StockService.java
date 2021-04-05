package com.one.burger.service;

import java.util.List;
import java.util.Map;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;

public interface StockService {
	public List<StockItemVo> select() throws Exception;
	public int getSeq() throws Exception;
	public void register(Stock stock) throws Exception;
	public void plus(Integer item_no) throws Exception;
}
