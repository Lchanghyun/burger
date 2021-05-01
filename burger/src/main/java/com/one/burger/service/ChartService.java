package com.one.burger.service;

import java.util.List;
import java.util.Map;

import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.entity.BranchMenuChart;
import com.one.burger.entity.BranchTotalSales;
import com.one.burger.entity.Menu;

public interface ChartService {


	public List<BranchTotalSales> total_sales(Map<String, Object> param) throws Exception;
	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception;
	public List<MenuBranchMenuGoodsVo> menu_sales(String sales_date) throws Exception;
	public List<BranchMenuChart> branchMenuChart(int branch_no, String sysdate) throws Exception;
	public List<BranchMenuChart> Bm_nameList (int branch_no) throws Exception;
}
