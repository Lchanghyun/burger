package com.one.burger.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.MyOrder;
import com.one.burger.entity.MyOrderDetail;

@Repository
public class MyOrderRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public List<MyOrder> myorderListCount(Integer member_no) throws Exception{
		return sqlSession.selectList("myorder.listCount", member_no);
	}
	public List<MyOrderDetail> myorderDetail(Integer order_no, Integer member_no) throws Exception{
		Map<String,Integer> data = new HashMap<>();
		data.put("order_no",order_no);
		data.put("member_no",member_no);
		return sqlSession.selectList("myorder.listDetail",data);
	}
	public int whatCategory(Integer order_no, String category, Integer member_no) throws Exception{
		Map<String, Object> data = new HashMap<>();
		data.put("order_no",order_no);
		data.put("category",category);
		data.put("member_no",member_no);
		return sqlSession.selectOne("myorder.whatCategory",data);
	}
}
