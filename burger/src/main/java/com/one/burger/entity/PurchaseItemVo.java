package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PurchaseItemVo {
	
	private String item_name;
	private String category;
	private int count;
	private int item_price;
	private int pi_no;
}
