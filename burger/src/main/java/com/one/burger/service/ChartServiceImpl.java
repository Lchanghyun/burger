package com.one.burger.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.BranchTotalSales;
import com.one.burger.repository.ChartRepository;

import lombok.extern.java.Log;

@Log
@Service
public class ChartServiceImpl implements ChartService{

	@Autowired
	private ChartRepository chartRepository;
 
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
