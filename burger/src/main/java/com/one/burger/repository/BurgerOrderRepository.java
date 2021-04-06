package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.BurgerOrder;
import com.one.burger.entity.MenuBranchMenuVo;

@Repository
public class BurgerOrderRepository {
	
	@Autowired
	private SqlSession sqlSession;	
	
	public List<MenuBranchMenuVo> orderList(String category) throws Exception{
		return sqlSession.selectList("burgerOrder.orderList", category);
	}
	
	public void orderInsert(BurgerOrder burgerOrder) throws Exception{
		sqlSession.insert("burgerOrder.orderInsert", burgerOrder);
	}

	

	
	
}
