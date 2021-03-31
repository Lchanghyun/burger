package com.one.burger.entity;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class MenuPhoto {
	private int photo_no;
	private int menu_no;
	private String upload_name;
	private String save_name;
	private int file_size;
	private String save_type;
}
