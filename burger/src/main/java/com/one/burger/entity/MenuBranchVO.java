package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuBranchVO {
	private int menu_no;
	private String menu_name;
	private int menu_price;
	private String category;
	private int branch_no;
	private String menu_status;
	private String upload_name;
	private String save_name;
}
