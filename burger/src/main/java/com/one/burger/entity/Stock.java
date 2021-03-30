package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
public class Stock {
	private int stock_no;
	private int branch_no;
	private int super_no;
	private int item_no;
	private int stock_count;
}