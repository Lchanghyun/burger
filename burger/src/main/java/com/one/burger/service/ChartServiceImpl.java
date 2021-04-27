package com.one.burger.service;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Branch;
import com.one.burger.entity.SalesSuperTotal;
import com.one.burger.repository.ChartRepository;

import lombok.extern.java.Log;

@Log
@Service
public class ChartServiceImpl implements ChartService{
	@Autowired
	private ChartRepository chartRepository;
	
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
}
