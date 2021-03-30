package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Purchase {
	private int purchase_no;
	private int branch_no;
	private int super_no;
	private Date purchase_date;
	private String status;
}
