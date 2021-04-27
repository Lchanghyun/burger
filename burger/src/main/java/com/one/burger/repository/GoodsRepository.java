package com.one.burger.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.Goods;
import com.one.burger.entity.GoodsBranchMenuVo;

@Repository
public class GoodsRepository {
	@Autowired
	private SqlSession sqlSession;

	public void goodsInsert(Goods goods) throws Exception {
		sqlSession.insert("goods.goodsInsert", goods);
	}

	public List<GoodsBranchMenuVo> goodsList(int order_no) throws Exception {
		return sqlSession.selectList("goods.goodsList", order_no);
	}

	public Integer branchNo(int order_no) throws Exception{
		return sqlSession.selectOne("goods.branch_no", order_no);
	}
	
}
