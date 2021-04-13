package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReceivedItemVo {
	
	private int item_no;
	private String item_name;
	private int item_price;
	private String category;
	private int count;
	private Date received_date;
}
