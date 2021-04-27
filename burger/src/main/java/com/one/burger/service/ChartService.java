package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.MenuBranchMenuGoodsVo;

public interface ChartService {
	public List<MenuBranchMenuGoodsVo> menu_sales(String sales_date) throws Exception;
}
