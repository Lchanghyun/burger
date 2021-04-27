package com.one.burger.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.TodayOrder;
import com.one.burger.entity.TodayOrderChart;
import com.one.burger.entity.TodayOrderMenu;
import com.one.burger.repository.TodayOrderRepository;

@Service
public class TodayOrderServiceImpl implements TodayOrderService{
	@Autowired
	private TodayOrderRepository todayRepository;
	
	@Override
	public List<TodayOrder> orderList(Integer branch_no) throws Exception{
		return todayRepository.orderList(branch_no);
	}
	@Override
	public List<TodayOrderMenu> orderMenuList(Integer order_no) throws Exception{
		return todayRepository.orderMenuList(order_no);
	}
	@Override
	public void updateStatus(Integer order_no, Integer branch_no) throws Exception{
		todayRepository.updateStatus(order_no, branch_no);
	}
	@Override
	public String getBranchName(Integer branch_no) throws Exception{
		return todayRepository.getBranchName(branch_no);
	}
	@Override
	public List<Map<String,Object>> getChart(Integer branch_no, String category, String menu_name) throws Exception{
		List<TodayOrderChart> result;
		List<Map<String,Object>> list = new ArrayList<>();
		if(category != null) {
			result = todayRepository.getChart(branch_no, category, null, null);
			int total=0;
			for(TodayOrderChart today:result) {
				total += today.getTotalcount();
			}
			for(TodayOrderChart today:result) {
				Map<String,Object> map = new HashMap<>();
				map.put("menuName",today.getMenu_name());
				map.put("percent",(today.getTotalcount()/(float)total)*100);
				list.add(map);
			}
		}
		else {
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR);
			int month = c.get(Calendar.MONTH)+1;
			int date = c.get(Calendar.DATE);
			
			String day;
			int minus = 6;
			for(int i=0; i<7; i++) {
				if(month < 10) {
					if(date-minus < 10) {
						day = year+"/0"+month+"/0"+(date-minus);
					}
					else {
						day = year+"/0"+month+"/"+(date-minus);
					}
				}
				else {
					if(date-minus < 10) {
						day = year+"/"+month+"/0"+(date-minus);
					}
					else {
						day = year+"/"+month+"/"+(date-minus);
					}
				}
				minus--;
				result = todayRepository.getChart(branch_no, null, menu_name, day);
				Map<String,Object> map = new HashMap<>();
				map.put("date",day.substring(5));
				if(result.size() == 0) {
					map.put("count", 0);
				}
				else {
					map.put("count", result.get(0).getTotalcount());
				}
				list.add(map);
			}
		}
		return list;
	}
	
}
