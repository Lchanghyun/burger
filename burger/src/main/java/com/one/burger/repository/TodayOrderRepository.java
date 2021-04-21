package com.one.burger.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.TodayOrder;
import com.one.burger.entity.TodayOrderMenu;

@Repository
public class TodayOrderRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public List<TodayOrder> orderList(Integer branch_no) throws Exception{
		return sqlSession.selectList("today.todayOrder", branch_no);
	}
	public List<TodayOrderMenu> orderMenuList(Integer order_no) throws Exception{
		return sqlSession.selectList("today.menuInfo", order_no);
	}
	public void updateStatus(Integer order_no, Integer branch_no) throws Exception{
		Map<String, Integer> data = new HashMap<>();
		data.put("order_no",order_no);
		data.put("branch_no",branch_no);
		sqlSession.update("today.status",data);
	}
	public String getBranchName(Integer branch_no) throws Exception{
		return sqlSession.selectOne("today.getBranchName", branch_no);
	}
}