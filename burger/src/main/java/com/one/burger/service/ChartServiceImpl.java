package com.one.burger.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.one.burger.entity.BranchTotalSales;
import com.one.burger.entity.Branch;
import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.repository.ChartRepository;
import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.repository.MenuRepository;
import lombok.extern.java.Log;
 
@Log
@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartRepository chartRepository;
	@Autowired
	private MenuRepository menuRepository;
	
	@Override
	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception{
		List<SalesSuperTotal> result = chartRepository.getSalesTotal(choiceDate);
		List<Branch> totalbranch = chartRepository.getTotalbranch();
		int test = 0;
		for(Branch temp : totalbranch) {
			for(SalesSuperTotal num : result) {
				if(temp.getBranch_no() == num.getBranch_no()) {
					test = 1;
					break;
				}
			}
			if(test==0) {
				SalesSuperTotal data = new SalesSuperTotal();
				data.setBranch_no(temp.getBranch_no());
				data.setBranch_name(temp.getBranch_name());
				data.setTotal(0);
				result.add(data);
			}
			test=0;
		}
		Comparator<SalesSuperTotal> sort = new Comparator<SalesSuperTotal>() {
			@Override
			public int compare(SalesSuperTotal a, SalesSuperTotal b) {
				return a.getBranch_name().compareTo(b.getBranch_name());
			}
		};
		Collections.sort(result, sort);
		return result;
	}
	
	@Override
	public List<MenuBranchMenuGoodsVo> menu_sales(String sales_date) throws Exception {
		log.info("menu_sales(repository) : !");
		Map<String, Object> param = new HashMap<>();
		List<Menu> menu_list = menuRepository.all_list();
		log.info("menu_list : " + menu_list);
		List<MenuBranchMenuGoodsVo> result = new ArrayList<>();
		param.put("day",sales_date);
		for(Menu menu : menu_list) {
			param.put("menu_no", menu.getMenu_no());
			result.add(chartRepository.menu_sales(param));
			log.info("result : " + result);
			param.remove("menu_no");
		}
		
		return result;
	}
 
	@Override
	public List<BranchTotalSales> total_sales(Map<String, Object> param) throws Exception {
		log.info("total_sales()");
		
		List<BranchTotalSales> list =chartRepository.branch_total(param);
		
		return list ;
	}
} 
