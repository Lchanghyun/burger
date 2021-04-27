package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.BranchTotalSales;

public interface ChartService {

	public List<BranchTotalSales> total_sales(int branch_no) throws Exception;



}
