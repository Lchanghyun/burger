package com.one.burger.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.one.burger.entity.Stock;
import com.one.burger.entity.StockItemVo;
import com.one.burger.repository.StockRepository;

@Service
public class StockServiceImpl implements StockService {
	
	@Autowired
	private StockRepository stockRepository;

	@Override
	public List<StockItemVo> select() throws Exception {
		return stockRepository.select();
	}

	@Override
	public void insert(Stock stock) throws Exception {
		stockRepository.insert(stock);
	}
}
