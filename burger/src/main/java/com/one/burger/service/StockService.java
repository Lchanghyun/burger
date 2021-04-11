package com.one.burger.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;

public interface StockService {
	public List<StockItemVo> all_list(int branch_no) throws Exception;
	public List<StockItemVo> category_list(String category, int branch_no) throws Exception;
	public int getSeq() throws Exception;
	public boolean register(List<Map<String, Object>> stock_list, int branch_no) throws Exception;
	public void plus(Integer item_no, int branch_no) throws Exception;
	public boolean item_check(Map<String, Object> param) throws Exception;
	public boolean date_check(int branch_no) throws Exception;
	public List<String> chart_date() throws Exception;
	public List<Stock> chart_stock(int branch_no) throws Exception;
	public List<List<StockItemVo>> week_stock(int branch_no, String category) throws Exception;
}
