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
	
	public void orderInsert(BurgerOrder burgerOrder) throws Exception{
		sqlSession.insert("burgerOrder.orderInsert", burgerOrder);
	}
	
	public Integer getSeq() throws Exception{
		Integer getSeq;
		getSeq = sqlSession.selectOne("burgerOrder.getSeq"); 
		return getSeq;
	}
	
	public List<MenuBranchMenuVo> orderList(String branch_name) throws Exception{
		return sqlSession.selectList("burgerOrder.orderList", branch_name);
	}

	public String branchAddr(int order_no) throws Exception{
		String branch_address;
		branch_address = sqlSession.selectOne("burgerOrder.branch_addr", order_no);
		return branch_address;
	}

}
