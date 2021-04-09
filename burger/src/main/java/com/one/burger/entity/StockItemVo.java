package com.one.burger.entity;

import java.sql.Date;


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
	private Date stock_date;
}
