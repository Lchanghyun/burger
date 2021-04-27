package com.one.burger.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsBranchMenuVo {
	private int goods_no;
	private int order_no;
	private int member_no;
	private int branch_no;
	private int bm_no;
	private int count;
	private int menu_no;
	private String menu_status;
	private String menu_name;
	private int menu_price;
	private String category;
	private MultipartFile file;
}
