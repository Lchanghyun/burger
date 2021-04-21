package com.one.burger.service;

import java.util.List;
import java.util.Map;

import com.one.burger.entity.MyOrder;
import com.one.burger.entity.MyOrderDetail;

public interface MyOrderService {
	public List<MyOrder> myorderListCount(Integer member_no) throws Exception;
	public List<MyOrderDetail> myorderDetail(Integer order_no, Integer member_no) throws Exception;
	public Map<String,String> getOneMenu(Integer order_no, Integer member_no) throws Exception;
}
