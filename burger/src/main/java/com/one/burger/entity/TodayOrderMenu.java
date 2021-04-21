package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TodayOrderMenu {
	private int order_no;
	private int bm_no;
	private int count;
	private int menu_no;
	private String menu_name;
}
