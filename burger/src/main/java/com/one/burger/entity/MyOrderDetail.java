package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyOrderDetail {
	private int count;
	private String menu_name;
	private int menu_price;
	private String category;
	private String save_name;
}
