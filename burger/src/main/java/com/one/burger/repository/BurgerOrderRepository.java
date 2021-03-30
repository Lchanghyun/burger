package com.one.burger.repository;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BurgerOrderRepository {
	
	@Autowired
	private SqlSession sqlSession;
	
	
}
