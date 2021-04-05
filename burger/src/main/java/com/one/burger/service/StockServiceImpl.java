package com.one.burger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;
import com.one.burger.repository.StockRepository;

import lombok.extern.java.Log;

@Log
@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockRepository stockRepository;

	@Override
	public List<StockItemVo> select() throws Exception {
		return stockRepository.select();
	}
	
	@Override
	public int getSeq() throws Exception {
		return stockRepository.getSeq();
	}
	
	@Override
	public void register(Stock stock) throws Exception {
		Integer stock_no=stockRepository.getSeq();
		stock.setStock_no(stock_no);
		
		//int branch_no = (int) session.getAttribute("branch_no"); 
		stock.setBranch_no(1);
		stockRepository.register(stock);
	}

	@Override
	public void plus(Integer item_no) throws Exception {
		Integer stock_no=stockRepository.getSeq();
		log.info("stock_no : "+stock_no);
		log.info("item_no : "+item_no);
		
		Map<String, Object> param = new HashMap<>();
		param.put("stock_no", stock_no);
		param.put("item_no", item_no);
		param.put("branch_no", 1);
		//int branch_no = (int) session.getAttribute("branch_no"); 
		
		log.info("stock_no : " +param.get("stock_no"));
		log.info("item_no : " +param.get("item_no"));
		log.info("branch_no : " +param.get("branch_no"));
		
		stockRepository.plus(param);
	}
	
	

}
