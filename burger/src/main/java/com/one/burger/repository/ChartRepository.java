package com.one.burger.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.one.burger.entity.BranchTotalSales;

import lombok.extern.java.Log;

@Log
@Repository
public class ChartRepository {
	
		@Autowired
		private SqlSession sqlSession;
		
		public List<BranchTotalSales> branch_total(Map<String,Object> param) throws Exception {
		
		return sqlSession.selectList("chart.branch_total_sales",param);
	}

}
