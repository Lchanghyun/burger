package com.one.burger.repository;

import java.util.List;

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
	
	public List<Item> list(){
		return sqlSession.selectList("item.list");
	}
}
