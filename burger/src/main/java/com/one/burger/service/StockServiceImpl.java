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
	public void register(List<Map<String, Object>> stock_list) throws Exception {
		for (Map<String, Object> item : stock_list) {
			log.info("item.item_no" + item.get("item_no"));
			log.info("item.stock_count" + item.get("stock_count"));
			Integer stock_no=stockRepository.getSeq();
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("item_no", item.get("item_no"));
			param.put("stock_no", stock_no);
			param.put("stock_count", item.get("stock_count"));
			param.put("branch_no", 1);
			
			//int branch_no = (int) session.getAttribute("branch_no"); 
			
			stockRepository.register(param);
		}
	}

	@Override
	public void plus(Integer item_no) throws Exception {
		Integer stock_no=stockRepository.getSeq();
		
		Map<String, Object> param = new HashMap<>();
		param.put("stock_no", stock_no);
		param.put("item_no", item_no);
		param.put("branch_no", 1);
		
		//int branch_no = (int) session.getAttribute("branch_no"); 
		
		stockRepository.plus(param);
	}
	
	

}
