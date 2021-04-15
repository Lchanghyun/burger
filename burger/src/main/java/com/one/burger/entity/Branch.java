package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Branch {
	private int branch_no;
	private int super_no;
	private String branch_name;
	private String branch_id;
	private String branch_pw;
	private String branch_address;
}
