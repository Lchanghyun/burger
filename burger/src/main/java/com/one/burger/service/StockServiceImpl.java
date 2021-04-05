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
	public int getSeq() throws Exception {
		return stockRepository.getSeq();
	}
	
	@Override
	public void insert(Stock stock) throws Exception {
		int stock_no=stockRepository.getSeq();
		stock.setStock_no(stock_no);
		
		//int branch_no= 세션값 받아서 넣어주기
		stockRepository.insert(stock);
	}

}
