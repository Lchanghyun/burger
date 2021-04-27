package com.one.burger.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.one.burger.entity.BranchTotalSales;
import com.one.burger.repository.ChartRepository;
import com.one.burger.entity.Menu;
import com.one.burger.entity.MenuBranchMenuGoodsVo;
import com.one.burger.repository.ChartRepository;
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
	public List<BranchTotalSales> total_sales(int branch_no) throws Exception {
		log.info("total_sales()");
		Map<String, Object> param = new HashMap<>();
		String Year = "2021";
		param.put("year", Year);
		param.put("branch_no", branch_no);
		List<BranchTotalSales> list =chartRepository.branch_total(param);
		
		return list ;
	}
} 
