package com.one.burger.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Menu {
	private int menu_no;
	private String menu_name;
	private int menu_price;
	private String category;
	private MultipartFile file;
}
