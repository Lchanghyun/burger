package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.TodayOrder;
import com.one.burger.entity.TodayOrderMenu;

public interface TodayOrderService {
	public List<TodayOrder> orderList(Integer branch_no) throws Exception;
	public List<TodayOrderMenu> orderMenuList(Integer order_no) throws Exception;
	public void updateStatus(Integer order_no, Integer branch_no) throws Exception;
	public String getBranchName(Integer branch_no) throws Exception;
}
