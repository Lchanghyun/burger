package com.one.burger.entity;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class BranchMenuChart {
	private String menu_name;
	private int menu_price;
	private int menu_total_price;
	private String sales_time;
}
