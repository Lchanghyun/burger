package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Purchase;

@Repository
public class PurchaseRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Object> list(Purchase purchase) throws Exception{
		
		return sqlSession.selectList("purchase.list");
	}
}
