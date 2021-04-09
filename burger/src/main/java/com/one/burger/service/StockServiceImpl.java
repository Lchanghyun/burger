package com.one.burger.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;
import com.one.burger.repository.ItemRepository;
import com.one.burger.repository.StockRepository;

import lombok.extern.java.Log;

@Log
@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockRepository stockRepository;
	@Autowired
	private ItemRepository itemRepository;

	@Override
	public List<StockItemVo> all_list(int branch_no) throws Exception {
		List<Integer> item_list = new ArrayList<>();

		item_list = itemRepository.item_no(branch_no);
		
		List<StockItemVo> list = new ArrayList<>();
		Map<String, Object> param = new HashMap<>();
		param.put("branch_no", branch_no);
		
		for(Integer item : item_list) {
			
			param.put("item_no", item);
			
			if(item_check(param)) {
				list.add(stockRepository.all_list(param));
			}
			param.remove("item_no");
		}		
		return list;
	}
	
	@Override
	public List<StockItemVo> category_list(String category, int branch_no) throws Exception {
		
		List<Integer> item_list = new ArrayList<>();

		List<StockItemVo> list = new ArrayList<>();
		Map<String, Object> param = new HashMap<>();
		param.put("branch_no", branch_no);
		param.put("category", category);
		
		item_list = itemRepository.item_no(branch_no);
		
		for(Integer item : item_list) {
			
			param.put("item_no", item);
			
			if(item_check(param)) {
				list.add(stockRepository.category_list(param));
			}
			param.remove("item_no");
		}		
		return list;
	}
	
	@Override
	public int getSeq() throws Exception {
		return stockRepository.getSeq();
	}
	
	@Override
	public boolean register(List<Map<String, Object>> stock_list, int branch_no) throws Exception {
		
		if(!date_check(branch_no)) {
			for (Map<String, Object> item : stock_list) {
				
				Integer stock_no=getSeq();
				Map<String, Object> param = new HashMap<String, Object>();
				param.put("item_no", item.get("item_no"));
				param.put("stock_no", stock_no);
				param.put("stock_count", item.get("stock_count"));
				param.put("branch_no", 1);
				 
				stockRepository.register(param);
				
			}
			return true;
		}
		return false;
	}

	@Override
	public void plus(Integer item_no, int branch_no) throws Exception {
		Integer stock_no=getSeq();
		
		Map<String, Object> param = new HashMap<>();
		param.put("stock_no", stock_no);
		param.put("item_no", item_no);
		param.put("branch_no", branch_no);
			
		stockRepository.plus(param);
	}

	@Override
	public boolean item_check(Map<String, Object> param) throws Exception {
		List<Stock> list = stockRepository.item_check(param);
		boolean result = (list==null) ? false : true;
		log.info("result : " + result);
		return result;
	}

	@Override
	public boolean date_check(int branch_no) throws Exception {
		List<Stock> list = stockRepository.date_check(branch_no);
		boolean result = (list==null) ? false : true;
		return result;
	}

	@Override
	public List<String> chart_date() throws Exception {
		List<String> list= new ArrayList<>();
		
		for(int day=1; day<8; day++) {
			list.add(stockRepository.chart_date(day));
		}
		
		return list;
	}

	@Override
	public List<Stock> chart_stock(int branch_no) throws Exception {
		List<Stock> list = new ArrayList<>();
		Map<String, Object> param =new HashMap<>();

		param.put("branch_no", branch_no);
		
		List<Integer> item_list = itemRepository.item_no(branch_no);
		
		for(Integer item : item_list) {
			param.put("item_no", item);
			for(int day=1; day<8; day++) {
				
				param.put("day",day);
				list.add(stockRepository.chart_stock(param));
				param.remove("day");
			}
		}
		return list;
	}

}
