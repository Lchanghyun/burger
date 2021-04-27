package com.one.burger.entity;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StockItemVo {
	private int branch_no;
	private int item_no;
	private String category;
	private String item_name;
	private int item_price;
	private int stock_count;
	private char status;
	private Date stock_date;
	
	private List<StockItemVo> stockItemVo_list;
	
}
