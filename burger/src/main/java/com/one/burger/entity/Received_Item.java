package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Received_Item {

	private int receive_no;
	private int purchase_no;
	private int branch_no;
	private int item_no;
	private int count;
	private Date receive_date;
}
