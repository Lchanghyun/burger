package com.one.burger.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.MyOrder;
import com.one.burger.entity.MyOrderDetail;
import com.one.burger.repository.MyOrderRepository;

@Service
public class MyOrderServiceImpl implements MyOrderService{
	@Autowired
	private MyOrderRepository myorderRepository;
	
	@Override
	public List<MyOrder> myorderListCount(Integer member_no) throws Exception{
		return myorderRepository.myorderListCount(member_no);
	}
	@Override
	public List<MyOrderDetail> myorderDetail(Integer order_no, Integer member_no) throws Exception{
		return myorderRepository.myorderDetail(order_no, member_no);
	}
	@Override
	public Map<String, String> getOneMenu(Integer order_no, Integer member_no) throws Exception {
		List<MyOrderDetail> list = myorderRepository.myorderDetail(order_no, member_no);
		Map<String,String> data = new HashMap<>();
		for(MyOrderDetail menu : list) {
			if(menu.getCategory().equals("햄버거")) {
				data.put("menu_name",menu.getMenu_name());
				data.put("save_name",menu.getSave_name());
				break;
			}
		}
		return data;
	}
}
