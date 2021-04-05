package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Item;
import com.one.burger.repository.ItemRepository;

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
	public List<Item> list() throws Exception {

		return itemRepository.list();
	}

}
