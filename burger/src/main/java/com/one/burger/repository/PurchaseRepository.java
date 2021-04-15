package com.one.burger.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;
import com.one.burger.entity.PurchaseSuperVo;
import com.one.burger.entity.ReceivedItemVo;

@Repository
public class PurchaseRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Purchase> list()  {
		
		return sqlSession.selectList("purchase.Plist");
	}

	public List<PurchaseItemVo> select(int purchase_no) {
		
		return sqlSession.selectList("purchase_item.PIlist",purchase_no);
	}

	public List<ReceivedItemVo> received(int purchase_no) {
		
		return sqlSession.selectList("received_item.Received",purchase_no);
	}

	public void edit(Map<String, Object> param) {
		
		sqlSession.update("purchase_item.update",param);
	}

	public List<PurchaseSuperVo> show() {
		
		return sqlSession.selectList("purchase.SPlist");
	}

	public void update(PurchaseSuperVo purchaseSuperVo) {
		
		sqlSession.update("purchase.SUpdate",purchaseSuperVo);
	}

	public int getSeq() {

		return sqlSession.selectOne("purchase.getSeq");
	}
	
	public void insert(Map param) {
		
		sqlSession.insert("purchase.PRegister",param);
	}

	public void register(Map<String, Object> param) {

		sqlSession.insert("purchase_item.regist",param);
		
	}

	
	
	
}
