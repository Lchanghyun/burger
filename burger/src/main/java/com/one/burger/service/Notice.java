package com.one.burger.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
//공지사항 entity
public class Notice {
	private int notice_no;
	private int super_no;
	private String title;
	private String content;
	private Date notice_date;
}
