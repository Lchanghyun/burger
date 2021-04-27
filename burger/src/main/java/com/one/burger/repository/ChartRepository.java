package com.one.burger.repository;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.one.burger.entity.Branch;
import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.entity.MenuBranchMenuGoodsVo;

@Repository
public class ChartRepository {
	@Autowired
	private SqlSession sqlSession;
	
	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception{
		return sqlSession.selectList("chart.eachBranch",choiceDate);
	}
	public List<Branch> getTotalbranch() throws Exception{
		return sqlSession.selectList("chart.branchNos");
	}
	public MenuBranchMenuGoodsVo menu_sales(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("chart.menu_total_sales",param);
	}
}
