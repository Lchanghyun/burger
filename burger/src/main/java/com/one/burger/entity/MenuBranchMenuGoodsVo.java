package com.one.burger.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuBranchMenuGoodsVo {
	private String menu_name;
	private long total_sales;
	private String sales_time;
}
