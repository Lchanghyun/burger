package com.one.burger.service;

import java.util.List;
import java.util.Map;

import com.one.burger.entity.Item;

public interface ItemService {
	public void insert(Item item) throws Exception;
	public int getSeq() throws Exception;
	public List<Item> all_list() throws Exception;
	public List<Item> in_category_list(int branch_no, String category) throws Exception;
	public List<Item> none_category_list(int branch_no, String category) throws Exception;
	public List<Item> category_list(String category) throws Exception;
	public List<Integer> item_no(int branch_no) throws Exception;
	public void edit(List<Map<String, Object>> item_list) throws Exception;
}
	