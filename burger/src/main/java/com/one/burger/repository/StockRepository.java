package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;

@Repository
public class StockRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<StockItemVo> select() throws Exception{
		return sqlSession.selectList("stock.list");
	}
	
	public int getSeq() throws Exception{
		return sqlSession.selectOne("stock.getSeq");
	}
	
	public void insert(Stock stock) throws Exception{
		sqlSession.insert("stock.register", stock);
	}
	
	
}
