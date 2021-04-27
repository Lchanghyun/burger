package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.TodayOrder;
import com.one.burger.entity.TodayOrderMenu;
import com.one.burger.repository.TodayOrderRepository;

@Service
public class TodayOrderServiceImpl implements TodayOrderService{
	@Autowired
	private TodayOrderRepository todayRepository;
	
	public List<TodayOrder> orderList(Integer branch_no) throws Exception{
		return todayRepository.orderList(branch_no);
	}
	public List<TodayOrderMenu> orderMenuList(Integer order_no) throws Exception{
		return todayRepository.orderMenuList(order_no);
	}
	public void updateStatus(Integer order_no, Integer branch_no) throws Exception{
		todayRepository.updateStatus(order_no, branch_no);
	}
	public String getBranchName(Integer branch_no) throws Exception{
		return todayRepository.getBranchName(branch_no);
	}
}
