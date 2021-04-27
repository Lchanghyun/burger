package com.one.burger.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MyOrder {
	private int order_no;
	private Timestamp today_time;
	private int total_price;
	private String status;
	private String branch_name;
	private int count;
}
