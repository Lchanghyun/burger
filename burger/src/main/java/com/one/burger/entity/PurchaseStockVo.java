package com.one.burger.entity;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseStockVo {
	String item_name;
	String category;
	int item_price;
	int stock_no;
	
}
