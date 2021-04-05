package com.one.burger.entity;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuBranchMenuVo {
	private int bm_no;
	private int branch_no;
	private int menu_no;
	private String menu_status;
	private String menu_name;
	private int menu_price;
	private String category;
	private int photo_no;
	private String upload_name;
	private String save_name;
	private long file_size;
	private String save_type;

}
