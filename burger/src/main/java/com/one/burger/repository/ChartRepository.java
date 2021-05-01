package com.one.burger.repository;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.one.burger.entity.BranchTotalSales;
import com.one.burger.entity.Menu;
import com.one.burger.entity.Branch;
import com.one.burger.entity.BranchMenu;
import com.one.burger.entity.BranchMenuChart;
import com.one.burger.entity.SalesSuperTotal;

import com.one.burger.entity.MenuBranchMenuGoodsVo;



import lombok.extern.java.Log;

@Log
@Repository
public class ChartRepository {
	
		@Autowired
		private SqlSession sqlSession;
		
	public List<BranchTotalSales> branch_total(Map<String,Object> param) throws Exception {
		return sqlSession.selectList("chart.branch_total_sales",param);
	}

	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception{
		return sqlSession.selectList("chart.eachBranch",choiceDate);
	}
	public List<Branch> getTotalbranch() throws Exception{
		return sqlSession.selectList("chart.branchNos");
	}
	public MenuBranchMenuGoodsVo menu_sales(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("chart.menu_total_sales",param);
	}
	public List<Integer> Bm_noList(int branch_no) throws Exception{
		return sqlSession.selectList("chart.bmNoList", branch_no);
	}
	public List<BranchMenuChart> Bm_nameList(int branch_no) throws Exception{
		return sqlSession.selectList("chart.branchName", branch_no);
	}
	public BranchMenuChart branchMenuChart(Map<String, Object> param) throws Exception{
		return sqlSession.selectOne("chart.branchMenuChart", param);
	}

}
