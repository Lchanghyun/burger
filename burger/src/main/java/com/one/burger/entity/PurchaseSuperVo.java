package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class PurchaseSuperVo {
	private int branch_no;
	private String branch_name;
	private int purchase_no;
	private int super_no;
	private Date purchase_date;
	private String status;
}
