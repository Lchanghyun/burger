package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseItemVo {
	
	private int purchase_no;
	private int item_no;
	private String item_name;
	private int item_price;
	private String category;
	private int count;
}
