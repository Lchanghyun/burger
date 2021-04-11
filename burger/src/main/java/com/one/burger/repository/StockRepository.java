package com.one.burger.repository;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Item;
import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;

@Repository
public class StockRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public StockItemVo category_list(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("stock.category_list", param);
	}
	
	public StockItemVo all_list(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("stock.all_list", param);
	}
	
	public int getSeq() throws Exception{
		return sqlSession.selectOne("stock.getSeq");
	}
	
	public void register(Map<String, Object> param) throws Exception{
		sqlSession.insert("stock.register", param);
	}
	
	public void plus(Map<String, Object> param) throws Exception {
		sqlSession.insert("stock.plus", param);
	}
	
	public List<Stock> item_check(Map<String, Object> param) throws Exception{
		return sqlSession.selectList("stock.item_check", param);
	}
	
	public List<Stock> date_check(int branch_no) throws Exception{
		return sqlSession.selectList("stock.date_check", branch_no);
	}
	
	public String chart_date(int day) throws Exception{
		return sqlSession.selectOne("stock.chart_date", day);
	}
	
	public Stock chart_stock(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("stock.chart_stock",param);
	}
	
	public StockItemVo week_stock(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("stock.week_stock",param);
	}
	
}
