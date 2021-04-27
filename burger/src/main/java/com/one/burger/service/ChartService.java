package com.one.burger.service;

import java.util.List;

import com.one.burger.entity.SalesSuperTotal;

public interface ChartService {
	public List<SalesSuperTotal> getSalesTotal(String choiceDate) throws Exception;
}
