package com.one.burger.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Item;

@Repository
public class ItemRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void insert(Item item) {
		sqlSession.insert("item.insert",item);
	}
	
	public int getSeq() {
		return sqlSession.selectOne("item.getSeq");
	}
	
	public List<Integer> item_no(int branch_no){
		
		return sqlSession.selectList("item.item_no", branch_no);
	}
	
	public List<Integer> category_item_no(Map<String, Object> param){
		return sqlSession.selectList("item.category_item_no", param);
	}
	
	public List<Integer> category_item(Map<String, Object> param){
		
		return sqlSession.selectList("item.category_item", param);
	}
	
	public List<Item> all_list(){
		return sqlSession.selectList("item.all_list");
	}
	
	public List<Item> category_list(String category){
		return sqlSession.selectList("item.category_list", category);
	}
	
	public void edit(Map<String, Object> param) {
		sqlSession.update("item.edit" , param);
	}
	
	public Item item_check(String item_name) {
		return sqlSession.selectOne("item.item_check",item_name);
	}
	public void delete_category(int item_no) {
		sqlSession.delete("item.delete_category", item_no);
	}
}
