package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuPhotoVO {
	private int menu_no;
	private String menu_name;
	private int menu_price;
	private String category;
	private String upload_name;
	private String save_name;
}
