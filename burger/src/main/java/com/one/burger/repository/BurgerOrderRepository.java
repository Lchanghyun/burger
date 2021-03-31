package com.one.burger.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.BurgerOrder;

@Repository
public class BurgerOrderRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	public void orderInsert(BurgerOrder burgerOrder) throws Exception{
		sqlSession.insert("burgerOrder.orderInsert", burgerOrder);
	}
	
	

	
	
}
