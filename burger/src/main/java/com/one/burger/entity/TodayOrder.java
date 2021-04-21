package com.one.burger.entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TodayOrder {
	private int order_no;
	private int member_no;
	private int branch_no;
	private int today_num;
	private Timestamp today_time;
	private int total_price;
	private String status;
	private String price_status;
}
