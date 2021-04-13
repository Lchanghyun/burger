package com.one.burger.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Item;
import com.one.burger.repository.ItemRepository;

import lombok.extern.java.Log;

@Log
@Service
public class ItemServiceImpl implements ItemService{

	@Autowired
	private ItemRepository itemRepository;

	@Autowired
	private StockService stockservice;
	
	@Override
	public int getSeq() throws Exception {
		return itemRepository.getSeq();
	}
	
	@Override
	public void insert(Item item) throws Exception {
		
		int item_no=itemRepository.getSeq();
		item.setItem_no(item_no);
		log.info("item_no : " + item.getItem_no() );
		log.info("item_name : " +item.getItem_name());
		log.info("item_price : " +item.getItem_price());
		log.info("category : " +item.getCategory());
		itemRepository.insert(item);
	}

	@Override
	public List<Item> all_list() throws Exception {

		return itemRepository.all_list();
	}
	
	@Override
	public List<Item> category_list(String category) throws Exception {
		//지점상관없이 모든 카테고리별 원자재 리스트
		List<Item> list = itemRepository.category_list(category);

		return list;
	}
	
	@Override
	public List<Item> none_category_list(int branch_no, String category) throws Exception {
		//지점에 등록되지 않은 원자재만 나오도록 구현
		Map<String, Object> param = new HashMap<>();
		List<Item> list = itemRepository.category_list(category);
		List<Item> result = new ArrayList<>();
		param.put("branch_no", branch_no);

		for(Item item : list) {
			param.put("item_no", item.getItem_no());
			if(!stockservice.item_check(param)) {
				result.add(item);
			}
			param.remove("item_no");
		}
		return result;
	}
	
	@Override
	public List<Item> in_category_list(int branch_no, String category) throws Exception {
		//지점에 등록된 원자재만 나오도록 구현
		Map<String, Object> param = new HashMap<>();
		List<Item> list = itemRepository.category_list(category);
		List<Item> result = new ArrayList<>();
		param.put("branch_no", branch_no);

		for(Item item : list) {
			param.put("item_no", item.getItem_no());
			if(stockservice.item_check(param)) {
				result.add(item);
			}
			param.remove("item_no");
		}
		return result;
	}
	
	@Override
	public List<Integer> item_no(int branch_no) throws Exception {
	
		return itemRepository.item_no(branch_no);
	}
	
	@Override
	public List<Integer> category_item_no(int branch_no, String category) throws Exception {
		
		Map<String, Object> param = new HashMap<>();
		
		param.put("branch_no", branch_no);
		param.put("category", category);
		
		return itemRepository.category_item_no(param);
	}
	
	@Override
	public void edit(List<Map<String, Object>> item_list) throws Exception {
				
		for(Map<String, Object> item : item_list) {
		
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("item_no" , item.get("item_no"));
			param.put("item_price", item.get("item_price"));
			param.put("item_name", item.get("item_name"));
			param.put("category", item.get("category"));
			
			itemRepository.edit(param);  
		}
	}

	@Override
	public boolean item_check(String item_name) throws Exception {
		boolean result = (itemRepository.item_check(item_name)==null) ? false : true;
		return result;
	}

}
