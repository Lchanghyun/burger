package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.Item;

public interface ItemService {
	public void insert(Item item) throws Exception;
	public int getSeq() throws Exception;
	public List<Item> list() throws Exception;
}
