package com.one.burger.service;

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
	
	@Override
	public int getSeq() throws Exception {
		return itemRepository.getSeq();
	}
	
	@Override
	public void insert(Item item) throws Exception {
		
		int item_no=itemRepository.getSeq();
		item.setItem_no(item_no);
		itemRepository.insert(item);
	}

	@Override
	public List<Item> all_list() throws Exception {

		return itemRepository.all_list();
	}
	
	@Override
	public List<Item> category_list(String category) throws Exception {

		return itemRepository.category_list(category);
	}

	@Override
	public List<Integer> item_no(int branch_no) throws Exception {
	
		return itemRepository.item_no(branch_no);
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

}
