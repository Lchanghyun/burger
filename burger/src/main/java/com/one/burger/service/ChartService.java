package com.one.burger.service;

import java.util.List;
import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.entity.BranchTotalSales;

public interface ChartService {


	public List<BranchTotalSales> total_sales(int branch_no) throws Exception;
	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception;
	public List<MenuBranchMenuGoodsVo> menu_sales(String sales_date) throws Exception;

}
