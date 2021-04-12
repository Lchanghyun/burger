package com.one.burger.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Item;
import com.one.burger.entity.Purchase;
import com.one.burger.entity.PurchaseItemVo;

@Repository
public class PurchaseRepository {

	@Autowired
	private SqlSession sqlSession;
	
	public List<Purchase> list() throws Exception {
		return sqlSession.selectList("purchase.Plist");
	}

	public List<PurchaseItemVo> select(int purchase_no) {
		return sqlSession.selectList("purchase_item.PIlist",purchase_no);
	}
	
	
}
