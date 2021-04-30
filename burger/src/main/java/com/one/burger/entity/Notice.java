package com.one.burger.entity;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//공지사항 entity
public class Notice {
	private int notice_no;
	private int super_no;
	private String notice_title;
	private String notice_content;
	private Date notice_date;
	private String notice_category;
}


